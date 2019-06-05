// --------------------------------------------------------------------------------
// Copyright AspDotNetStorefront.com. All Rights Reserved.
// http://www.aspdotnetstorefront.com
// For details on this license please visit the product homepage at the URL above.
// THE ABOVE NOTICE MUST REMAIN INTACT. 
// --------------------------------------------------------------------------------
using System;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Xml;
using System.IO;
using System.Xml.Xsl;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using AspDotNetStorefrontCore;
using System.Globalization;
using AspDotNetStorefrontControls;
using ComponentArt.Web.UI;
using System.Web.UI;

namespace AspDotNetStorefront
{
    /// <summary>
    ///		This is the "code behind" for the skin user control (usually template.ascx) to provide menu building logic, or 
    ///		any other common logic required. The code is placed in this class, and the user control is derived from this class
    ///		so users can create new skins WITHOUT having to recompile, or even have VS.NET, etc...
    /// </summary>
    public class TemplateBase : System.Web.UI.UserControl
    {

        protected PlaceHolder PageContent;        
        protected System.Web.UI.WebControls.Menu aspnetMenu;
        protected Literal SectionTitle;
        protected ComponentArt.Web.UI.Menu PageMenu;
        protected ComponentArt.Web.UI.Menu VertMenu;
        protected ComponentArt.Web.UI.TreeView PageTree;
        protected ScriptManager scrptMgr;
        protected PlaceHolder ctrlMinicart;
        protected PollControl ctrPoll;

        public new SkinBase Page
        {
            get
            {
                return (SkinBase)base.Page;
            }
        }

        /// <summary>
        /// Gets or sets the SectionTitle text
        /// </summary>
        public string SectionTitleText
        {
            get
            {
                if (SectionTitle != null)
                {
                    return SectionTitle.Text;
                }

                return string.Empty;
            }
            set
            {
                if (SectionTitle != null)
                {
                    SectionTitle.Text = value;
                }
            }
        }

        public PlaceHolder Content
        {
            get
            {
                return PageContent;
            }
        }

        public string CurrentEntity
        {
            get
            {
                return CommonLogic.Capitalize(CommonLogic.GetThisPageName(false).Replace("show", "").Replace(".aspx", "").ToLowerInvariant());
            }
        }

        public String ResourceMatchEvaluator(Match match)
        {
            String l = match.Groups[1].Value;
            string s = AppLogic.GetString(l, Page.SkinID, Page.ThisCustomer.LocaleSetting);
            if (s == null || s.Length == 0 || s == l)
            {
                s = match.Value;
            }
            return s;
        }

        public String ResourceMatchEvaluatorXmlEncoded(Match match)
        {
            String l = match.Groups[1].Value;
            string s = AppLogic.GetString(l, Page.SkinID, Page.ThisCustomer.LocaleSetting);
            if (s == null || s.Length == 0 || s == l)
            {
                s = match.Value;
            }
            return XmlCommon.XmlEncode(s);
        }

        /// <summary>
        /// Handles the PollVoteButtonClick event of the ctrlPoll control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
        protected void ctrlPoll_PollVoteButtonClick(object sender, EventArgs e)
        {
            PollControl ctrlPoll = sender as PollControl;
            if (ctrlPoll != null)
            {
                string pollAnswerID = HttpUtility.UrlEncode(ctrlPoll.SelectedValue);
                string pollID = HttpUtility.UrlEncode(ctrlPoll.PollID.ToString());

                string redirectUrl = string.Format("pollvote.aspx?PollID={0}&Poll_{0}={1}", pollID, pollAnswerID);
                Response.Redirect(redirectUrl);
            }
        }

        /// <summary>
        /// Initializes the poll control.
        /// </summary>
        protected void InitializePollControl()
        {
            int categoryID = CommonLogic.QueryStringUSInt("CategoryID");
            int sectionID = CommonLogic.QueryStringUSInt("SectionID");

            // Search for the ID that you set in template.master
            PollControl ctrPoll = this.FindControl("ctrlPoll") as PollControl;

            // Check if valid first
            if (ctrPoll != null)
            {
                // Assign datasource,image,text,css. 
                ctrPoll.DataSource = Poll.Find(Customer.Current.CustomerID, categoryID, sectionID, Customer.Current.SkinID, 0, Customer.Current.LocaleSetting, Customer.Current.IsRegistered);
                ctrPoll.HeaderBGColor = AppLogic.AppConfig("HeaderBGColor");
                ctrPoll.PollClass = AppLogic.AppConfig("BoxFrameStyle");
                ctrPoll.HeaderImage = string.Format("~/App_Themes/Skin_{0}/images/todayspoll.gif", Customer.Current.SkinID);
                ctrPoll.ButtonCssClass = "PollSubmit";
                ctrPoll.PollButtonText = AppLogic.GetString("polls.Vote", Customer.Current.SkinID, Customer.Current.LocaleSetting);
            }
        }


        private void Page_Load(object sender, EventArgs e)
        {
            bool showPoll = AppLogic.ProductIsMLExpress() == false && AppLogic.AppConfigBool("Polls.Enabled");

            if (!AppLogic.IsAdminSite && showPoll)
            {
                InitializePollControl();
            }

            if (PageMenu != null)
            {
                // get menu config file:
                String MN = string.Empty;
                if (AppLogic.ProductIsMLExpress() && AppLogic.IsAdminSite)
                {
                    MN = "expressMenuData.xml";
                }
                else
                {
                    MN = "menuData.xml";
                }

                if (AppLogic.IsAdminSite)
                {
                    if (Page.ThisCustomer.Notes.Trim().Length != 0 && Page.ThisCustomer.Notes.IndexOf(".xml", StringComparison.InvariantCultureIgnoreCase) != -1)
                    {
                        MN = Page.ThisCustomer.Notes.Trim();
                    }
                }

                String CacheName = String.Format("menudoc_{0}_{1}_{2}_{3}", AppLogic.IsAdminSite.ToString(), Page.SkinID.ToString(), Page.ThisCustomer.LocaleSetting, MN);
                XmlDocument doc = null;
                if (AppLogic.CachingOn)
                {
                    doc = (XmlDocument)HttpContext.Current.Cache.Get(CacheName);
                }
                if (doc == null)
                {

                    doc = new XmlDocument();

                    String MenuConfigFileString = CommonLogic.ReadFile(CommonLogic.SafeMapPath("skins/skin_" + Page.SkinID.ToString() + "/" + MN), false);

                    doc.LoadXml(MenuConfigFileString);

                    HierarchicalTableMgr tblMgr;

                    XmlNode rootNode = doc.SelectSingleNode("/SiteMap");


                    // Find Manufacturers menu top
                    XmlNode mNode = doc.DocumentElement.SelectSingleNode("//item[@Text='(!" + CommonLogic.IIF(AppLogic.IsAdminSite, "admin.", "") + "menu.Manufacturers!)']");
                    tblMgr = AppLogic.ManufacturerStoreEntityHelper[0].m_TblMgr;
                    if (tblMgr.NumRootLevelNodes <= AppLogic.MaxMenuSize())
                    {
                        AddEntityMenuXsl(doc, "Manufacturer", tblMgr, mNode, 0, String.Empty);
                    }
                    mNode = doc.DocumentElement.SelectSingleNode("//item[@Text='(!" + CommonLogic.IIF(AppLogic.IsAdminSite, "admin.", "") + "menu.Manufacturers0!)']");
                    if (tblMgr.NumRootLevelNodes <= AppLogic.MaxMenuSize())
                    {
                        AddEntityMenuXsl(doc, "Manufacturer", tblMgr, mNode, 0, "TopItemLook");
                    }

                    // Find Categories menu top
                    mNode = doc.DocumentElement.SelectSingleNode("//item[@Text='(!" + CommonLogic.IIF(AppLogic.IsAdminSite, "admin.", "") + "menu.Categories!)']");
                    AddEntityMenuXsl(doc, "Category", AppLogic.CategoryStoreEntityHelper[0].m_TblMgr, mNode, 0, String.Empty);
                    mNode = doc.DocumentElement.SelectSingleNode("//item[@Text='(!" + CommonLogic.IIF(AppLogic.IsAdminSite, "admin.", "") + "menu.Categories0!)']");
                    AddEntityMenuXsl(doc, "Category", AppLogic.CategoryStoreEntityHelper[0].m_TblMgr, mNode, 0, "TopItemLook");


                    // Find Sections menu top
                    mNode = doc.DocumentElement.SelectSingleNode("//item[@Text='(!" + CommonLogic.IIF(AppLogic.IsAdminSite, "admin.", "") + "menu.Sections!)']");
                    AddEntityMenuXsl(doc, "Section", AppLogic.SectionStoreEntityHelper[0].m_TblMgr, mNode, 0, String.Empty);
                    mNode = doc.DocumentElement.SelectSingleNode("//item[@Text='(!" + CommonLogic.IIF(AppLogic.IsAdminSite, "admin.", "") + "menu.Sections0!)']");
                    AddEntityMenuXsl(doc, "Section", AppLogic.SectionStoreEntityHelper[0].m_TblMgr, mNode, 0, "TopItemLook");

                    if (AppLogic.ProductIsMLX() && AppLogic.IsAdminSite)
                    {
                        mNode = doc.DocumentElement.SelectSingleNode("//item[@Text='(!" + CommonLogic.IIF(AppLogic.IsAdminSite, "admin.", "") + "menu.Currencies!)']");
                        mNode.ParentNode.RemoveChild(mNode);

                        mNode = doc.DocumentElement.SelectSingleNode("//item[@Text='(!" + CommonLogic.IIF(AppLogic.IsAdminSite, "admin.", "") + "menu.OrderRecurring!)']");
                        mNode.ParentNode.RemoveChild(mNode);

                        mNode = doc.DocumentElement.SelectSingleNode("//item[@Text='(!" + CommonLogic.IIF(AppLogic.IsAdminSite, "admin.", "") + "menu.OrderRecurringPending!)']");
                        mNode.ParentNode.RemoveChild(mNode);

                        mNode = doc.DocumentElement.SelectSingleNode("//item[@Text='(!" + CommonLogic.IIF(AppLogic.IsAdminSite, "admin.", "") + "menu.OrderRecurringImport!)']");
                        mNode.ParentNode.RemoveChild(mNode);

                        mNode = doc.DocumentElement.SelectSingleNode("//item[@Text='(!" + CommonLogic.IIF(AppLogic.IsAdminSite, "admin.", "") + "menu.ProductLoadFromXml!)']");
                        mNode.ParentNode.RemoveChild(mNode);

                        mNode = doc.DocumentElement.SelectSingleNode("//item[@Text='(!" + CommonLogic.IIF(AppLogic.IsAdminSite, "admin.", "") + "menu.ShippingZones!)']");
                        mNode.ParentNode.RemoveChild(mNode);

                        mNode = doc.DocumentElement.SelectSingleNode("//item[@Text='(!" + CommonLogic.IIF(AppLogic.IsAdminSite, "admin.", "") + "menu.RunSQL!)']");
                        mNode.ParentNode.RemoveChild(mNode);

                        mNode = doc.DocumentElement.SelectSingleNode("//item[@Text='(!" + CommonLogic.IIF(AppLogic.IsAdminSite, "admin.", "") + "menu.Mailing!)']");
                        mNode.ParentNode.RemoveChild(mNode);

                        mNode = doc.DocumentElement.SelectSingleNode("//item[@Text='(!" + CommonLogic.IIF(AppLogic.IsAdminSite, "admin.", "") + "menu.ProductEdit!)']");
                        mNode.ParentNode.RemoveChild(mNode);

                        mNode = doc.DocumentElement.SelectSingleNode("//item[@Text='(!" + CommonLogic.IIF(AppLogic.IsAdminSite, "admin.", "") + "menu.EventHandlerParameters!)']");
                        mNode.ParentNode.RemoveChild(mNode);


                    }

                    // not supported in PRO version
                    if (AppLogic.m_ProductIsML())
                    {
                        // Find Distributors menu top
                        mNode = doc.DocumentElement.SelectSingleNode("//item[@Text='(!" + CommonLogic.IIF(AppLogic.IsAdminSite, "admin.", "") + "menu.Distributors!)']");
                        tblMgr = AppLogic.DistributorStoreEntityHelper[0].m_TblMgr;
                        if (tblMgr.NumRootLevelNodes <= AppLogic.MaxMenuSize())
                        {
                            AddEntityMenuXsl(doc, "Distributors", tblMgr, mNode, 0, String.Empty);
                        }
                        mNode = doc.DocumentElement.SelectSingleNode("//item[@Text='(!" + CommonLogic.IIF(AppLogic.IsAdminSite, "admin.", "") + "menu.Distributors0!)']");
                        if (tblMgr.NumRootLevelNodes <= AppLogic.MaxMenuSize())
                        {
                            AddEntityMenuXsl(doc, "Distributors", tblMgr, mNode, 0, "TopItemLook");
                        }

                    }

                    Regex m_ReMatch = new Regex(@"\(!(.*?)!\)", RegexOptions.Compiled);
                    MatchEvaluator m_ResourceMatch = new MatchEvaluator(ResourceMatchEvaluatorXmlEncoded);
                    doc.InnerXml = m_ReMatch.Replace(doc.InnerXml, m_ResourceMatch);

                    if (AppLogic.CachingOn)
                    {
                        HttpContext.Current.Cache.Insert(CacheName, doc, null, System.DateTime.Now.AddMinutes(AppLogic.CacheDurationMinutes()), TimeSpan.Zero);
                    }
                }
                if (PageMenu != null)
                {
                    PageMenu.LoadXml(doc);
                }
            }
            if (VertMenu != null)
            {
                String CacheName = String.Format("vertmenudoc_{0}_{1}_{2}", AppLogic.IsAdminSite.ToString(), Page.SkinID.ToString(), Page.ThisCustomer.LocaleSetting);
                XmlDocument doc = null;
                if (AppLogic.CachingOn)
                {
                    doc = (XmlDocument)HttpContext.Current.Cache.Get(CacheName);
                }
                if (doc == null)
                {

                    doc = new XmlDocument();

                    // get menu config file:
                    String MenuConfigFileString = CommonLogic.ReadFile(CommonLogic.SafeMapPath("skins/skin_" + Page.SkinID.ToString() + "/vertMenuData.xml"), false);

                    doc.LoadXml(MenuConfigFileString);

                    XmlNode rootNode = doc.SelectSingleNode("/SiteMap");

                    // Find Manufacturers menu top
                    XmlNode mNode = doc.DocumentElement.SelectSingleNode("//item[@Text='(!" + CommonLogic.IIF(AppLogic.IsAdminSite, "admin.", "") + "menu.Manufacturers!)']");
                    AddEntityMenuXsl(doc, "Manufacturer", AppLogic.ManufacturerStoreEntityHelper[0].m_TblMgr, mNode, 0, String.Empty);
                    mNode = doc.DocumentElement.SelectSingleNode("//item[@Text='(!" + CommonLogic.IIF(AppLogic.IsAdminSite, "admin.", "") + "menu.Manufacturers0!)']");
                    AddEntityMenuXsl(doc, "Manufacturer", AppLogic.ManufacturerStoreEntityHelper[0].m_TblMgr, mNode, 0, "VertTopItemLook");

                    // Find Categories menu top
                    mNode = doc.DocumentElement.SelectSingleNode("//item[@Text='(!" + CommonLogic.IIF(AppLogic.IsAdminSite, "admin.", "") + "menu.Categories!)']");
                    AddEntityMenuXsl(doc, "Category", AppLogic.CategoryStoreEntityHelper[0].m_TblMgr, mNode, 0, String.Empty);
                    mNode = doc.DocumentElement.SelectSingleNode("//item[@Text='(!" + CommonLogic.IIF(AppLogic.IsAdminSite, "admin.", "") + "menu.Categories0!)']");
                    AddEntityMenuXsl(doc, "Category", AppLogic.CategoryStoreEntityHelper[0].m_TblMgr, mNode, 0, "VertTopItemLook");

                    // Find Sections menu top
                    mNode = doc.DocumentElement.SelectSingleNode("//item[@Text='(!" + CommonLogic.IIF(AppLogic.IsAdminSite, "admin.", "") + "menu.Sections!)']");
                    AddEntityMenuXsl(doc, "Section", AppLogic.SectionStoreEntityHelper[0].m_TblMgr, mNode, 0, String.Empty);
                    mNode = doc.DocumentElement.SelectSingleNode("//item[@Text='(!" + CommonLogic.IIF(AppLogic.IsAdminSite, "admin.", "") + "menu.Sections0!)']");
                    AddEntityMenuXsl(doc, "Section", AppLogic.SectionStoreEntityHelper[0].m_TblMgr, mNode, 0, "VertTopItemLook");

                    // not supported in PRO version
                    if (AppLogic.m_ProductIsML())
                    {
                    }

                    Regex m_ReMatch = new Regex(@"\(!(.*?)!\)", RegexOptions.Compiled);
                    MatchEvaluator m_ResourceMatch = new MatchEvaluator(ResourceMatchEvaluatorXmlEncoded);
                    doc.InnerXml = m_ReMatch.Replace(doc.InnerXml, m_ResourceMatch);

                    if (AppLogic.CachingOn)
                    {
                        HttpContext.Current.Cache.Insert(CacheName, doc, null, System.DateTime.Now.AddMinutes(AppLogic.CacheDurationMinutes()), TimeSpan.Zero);
                    }
                }
                if (VertMenu != null)
                {
                    VertMenu.LoadXml(doc);
                }
            }
            if (PageTree != null)
            {
                // Note: Tree doc cannot be cached, as it changes every page, (as we have to open the selected tree node based on query string params)
                StringBuilder tmpS = new StringBuilder(4096);
                int curEntityID = CommonLogic.QueryStringUSInt("EntityID");
                String curEntity = CurrentEntity;
                tmpS.Append("<siteMap>");
                if (AppLogic.AppConfigBool("Tree.ShowCategories"))
                {
                    tmpS.Append(AppLogic.LookupHelper("Category", 0).ComponentArtTree(0, Page.SkinID, Page.ThisCustomer.LocaleSetting, CommonLogic.QueryStringUSInt("CategoryID")));
                }
                if (AppLogic.AppConfigBool("Tree.ShowSections"))
                {
                    tmpS.Append(AppLogic.LookupHelper("Section", 0).ComponentArtTree(0, Page.SkinID, Page.ThisCustomer.LocaleSetting, CommonLogic.QueryStringUSInt("SectionID")));
                }
                // not supported in PRO version
                if (AppLogic.m_ProductIsML())
                {
                    if (AppLogic.AppConfigBool("Tree.ShowLibraries"))
                    {
                        tmpS.Append(AppLogic.LookupHelper("Library", 0).ComponentArtTree(0, Page.SkinID, Page.ThisCustomer.LocaleSetting, CommonLogic.QueryStringUSInt("LibraryID")));
                    }
                    if (AppLogic.AppConfigBool("Tree.ShowGenres"))
                    {
                        tmpS.Append(AppLogic.LookupHelper("Genre", 0).ComponentArtTree(0, Page.SkinID, Page.ThisCustomer.LocaleSetting, CommonLogic.QueryStringUSInt("GenreID")));
                    }
                    if (AppLogic.AppConfigBool("Tree.ShowVectors"))
                    {
                        tmpS.Append(AppLogic.LookupHelper("Vector", 0).ComponentArtTree(0, Page.SkinID, Page.ThisCustomer.LocaleSetting, CommonLogic.QueryStringUSInt("VectorID")));
                    }
                }
                if (AppLogic.AppConfigBool("Tree.ShowManufacturers"))
                {
                    tmpS.Append(AppLogic.LookupHelper("Manufacturer", 0).ComponentArtTree(0, Page.SkinID, Page.ThisCustomer.LocaleSetting, CommonLogic.QueryStringUSInt("ManufacturerID")));
                }
                if (AppLogic.AppConfigBool("Tree.ShowCustomerService"))
                {
                    string custSvcXml = "<siteMapNode Text=\"" + XmlCommon.XmlEncodeAttribute(AppLogic.GetString("" + CommonLogic.IIF(AppLogic.IsAdminSite, "admin.", "") + "menu.CustomerService", Page.SkinID, Page.ThisCustomer.LocaleSetting)) + "\" NavigateUrl=\"" + SE.MakeDriverLink("service") + "\">";
                    custSvcXml += AppLogic.AppConfig("Tree.CustomerServiceXml");
                    if (custSvcXml.Length != 0)
                    {
                        Regex m_ReMatch = new Regex(@"\(!(.*?)!\)");
                        MatchEvaluator m_ResourceMatch = new MatchEvaluator(ResourceMatchEvaluatorXmlEncoded);
                        custSvcXml = m_ReMatch.Replace(custSvcXml, m_ResourceMatch);
                    }
                    custSvcXml += "</siteMapNode>";
                    XmlDocument x = new XmlDocument();
                    try
                    {
                        x.LoadXml(custSvcXml);
                    }
                    catch
                    {
                        custSvcXml = "<siteMapNode Text=\"Invalid XML fragment in Tree.ShowCustomerService AppConfig parameter\" NavigateUrl=\"\" />";
                    }
                    tmpS.Append(custSvcXml);
                }
                tmpS.Append("</siteMap>");

                XmlDocument doc = new XmlDocument();
                doc.LoadXml(tmpS.ToString());
                PageTree.LoadXml(doc);
            }
        }

        private void AddEntityMenuXsl(XmlDocument doc, String EntityName, HierarchicalTableMgr m_TblMgr, XmlNode mnuItem, int ForParentEntityID, String NodeClass)
        {
            if (mnuItem == null)
            {
                return;
            }
            StringWriter tmpS = new StringWriter();
            XslCompiledTransform xForm = new XslCompiledTransform();
            String XslFile = "EntityMenuList";
            xForm.Load(CommonLogic.SafeMapPath("EntityHelper/" + XslFile + ".xslt"));
            XsltArgumentList xslArgs = new XsltArgumentList();
            xslArgs.AddParam("entity", "", EntityName);
            xslArgs.AddParam("custlocale", "", Page.ThisCustomer.LocaleSetting);
            xslArgs.AddParam("deflocale", "", Localization.GetDefaultLocale());
            xslArgs.AddParam("ForParentEntityID", "", ForParentEntityID);
            xslArgs.AddParam("adminsite", "", AppLogic.IsAdminSite);
            xslArgs.AddParam("nodeclass", "", NodeClass);
            xslArgs.AddParam("suppresstoparrow", "", CommonLogic.IIF(NodeClass.Length != 0, "1", "0"));
            xForm.Transform(m_TblMgr.XmlDoc, xslArgs, tmpS);
            if (AppLogic.AppConfigBool("XmlPackage.DumpTransform"))
            {
                try // don't let logging crash the site
                {
                    StreamWriter sw = File.CreateText(CommonLogic.SafeMapPath(String.Format("{0}images/{1}_{2}_{3}.xfrm.xml", CommonLogic.IIF(AppLogic.IsAdminSite, "../", ""), XslFile, EntityName, CommonLogic.IIF(AppLogic.IsAdminSite, "admin", "store"))));
                    sw.WriteLine(XmlCommon.PrettyPrintXml(tmpS.ToString()));
                    sw.Close();
                }
                catch { }
            }
            if (tmpS.ToString().Length != 0)
            {
                if (NodeClass.Length != 0) // this means we are adding to the ROOT level, not as children!
                {
                    // Create a document fragment to contain the XML to be inserted. 
                    XmlDocumentFragment docFrag = doc.CreateDocumentFragment();

                    // Set the contents of the document fragment. 
                    docFrag.InnerXml = tmpS.ToString();

                    // Add the children of the document fragment to the original document. 
                    mnuItem.ParentNode.InsertAfter(docFrag, mnuItem);

                    // now get rid of the parent placeholder node!
                    doc.SelectSingleNode("/SiteMap").RemoveChild(mnuItem);
                }
                else
                {
                    mnuItem.InnerXml = tmpS.ToString();
                }
            }
        }

        protected override void OnInit(EventArgs e)
        {
            if (this.RequireScriptManager)
            {
                // provide hookup for individual pages
                (this.Page as SkinBase).RegisterScriptAndServices(scrptMgr);
            }

            InitializeComponent();

            LoadMiniCartIfEnabled();

            base.OnInit(e);
        }

        /// <summary>
        /// Gets whether to require asp.net ajax script manager
        /// </summary>
        public virtual bool RequireScriptManager
        {
            get
            {
                return (this.Page as SkinBase).RequireScriptManager;
            }
        }



        /// <summary>
        /// Overrides the OnPreRender method
        /// </summary>
        /// <param name="e"></param>
        protected override void OnPreRender(EventArgs e)
        {
            SetupMenu();

            base.OnPreRender(e);
        }

        /// <summary>
        ///		Required method for Designer support - do not modify
        ///		the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.Load += new System.EventHandler(this.Page_Load);
        }

        /// <summary>
        /// Set's up the Asp.net default Menu control for display inside our skinning engine
        /// </summary>
        private void SetupMenu()
        {
            if (aspnetMenu != null)
            {
                string randomId = Guid.NewGuid().ToString("N").Substring(0, 5);

                // make ready the scripts
                StringBuilder script = new StringBuilder();
                script.AppendFormat("<script type=\"text/javascript\" language=\"Javascript\">\n");
                script.AppendFormat("    function loadMenu_{0}() {{\n", randomId);

                string menuId = aspnetMenu.ClientID;

                SiteMapDataSource ds = new SiteMapDataSource();
                var prov = SiteMapProviderFactory.GetSiteMap(Customer.Current);
                prov.MaximumDynamicDisplayLevels = aspnetMenu.MaximumDynamicDisplayLevels;
                ds.Provider = prov;

                aspnetMenu.DataSource = ds;
                aspnetMenu.AppRelativeTemplateSourceDirectory = "~/";
                //aspnetMenu.MaximumDynamicDisplayLevels = AspDotNetStorefrontCommon.AppConfig.SiteDisplay.MaxMenuLevelSize;
                aspnetMenu.DataBind();

                // now for the custom asp.net Menu javascript
                script.AppendFormat("            if({0}_Data) {{\n", menuId);
                script.AppendFormat("                 {0}_Data.hoverClass  = '{0}_DynamicHoverStyle';\n", menuId);
                script.AppendFormat("                 {0}_Data.hoverHyperLinkClass  = '{0}_DynamicHoverStyle';\n", menuId);
                script.AppendFormat("                 {0}_Data.staticHoverClass = '{0}_StaticHoverStyle';\n", menuId);
                script.AppendFormat("                 {0}_Data.staticHoverHyperLinkClass = '{0}_StaticHoverStyle';\n", menuId);
                script.AppendFormat("            }}\n");

                // ending brace for loadMenu function
                script.AppendFormat("    }}\n");

                script.AppendFormat("    $window_addLoad(loadMenu_{0});\n", randomId);
                script.AppendFormat("</script>\n");

                Page.ClientScript.RegisterStartupScript(this.GetType(), randomId, script.ToString());

                // fix for safari browsers
                if (Request.UserAgent.IndexOf("AppleWebKit") > 0)
                {
                    Request.Browser.Adapters.Clear();
                }
            }

        }

        /// <summary>
        /// Gets whether to use ajax addtocart functionality for the minicart
        /// </summary>
        public bool ShowMiniCart
        {
            get
            {
                return AppLogic.AppConfigBool("Minicart.UseAjaxAddToCart") && ShowMiniCartOnThisPage();
            }
        }


        /// <summary>
        /// Determines the visibility of the minicart based on the current requested page
        /// </summary>
        /// <returns></returns>
        private bool ShowMiniCartOnThisPage()
        {
            bool allowed = true;
            string pageName = CommonLogic.GetThisPageName(false);

            if (pageName.StartsWithIgnoreCase("shoppingcart") ||
                pageName.StartsWithIgnoreCase("checkout") ||
                pageName.StartsWithIgnoreCase("cardinal") ||
                pageName.StartsWithIgnoreCase("addtocart") ||
                pageName.ContainsIgnoreCase("_process") ||
                pageName.StartsWithIgnoreCase("lat_"))
            {
                allowed = false;
            }

            return allowed;
        }


        public void LoadMiniCartIfEnabled()
        {
            if (this.ShowMiniCart &&
                ctrlMinicart != null)
            {
                Control ctrl = LoadControl("controls/minicart.ascx");
                ctrl.AppRelativeTemplateSourceDirectory = "~/";
                ctrlMinicart.Controls.Add(ctrl);
            }
        }

    }
}
