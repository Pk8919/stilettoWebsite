// --------------------------------------------------------------------------------
// Copyright AspDotNetStorefront.com. All Rights Reserved.
// http://www.aspdotnetstorefront.com
// For details on this license please visit the product homepage at the URL above.
// THE ABOVE NOTICE MUST REMAIN INTACT. 
// --------------------------------------------------------------------------------
using System;
using System.Xml;
using System.Xml.Xsl;
using System.Text;
using System.Text.RegularExpressions;
using System.IO;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using AspDotNetStorefrontCore;
using AspDotNetStorefrontControls;
using AspDotNetStorefrontGateways;
using System.Collections.Generic;
using AspDotNetStorefrontCore.ShippingCalculation;

namespace AspDotNetStorefront
{
    /// <summary>
    /// Summary description for wishlist.
    /// </summary>
    public partial class wishlist : SkinBase
    {
        protected void Page_Load(object sender, System.EventArgs e)
        {
            this.RequireCustomerRecord();
            SectionTitle = AppLogic.GetString("wishlist.aspx.1", SkinID, ThisCustomer.LocaleSetting);

            // make sure we don't have "JUST" deleted or unpublished items hanging around
            ShoppingCart.ClearDeletedAndUnPublishedProducts(ThisCustomer.CustomerID);

            if (!IsPostBack)
            {
                string ReturnURL = CommonLogic.QueryStringCanBeDangerousContent("ReturnUrl");
                AppLogic.CheckForScriptTag(ReturnURL);
                ViewState["ReturnURL"] = ReturnURL;
            }

            Wishlist wl = (Wishlist)LoadControl("~/Controls/Wishlist.ascx");
            pnlContent.Controls.Add(wl);
        }
    }
}
