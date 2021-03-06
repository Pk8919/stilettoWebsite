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
using Vortx.MobileFramework;

namespace AspDotNetStorefront
{
    /// <summary>
    /// Summary description for wishlist.
    /// </summary>
    public partial class mobilewishlist : SkinBase
    {
        ShoppingCart cart;
        String BACKURL = String.Empty;
        new Customer ThisCustomer;
        int m_SkinID;

        protected override void OnInit(EventArgs e)
        {
            ThisCustomer = (Page as AspDotNetStorefront.SkinBase).ThisCustomer;
            m_SkinID = (Page as AspDotNetStorefront.SkinBase).SkinID;

            cart = new ShoppingCart(m_SkinID, ThisCustomer, CartTypeEnum.WishCart, 0, false);
            BindData();
            base.OnInit(e);
        }

        private void BindData()
        {
            ctrlShoppingCart.DataSource = cart.CartItems;
            ctrlShoppingCart.DataBind();
        }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            MobileHelper.RedirectPageWhenMobileIsDisabled("~/wishlist.aspx", ThisCustomer);

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

            if (!IsPostBack)
            {
                InitializePageContent();
            }
        }

        public void btnUpdateWishList1_Click(object sender, EventArgs e)
        {
            UpdateCartQuantity();
            cart = new ShoppingCart(m_SkinID, ThisCustomer, CartTypeEnum.WishCart, 0, false);
            InitializePageContent();
            // rebind
            BindData();
        }

        public void btnUpdateWishList2_Click(object sender, EventArgs e)
        {
            UpdateCartQuantity();
            cart = new ShoppingCart(m_SkinID, ThisCustomer, CartTypeEnum.WishCart, 0, false);
            InitializePageContent();
            // rebind
            BindData();
        }

        protected void btnContinueShopping1_Click(object sender, EventArgs e)
        {
            if (ViewState["ReturnURL"].ToString() == "")
            {
                Response.Redirect(AppLogic.GetCartContinueShoppingURL(m_SkinID, ThisCustomer.LocaleSetting));
            }
            else
            {
                Response.Redirect(ViewState["ReturnURL"].ToString());
            }
        }
        protected void btnContinueShopping2_Click(object sender, EventArgs e)
        {
            if (ViewState["ReturnURL"].ToString() == "")
            {
                Response.Redirect(AppLogic.GetCartContinueShoppingURL(m_SkinID, ThisCustomer.LocaleSetting));
            }
            else
            {
                Response.Redirect(ViewState["ReturnURL"].ToString());
            }
        }

        private void InitializePageContent()
        {
            if (cart == null)
            {
                cart = new ShoppingCart(m_SkinID, ThisCustomer, CartTypeEnum.WishCart, 0, false);
            }

            String XmlPackageName = AppLogic.AppConfig("XmlPackage.WishListPageHeader");
            if (XmlPackageName.Length != 0)
            {
                XmlPackage_WishListPageHeader.Text = AppLogic.RunXmlPackage(XmlPackageName, (Page as AspDotNetStorefront.SkinBase).GetParser, ThisCustomer, m_SkinID, String.Empty, String.Empty, true, true, (Page as AspDotNetStorefront.SkinBase).EntityHelpers);
            }

            String CartTopControlLinesXmlPackage = AppLogic.AppConfig("XmlPackage.WishListPageTopControlLines");
            if (CartTopControlLinesXmlPackage.Length != 0)
            {
                XmlPackage_WishListPageTopControlLines.Text = AppLogic.RunXmlPackage(CartTopControlLinesXmlPackage, (Page as AspDotNetStorefront.SkinBase).GetParser, ThisCustomer, m_SkinID, String.Empty, String.Empty, true, true);
                XmlPackage_WishListPageTopControlLines.Visible = true;
            }
            else
            {
                pnlTopControlLines.Visible = true;
                btnContinueShopping1.Text = AppLogic.GetString("shoppingcart.cs.62", ThisCustomer.SkinID, ThisCustomer.LocaleSetting);
                btnContinueShopping1.Attributes.Add("onclick", "self.location='" + BACKURL + "'");
                if (!cart.IsEmpty())
                {
                    btnUpdateWishList1.Text = AppLogic.GetString("shoppingcart.cs.108", ThisCustomer.SkinID, ThisCustomer.LocaleSetting);
                }
                else
                {
                    btnUpdateWishList1.Visible = false;
                }
            }

            int ItemsInWishListNow = ShoppingCart.NumItems(ThisCustomer.CustomerID, CartTypeEnum.WishCart);
            if (cart.CartType == CartTypeEnum.WishCart)
            {
                if (ThisCustomer != null && !ThisCustomer.IsRegistered && !AppLogic.AppConfigBool("DisallowAnonCustomerToCreateWishlist") && ItemsInWishListNow > 0)
                {
                    lblWishlistMessage.Text = AppLogic.GetString("wishlist.aspx.4", m_SkinID, ThisCustomer.LocaleSetting);
                }
                else
                {
                    lblWishlistMessage.Visible = false;
                }
            }

            String CartBottomControlLinesXmlPackage = AppLogic.AppConfig("XmlPackage.WishListPageBottomControlLines");
            if (CartBottomControlLinesXmlPackage.Length != 0)
            {
                Xml_WishListPageBottomControlLines.Text = AppLogic.RunXmlPackage(CartBottomControlLinesXmlPackage, (Page as AspDotNetStorefront.SkinBase).GetParser, ThisCustomer, m_SkinID, String.Empty, String.Empty, true, true);
                Xml_WishListPageBottomControlLines.Visible = true;
            }
            else
            {
                pnlBottomControlLines.Visible = true;
                btnContinueShopping2.Text = AppLogic.GetString("shoppingcart.cs.62", ThisCustomer.SkinID, ThisCustomer.LocaleSetting);
                btnContinueShopping2.Attributes.Add("onclick", "self.location='" + BACKURL + "'");
                if (!cart.IsEmpty())
                {
                    btnUpdateWishList2.Text = AppLogic.GetString("shoppingcart.cs.108", ThisCustomer.SkinID, ThisCustomer.LocaleSetting);
                }
                else
                {
                    btnUpdateWishList2.Visible = false;
                }
            }

            String XmlPackageName2 = AppLogic.AppConfig("XmlPackage.WishListPageFooter");
            if (XmlPackageName2.Length != 0)
            {
                Xml_WishListPageFooter.Text = AppLogic.RunXmlPackage(XmlPackageName2, (Page as AspDotNetStorefront.SkinBase).GetParser, ThisCustomer, m_SkinID, String.Empty, String.Empty, true, true);
            }
        }

        private void UpdateCartQuantity()
        {
            int quantity = 0;
            int sRecID = 0;
            string itemNotes;

            for (int i = 0; i < ctrlShoppingCart.Items.Count; i++)
            {
                quantity = ctrlShoppingCart.Items[i].Quantity;
                sRecID = ctrlShoppingCart.Items[i].ShoppingCartRecId;
                itemNotes = ctrlShoppingCart.Items[i].ItemNotes;


                cart.SetItemQuantity(sRecID, quantity);
                cart.SetItemNotes(sRecID, CommonLogic.CleanLevelOne(itemNotes));
            }
        }

        protected void ctrlShoppingCart_ItemDeleting(object sender, ItemEventArgs e)
        {
            cart.SetItemQuantity(e.ID, 0);
            cart = new ShoppingCart(m_SkinID, ThisCustomer, CartTypeEnum.WishCart, 0, false);
            // refresh cart information
            BindData();
        }

        protected void ctrlShoppingCart_MoveToShoppingCartInvoked(object sender, ItemEventArgs e)
        {
            int cartRecordId = e.ID;
            cart.SetItemCartType(cartRecordId, CartTypeEnum.ShoppingCart);
            // at this  point, the shoppingcart collection may already be invalid
            // since we have cart items that has switch to another cart type
            // redirect to shoppincart page in order to refresh cart information
            Response.Redirect("shoppingcart.aspx");
        }




    }
}
