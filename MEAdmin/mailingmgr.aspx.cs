// --------------------------------------------------------------------------------
// Copyright AspDotNetStorefront.com. All Rights Reserved.
// http://www.aspdotnetstorefront.com
// For details on this license please visit the product homepage at the URL above.
// THE ABOVE NOTICE MUST REMAIN INTACT. 
// --------------------------------------------------------------------------------
using System;
using System.Data;
using System.Collections.Generic;
using System.Globalization;
using System.Text;
using System.Threading;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using AspDotNetStorefrontCore;
using System.Data.SqlClient;
using AspDotNetStorefrontControls;
using AspDotNetStorefrontCommon;

namespace AspDotNetStorefrontAdmin
{

    /// <summary>
    /// Summary description for mailingmgr
    /// </summary>
    public partial class mailingmgr : AdminPageBase
    {
        #region Private variables

        #endregion

        #region Events

        /// <summary>
        /// Default Page Load Event
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, System.EventArgs e)
        {
            Response.CacheControl = "private";
            Response.Expires = 0;
            Response.AddHeader("pragma", "no-cache");
            Server.ScriptTimeout = 50000;
            SectionTitle = "EMail Manager";

            //Images in mailings must have Absolute URLs
            radDescription.EnableFilter(Telerik.Web.UI.EditorFilters.MakeUrlsAbsolute);

            if (AppLogic.ProductIsMLX())
            {
                Response.Redirect(AppLogic.AdminLinkUrl("restrictedfeature.aspx"));
            }

            if (!IsPostBack)
            {
                bool processing = false;

                //Check to see if we have any mailing manager jobs running
                if (AsyncDataStore.RetrieveRecord(Session.SessionID) != null)
                {
                    //The data store DOES contain records - lets see if it is completed
                    try
                    {
                        String[] Status = AsyncDataStore.RetrieveRecord(Session.SessionID).ToString().Split(',');

                        if (Status[0] != Status[1])
                        {
                            //Not completed.  Show status, and disable buttons.
                            ifrStatus.Visible = true;
                            ifrStatus.Attributes["src"] = "asyncstatus.aspx?id=" + Session.SessionID;
                            ltError.Text = AppLogic.GetString("admin.mailingmgr.BulkMailSending", ThisCustomer.LocaleSetting);

                            btnRemoveEmail.Enabled = false;
                            btnSend.Enabled = false;

                            processing = true;
                        }
                    }
                    catch { }
                }

                if (!processing && CommonLogic.QueryStringNativeInt("completed") == 1)
                {
                    //Page reloaded due to having completed processing a bulk send

                    ltError.Text = AppLogic.GetString("admin.asyncstatus.Complete", ThisCustomer.LocaleSetting);
                    divStatus.Attributes["class"] = "noticeMsg";
                }

            }
            else
            {

            }
        }

        /// <summary>
        /// Handles the send button OnClick event
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSend_Click(object sender, EventArgs e)
        {
            bool testOnly = (rbTestOnly.SelectedValue == "1");
            bool withOrdersOnly = (rbCustomersWithOrder.SelectedValue == "1");
            bool listOnly = (rbListCustomers.SelectedValue == "1");
            bool newsLetter = (rbNewsletter.SelectedValue == "1");
            string mailSubject = txtSubject.Text;
            string mailBody = radDescription.Content;
            string mailFooter = new Topic("mailfooter").Contents;

            StringBuilder emailListText = new StringBuilder();
            List<EMail> mailingList = new List<EMail>();

            if (newsLetter)
            {
                mailingList = EMail.NewsLetterMailingList();
            }
            else
            {
                mailingList = EMail.MailingList(BulkMailTypeEnum.EmailBlast, withOrdersOnly, mailSubject);
            }

            if (listOnly)
            {
                List<GridCustomer> l = GridCustomer.GetCustomers();

                //List<GridProductVariant> l = GridProductVariant.GetAllVariants(false, AppLogic.EntityType.Unknown, 0);

                List<object> newList = l.ConvertAll<object>(delegate(GridCustomer g) { return (object)g; });

                Response.Clear();
                Response.ClearHeaders();
                Response.ClearContent();
                Response.AddHeader("content-disposition", "attachment; filename=MailingList.csv");
                Response.ContentType = "text/csv";
                Response.AddHeader("Pragma", "public");
                Response.Write(CSVExporter.ExportListToCSV(newList));
                Response.End();

            }
            else
            {
                //Send a single message to the currently logged in user
                if (testOnly)
                {
                    EMail objEmail = new EMail();

					objEmail.RecipientID = ThisCustomer.CustomerID;
					objEmail.RecipientGuid = ThisCustomer.CustomerGUID;
                    objEmail.EmailAddress = ThisCustomer.EMail;
                    objEmail.MailSubject = mailSubject;
                    objEmail.MailContents = mailBody;
                    objEmail.MailFooter = (new Topic("mailfooter").Contents);
                    objEmail.IncludeFooter = true;
                    objEmail.LogMessage = true;

                    objEmail.Send();
                }
                //Sending Emails
                else
                {
                    BulkMailing bm = new BulkMailing(mailingList, mailBody, mailSubject, mailFooter, true, Session.SessionID);

                    if (bm.MailingList.Count > 0)
                    {

                        BulkMailing.ExecuteAsyncBulkSend executeAsyncSend = new BulkMailing.ExecuteAsyncBulkSend(bm.ExecuteBulkSend);

                        //We will check status in case the operation finishes and we need to re-enable buttons, etc.
                        AsyncCallback cb = new AsyncCallback(MailingComplete);

                        IAsyncResult result = executeAsyncSend.BeginInvoke(cb, null);

                        ifrStatus.Attributes["src"] = "asyncstatus.aspx?id=" + Session.SessionID;
                        ifrStatus.Visible = true;

                        ltError.Text = AppLogic.GetString("admin.mailingmgr.BulkMailSending", ThisCustomer.LocaleSetting);

                        btnRemoveEmail.Enabled = false;
                        btnSend.Enabled = false;
                    }
                    else
                    {
                        btnRemoveEmail.Enabled = true;
                        btnSend.Enabled = true;

                        ifrStatus.Visible = false;

                        ltError.Text = AppLogic.GetString("admin.mailingmgr.NoEmails", ThisCustomer.LocaleSetting);
                    }
                }
            }
        }


        /// <summary>
        /// Sets the provided customer's OkToEmail flag to false
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnRemoveEmail_Click(object sender, EventArgs e)
        {
            DB.ExecuteSQL("update customer set OKToEMail=0 where EMail=" + DB.SQuote(txtRemoveEmail.Text));
        }

        #endregion

        public void MailingComplete(IAsyncResult ar)
        {
            BulkMailing.ExecuteAsyncBulkSend executeAsyncSend = (BulkMailing.ExecuteAsyncBulkSend)((AsyncResult)ar).AsyncDelegate;
            executeAsyncSend.EndInvoke(ar);
        }

    }
}
