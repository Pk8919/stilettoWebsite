// --------------------------------------------------------------------------------
// Copyright AspDotNetStorefront.com. All Rights Reserved.
// http://www.aspdotnetstorefront.com
// For details on this license please visit the product homepage at the URL above.
// THE ABOVE NOTICE MUST REMAIN INTACT. 
// --------------------------------------------------------------------------------
using System;
using System.Web;
using System.Data;
using System.Text;
using System.Xml;
using System.Xml.Serialization;
using System.Globalization;
using System.Collections;
using System.IO;
using AspDotNetStorefrontCore;
using AspDotNetStorefrontGateways;
using AspDotNetStorefrontGateways.Processors;
using System.Data.SqlClient;

namespace AspDotNetStorefrontAdmin
{
    /// <summary>
    /// Summary description for recurring.
    /// </summary>
    public partial class recurring : AdminPageBase
    {

        // NOTE: THIS PAGE DOES NOT PROCESS GATEWAY AUTOBILL RECURRING ORDERS!
        // NOTE: USE THE RECURRINGIMPORT.ASPX PAGE FOR THOSE!!
        
        protected void Page_Load(object sender, System.EventArgs e)
        {
            Response.CacheControl = "private";
            Response.Expires = 0;
            Response.AddHeader("pragma", "no-cache");

            /****************************************************************************/
            // * WARNING TO DEVELOPERS
            // * The redirect below is a SAFETY feature.  Removing the redirect will not
            // * enable ML-only features on a lower version of AspDotNetStorefront.
            // * Attempting to do so can very easily result in a partially implemented
            // * feature, invalid or incomplete data in your DB, and other serious 
            // * conditions that will cause your store to be non-functional.
            // *
            // * If you break your store attempting to enable ML-only features in PRO or
            // * Standard, our staff cannot help you fix it, and it will also invalidate
            // * your AspDotNetStorefront License.
            /***************************************************************************/

            if (!AppLogic.m_ProductIsML())
            {
                AppLogic.AdminLinkUrl("restrictedfeature.aspx");
            }

            SectionTitle = "Recurring Shipments " + CommonLogic.IIF(!CommonLogic.QueryStringCanBeDangerousContent("Show").Equals("ALL", StringComparison.InvariantCultureIgnoreCase), AppLogic.GetString("admin.recurring.DueToday", SkinID, LocaleSetting), AppLogic.GetString("admin.recurring.AllPending", SkinID, LocaleSetting));

            RenderMarkup();
        }

        private void RenderMarkup()
        {
            StringBuilder output = new StringBuilder();

            if (CommonLogic.QueryStringBool("ProcessAll"))
            {
                using (SqlConnection conn = DB.dbConn())
                {
                    conn.Open();
                    using (IDataReader rsp = DB.GetRS("Select distinct(OriginalRecurringOrderNumber) from ShoppingCart where RecurringSubscriptionID='' and CartType=" + ((int)CartTypeEnum.RecurringCart).ToString() + " and NextRecurringShipDate<" + DB.SQuote(Localization.ToDBShortDateString(System.DateTime.Now.AddDays(1))), conn))
                    {
                        RecurringOrderMgr rmgr = new RecurringOrderMgr(EntityHelpers, GetParser);
                        while (rsp.Read())
                        {
                            output.Append(String.Format(AppLogic.GetString("admin.recurring.ProcessingNextOccurrence", SkinID, LocaleSetting),DB.RSFieldInt(rsp, "OriginalRecurringOrderNumber").ToString()));
                            output.Append(rmgr.ProcessRecurringOrder(DB.RSFieldInt(rsp, "OriginalRecurringOrderNumber")));
                            output.Append("...<br/>");
                        }
                    }
                }
            }

            int OriginalRecurringOrderNumber = CommonLogic.QueryStringUSInt("OriginalRecurringOrderNumber");
            int ProcessCustomerID = CommonLogic.QueryStringUSInt("ProcessCustomerID");

            if (ProcessCustomerID != 0 && OriginalRecurringOrderNumber != 0)
            {
                output.Append(String.Format(AppLogic.GetString("admin.recurring.ProcessingNextOccurrence", SkinID, LocaleSetting),OriginalRecurringOrderNumber.ToString()));
                RecurringOrderMgr rmgr = new RecurringOrderMgr(EntityHelpers, GetParser);
                output.Append(rmgr.ProcessRecurringOrder(OriginalRecurringOrderNumber));
                output.Append("...<br/>");
            }

            output.Append("<br/><ul>");
            bool PendingOnly = (!CommonLogic.QueryStringCanBeDangerousContent("Show").Equals("ALL", StringComparison.InvariantCultureIgnoreCase));

            if (PendingOnly)
            {
                if (DB.GetSqlN("Select count(*) as N from ShoppingCart   with (NOLOCK)  where RecurringSubscriptionID='' and CartType=" + ((int)CartTypeEnum.RecurringCart).ToString() + " and NextRecurringShipDate<" + DB.SQuote(Localization.ToDBDateTimeString(System.DateTime.Now.AddDays(1)))) > 0)
                {
                    output.Append("<li><b><a href=\"" + AppLogic.AdminLinkUrl("recurring.aspx") + "?processall=true\">" + AppLogic.GetString("admin.recurring.ProcessChargesAll", SkinID, LocaleSetting) + "</a></b> " + AppLogic.GetString("admin.recurring.ProcessChargesSingle", SkinID, LocaleSetting) + "</li>");
                }
                else
                {
                    output.Append("<li><b>" + AppLogic.GetString("admin.recurring.NoRecurringShipmentsDueToday", SkinID, LocaleSetting) + "</b></li>");
                }
            }
            else
            {
                if (DB.GetSqlN("Select count(*) as N from ShoppingCart   with (NOLOCK)  where RecurringSubscriptionID='' and CartType=" + ((int)CartTypeEnum.RecurringCart).ToString()) == 0)
                {
                    output.Append("<li><b>" + AppLogic.GetString("admin.recurring.NoActiveRecurringOrdersFound", SkinID, LocaleSetting) + "</b></li>");
                }
            }
            if (AppLogic.AppConfigBool("Recurring.UseGatewayInternalBilling"))
            {
                output.Append("<li><b>" + AppLogic.GetString("admin.recurring.NoteAutobillGatewayOrders", SkinID, LocaleSetting) + "</b></li>");
            }
            output.Append("</ul>");



            String CustomerList = ",";
            String sql = "Select CustomerID,nextrecurringshipdate from ShoppingCart  with (NOLOCK)  where RecurringSubscriptionID='' and CartType=" + ((int)CartTypeEnum.RecurringCart).ToString() + CommonLogic.IIF(PendingOnly, " and NextRecurringShipDate<" + DB.SQuote(Localization.ToDBShortDateString(System.DateTime.Now.AddDays(1))), "") + " order by nextrecurringshipdate desc";

            using (SqlConnection conn = DB.dbConn())
            {
                conn.Open();
                using (IDataReader rs = DB.GetRS(sql, conn))
                {
                    while (rs.Read())
                    {
                        if (CustomerList.IndexOf("," + DB.RSFieldInt(rs, "CustomerID").ToString() + ",") == -1)
                        {
                            Customer TargetCustomer = new Customer(DB.RSFieldInt(rs, "CustomerID"), true);
                            if (ShoppingCart.NumItems(TargetCustomer.CustomerID, CartTypeEnum.RecurringCart) != 0)
                            {
                                using (SqlConnection conn2 = DB.dbConn())
                                {
                                    conn2.Open();
                                    using (IDataReader rsr = DB.GetRS("Select distinct OriginalRecurringOrderNumber from ShoppingCart  with (NOLOCK)  where RecurringSubscriptionID='' and CartType=" + ((int)CartTypeEnum.RecurringCart).ToString() + CommonLogic.IIF(PendingOnly, " and NextRecurringShipDate<" + DB.SQuote(Localization.ToDBShortDateString(System.DateTime.Now.AddDays(1))), "") + " and CustomerID=" + TargetCustomer.CustomerID.ToString() + " order by OriginalRecurringOrderNumber desc", conn2))
                                    {
                                        while (rsr.Read())
                                        {
                                            output.Append(AppLogic.GetRecurringCart(EntityHelpers, GetParser, TargetCustomer, DB.RSFieldInt(rsr, "OriginalRecurringOrderNumber"), SkinID, false));
                                        }
                                    }
                                }
                            }
                        }

                        CustomerList += DB.RSFieldInt(rs, "CustomerID").ToString() + ",";
                    }
                }
            }

            ltContent.Text = output.ToString();
        }

    }
}
