using System;
using System.Web;
using System.Web.UI;
using AspDotNetStorefrontCore;
using System.Collections.Generic;
using AspDotNetStorefront;
using System.Xml;

namespace AspDotNetStorefront
{
    public partial class PageTitle : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page p = HttpContext.Current.Handler as Page;

            bool IsTopic = (p as SkinBase).IsTopicPage;
            bool IsEntity = (p as SkinBase).IsEntityPage;
            bool IsProduct = (p as SkinBase).IsProductPage;

            if (IsProduct)
            {
                Results.Text = AppLogic.GetProductName((p as SkinBase).PageID, (p as SkinBase).ThisCustomer.LocaleSetting);
            }
            else if (IsEntity)
            {
                EntityHelper m_EntityHelper = AppLogic.LookupHelper((p as SkinBase).EntityType, AppLogic.StoreID());
                XmlNode n = m_EntityHelper.m_TblMgr.SetContext((p as SkinBase).PageID);
                Results.Text = m_EntityHelper.m_TblMgr.CurrentName(n, (p as SkinBase).ThisCustomer.LocaleSetting);
            }
            else if (IsTopic)
            {
                Topic t = new Topic((p as SkinBase).PageID);
                Results.Text = t.SectionTitle;
            }
            else
            {
                Results.Text = (p as SkinBase).SectionTitle;
            }

        }
    }
}
