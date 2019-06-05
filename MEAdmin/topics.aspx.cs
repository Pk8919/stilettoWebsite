// --------------------------------------------------------------------------------
// Copyright AspDotNetStorefront.com. All Rights Reserved.
// http://www.aspdotnetstorefront.com
// For details on this license please visit the product homepage at the URL above.
// THE ABOVE NOTICE MUST REMAIN INTACT. 
// --------------------------------------------------------------------------------
using System;
using System.Collections;
using System.Data;
using System.Drawing;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AspDotNetStorefrontCore;
using System.Data.SqlClient;
using Telerik.Web.UI;

namespace AspDotNetStorefrontAdmin
{
    public partial class topics : AdminPageBase
    {
        #region Event Handlers
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.CacheControl = "private";
            Response.Expires = 0;
            Response.AddHeader("pragma", "no-cache");

            if (!IsPostBack)
            {
                BindData();
            }
        }
        protected void TopicEditor_TopicCopiedToStore(object sender, TopicEditEventArgs e)
        {
            loadTree(e.TopicId);
            TopicEditor.LoadTopic(e.TopicId);
        }
        protected void TopicEditor_TopicAdded(object sender, TopicEditEventArgs e)
        {
            loadTree(e.TopicId);
            TopicEditor.LoadTopic(e.TopicId);
        }
        protected void TopicEditor_TopicSaved(object sender, TopicEditEventArgs e)
        {
            if (e.NameChanged)
                loadTree(e.TopicId);
            TopicEditor.LoadTopic(e.TopicId);
        }
        protected void TopicEditor_TopicDeleted(object sender, TopicEditEventArgs e)
        {
            loadTree();
        }
        protected void TopicEditor_TopicNuked(object sender, TopicEditEventArgs e)
        {
            loadTree();
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            TopicEditor.Visible = true;
            TopicEditor.LoadTopic(0);
        }
        protected void treeMain_SelectedNodeChanged(object sender, EventArgs e)
        {
            TopicEditor.Visible = true;
            int topicid;
            if (int.TryParse(treeMain.SelectedNode.Value, out topicid))
            {
                TopicEditor.LoadTopic(topicid);
            }
        }
        protected void ddlPageLocales_SelectedIndexChanged(object sender, EventArgs e)
        {
            TopicEditor.LocaleSetting = ddlPageLocales.SelectedValue;
        }
        #endregion

        #region Private Methods
        private void BindData()
        {
            loadTree();
            loadDD();
        }
        private void loadDD()
        {
            using (SqlConnection conn = new SqlConnection(DB.GetDBConn()))
            {
                conn.Open();
                using (IDataReader thisReader = DB.GetRS("select Name from LocaleSetting with (NOLOCK) order by DisplayOrder,Description", conn))
                {
                    while (thisReader.Read())
                    {
                        ddlPageLocales.Items.Add(new ListItem(DB.RSField(thisReader, "Name"), DB.RSField(thisReader, "Name")));
                    }
                }
            }
            ddlPageLocales.Items.FindByValue(Localization.GetDefaultLocale()).Selected = true;
            divPageLocale.Visible = ddlPageLocales.Items.Count > 1;
        }
        private void loadTree() { loadTree(0); }
        private void loadTree(int selectedTopic)
        {
            List<Store> storeList = Store.GetStoreList();
            Dictionary<int, String> storeNames = new Dictionary<int, string>();
            foreach (Store s in storeList)
                storeNames.Add(s.StoreID, s.Name);

            try
            {
                treeMain.Nodes.Clear();
                //DATABASE TOPICS
                string sql = string.Format("select * from Topic with (NOLOCK) where deleted=0 order by Name ASC");

                using (SqlConnection conn = new SqlConnection(DB.GetDBConn()))
                {
                    conn.Open();
                    using (IDataReader rs = DB.GetRS(sql, conn))
                    {
                        while (rs.Read())
                        {
                            string name = string.Empty;
                            name = DB.RSFieldByLocale(rs, "Name", ThisCustomer.LocaleSetting);
                            int StoreID = DB.RSFieldInt(rs, "StoreID");
                            TreeNode myNode = new TreeNode();
                            myNode.Text = CommonLogic.IIF(name.Equals(string.Empty), "[Not Set for this Locale]", name);
                            if (Store.StoreCount > 1)
                            {
                                if (StoreID == 0)
                                    myNode.Text += " (<b>Default</b>)";
                                else if (storeNames.ContainsKey(StoreID))
                                    myNode.Text += " (" + storeNames[StoreID] + ")";
                                else
                                    myNode.Text += " (" + StoreID.ToString() + ")";
                            }
                            int tid = DB.RSFieldInt(rs, "TopicID");
                            myNode.Value = tid.ToString();
                            myNode.ImageUrl = AppLogic.LocateImageURL("~/App_Themes/Admin_Default/images/icons/dot.gif");
                            myNode.Selected = tid == selectedTopic;
                            treeMain.Nodes.Add(myNode);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                resetError(ex.ToString(), true);
            }
        }
        protected void resetError(string error, bool isError)
        {
            string str = AppLogic.GetString("admin.topic.notice", SkinID, LocaleSetting);
            if (isError)
            {
                str = AppLogic.GetString("admin.common.Error", SkinID, LocaleSetting);
            }
            if (error.Length > 0)
            {
                str += error + "";
            }
            else
            {
                str = "";
            }
            ltError.Text = str;
        }
        #endregion
    }
}
