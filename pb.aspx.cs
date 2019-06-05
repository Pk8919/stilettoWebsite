// --------------------------------------------------------------------------------
// Copyright AspDotNetStorefront.com. All Rights Reserved.
// http://www.aspdotnetstorefront.com
// For details on this license please visit the product homepage at the URL above.
// THE ABOVE NOTICE MUST REMAIN INTACT. 
// --------------------------------------------------------------------------------
using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Globalization;
using AspDotNetStorefrontCore;
using System.Data.SqlClient;
using System.Text;

namespace AspDotNetStorefront
{
	/// <summary>
	/// Summary description for pb.
	/// </summary>
	public partial class pb : System.Web.UI.Page
	{
        private Customer ThisCustomer 
        {
            get
            {
                return Customer.Current;
            }
        }

		protected void Page_Load(object sender, System.EventArgs e)
		{
			Response.CacheControl="private";
			Response.Expires=0;
			Response.AddHeader("pragma", "no-cache");            

            int skinID = int.Parse(CommonLogic.IIF(CommonLogic.IsInteger(Profile.SkinID.ToString()), Profile.SkinID.ToString(), "0")); 
            if (skinID <= 0)
            {
                skinID = ThisCustomer.SkinID;
            }

            if (this.IsAddToPackPostBack)
            {
                HandleAddToPack();
                return;
            }

            //Response.Write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n");
            //Response.Write("<html>\n");
            //Response.Write("<head>\n");
            //Response.Write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n");
            //Response.Write("<title>Product Browser</title>\n");
            //Response.Write("<link rel=\"stylesheet\" href=\"~/App_Themes/Skin_" + skinID.ToString() + "/style.css\" type=\"text/css\">\n");
            //Response.Write("<script type=\"text/javascript\" src=\"jscripts/formValidate.js\"></script>\n");
            //Response.Write("<script type=\"text/javascript\" src=\"jscripts/core.js\"></script>\n");
            //Response.Write("</head>\n");
            //Response.Write("<body class=\"ProductBrowserBody\" bottommargin=\"0\" leftmargin=\"0\" marginheight=\"0\" marginwidth=\"0\" rightmargin=\"0\" topmargin=\"0\" bgcolor=\"#FFFFFF\">\n");
            //Response.Write("<!-- PAGE INVOCATION: '%INVOCATION%' -->\n");

            StringBuilder output = new StringBuilder();

			
			int PackID = CommonLogic.QueryStringUSInt("PackID");
			int ProductID = CommonLogic.QueryStringUSInt("ProductID");

			if(AppLogic.ProductHasBeenDeleted(ProductID))
			{
				Response.Redirect(SE.MakeDriverLink("ProductNotFound"));
			}

            bool RequiresReg;
            using (SqlConnection conn = DB.dbConn())
            {
                conn.Open();
                using (IDataReader rs = DB.GetRS("select RequiresRegistration from Product   with (NOLOCK)  where deleted=0 and Product.ProductID=" + ProductID.ToString(), conn))
                {
                    if (!rs.Read())
                    {
                        rs.Close();
                        Response.Redirect(SE.MakeDriverLink("ProductNotFound"));
                    }

                    RequiresReg = DB.RSFieldBool(rs, "RequiresRegistration");
                }
            }            

			if(RequiresReg && !ThisCustomer.IsRegistered)
			{
                output.Append("<b>" + AppLogic.GetString("pb.aspx.1", 1, Localization.GetDefaultLocale()) + "</b>");
			}
			else
			{
                output.Append(AppLogic.RunXmlPackage("productbrowser.xml.config", null, ThisCustomer, 1, string.Empty, string.Empty, false, false));
  			}

            litOutput.Text = output.ToString();

            //Response.Write("</body>\n");
            //Response.Write("</html>\n");
		}

        private bool IsAddToPackPostBack
        {
            get
            {
                return "AddToCart".Equals(CommonLogic.FormCanBeDangerousContent("__EVENTTARGET"),
                    StringComparison.InvariantCultureIgnoreCase);
            }
        }

        private void HandleAddToPack()
        {
            ThisCustomer.RequireCustomerRecord();

            int PackID = CommonLogic.QueryStringUSInt("PackID");
            int ProductID = CommonLogic.QueryStringUSInt("ProductID");
            int VariantID = CommonLogic.QueryStringUSInt("VariantID");
            int CategoryID = CommonLogic.QueryStringUSInt("CategoryID");
            int SectionID = CommonLogic.QueryStringUSInt("SectionID");
            int Quantity = CommonLogic.QueryStringUSInt("Quantity");
            if (Quantity == 0)
            {
                Quantity = 1;
            }

            //If editing a pack is from the shopping cart
            bool FromCart = (CommonLogic.QueryStringUSInt("CartRecID") > 0);
            int CartRecID = CommonLogic.QueryStringUSInt("CartRecID");

            String ChosenColor = String.Empty;
            String ChosenColorSKUModifier = String.Empty;
            String ChosenSize = String.Empty;
            String ChosenSizeSKUModifier = String.Empty;

            if (CommonLogic.QueryStringCanBeDangerousContent("Color").Length != 0)
            {
                String[] ColorSel = CommonLogic.QueryStringCanBeDangerousContent("Color").Split(',');
                try
                {
                    ChosenColor = ColorSel[0];
                }
                catch { }
                try
                {
                    ChosenColorSKUModifier = ColorSel[1];
                }
                catch { }
            }
            if (ChosenColor.Length != 0)
            {
                ThisCustomer.ThisCustomerSession["ChosenColor"] = ChosenColor;
            }


            if (CommonLogic.QueryStringCanBeDangerousContent("Size").Length != 0)
            {
                String[] SizeSel = CommonLogic.QueryStringCanBeDangerousContent("Size").Split(',');
                try
                {
                    ChosenSize = SizeSel[0];
                }
                catch { }
                try
                {
                    ChosenSizeSKUModifier = SizeSel[1];
                }
                catch { }
            }
            if (ChosenSize.Length != 0)
            {
                ThisCustomer.ThisCustomerSession["ChosenSize"] = ChosenSize;
            }

            if (Quantity > 0)
            {
                // add to custom cart:
                if (FromCart)
                {
                    CustomCart.AddItem(PackID, ProductID, VariantID, Quantity, ChosenColor, ChosenColorSKUModifier, ChosenSize, ChosenSizeSKUModifier, CartRecID, ThisCustomer, CartTypeEnum.ShoppingCart);
                }
                else
                {
                    CustomCart cart = new CustomCart(ThisCustomer, PackID, 1, CartTypeEnum.ShoppingCart);
                    cart.AddItem(ProductID, VariantID, Quantity, ChosenColor, ChosenColorSKUModifier, ChosenSize, ChosenSizeSKUModifier);
                }
            }

            if (CommonLogic.QueryStringCanBeDangerousContent("UpdateCartPack") == "")
            {
                String url = SE.MakeProductAndEntityLink(CommonLogic.QueryStringCanBeDangerousContent("entityname"), PackID, CommonLogic.QueryStringUSInt("entityid"), "");
                url = url + CommonLogic.IIF(FromCart, "?cartrecid=" + CartRecID.ToString(), "");

                RedirectMainContainer(url);
            }
            else
            {
                RedirectMainContainer("shoppingcart.aspx");
            }
        }

        private void RedirectMainContainer(string url)
        {
            string script=  string.Format("top.location = '{0}';\n", HttpUtility.UrlEncode(url));

            Page.ClientScript.RegisterStartupScript(this.GetType(), Guid.NewGuid().ToString(), script, true);
        }


	}
}
