// --------------------------------------------------------------------------------
// Copyright AspDotNetStorefront.com. All Rights Reserved.
// http://www.aspdotnetstorefront.com
// For details on this license please visit the product homepage at the URL above.
// THE ABOVE NOTICE MUST REMAIN INTACT. 
// --------------------------------------------------------------------------------
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Vortx.OnePageCheckout.Views;
using Vortx.OnePageCheckout.Models;
using Vortx.OnePageCheckout.Models.PaymentMethods;
using AspDotNetStorefrontGateways.Processors;
using AspDotNetStorefrontCore;

public partial class OPCControls_PaymentForms_PayPalEmbeddedCheckoutPaymentForm : System.Web.UI.UserControl,
    IPaymentMethodView
{
    public IStringResourceProvider StringResourceProvider { get; set; }
    public PaymentMethodBaseModel PaymentMethodModel { get; private set; }
    public void SetModel(PaymentMethodBaseModel model)
    {
        this.PaymentMethodModel = model;
    }


    public void BindView()
    {
    }

    public void BindView(object identifier)
    {
    }

    public void SaveViewToModel()
    {
    }

    public void Initialize()
    {
        //btnContCheckout.Visible = false;
        string returnUrl = string.Format("{0}fp-paypalembeddedcheckoutok.aspx", AppLogic.GetStoreHTTPLocation(true));
        string errorUrl = string.Format("{0}fp-paypalembeddedcheckoutok.aspx", AppLogic.GetStoreHTTPLocation(true));
        string cancelUrl = string.Format("{0}fp-shoppingcart.aspx", AppLogic.GetStoreHTTPLocation(true));
        string notifyUrl = string.Format("{0}paypalnotification.aspx", AppLogic.GetStoreHTTPLocation(true));
        string silentPostURL = string.Format("{0}paypalembeddedcheckoutok.aspx", AppLogic.GetStoreHTTPLocation(true));
        PayPalEmbeddedCheckoutSecureTokenResponse response = PayFlowProController.GetFramedHostedCheckout(returnUrl, errorUrl, cancelUrl, notifyUrl, silentPostURL);

        if (response.Result != 0)
            throw new Exception("PayPal Embedded Checkout is not configured properly.");

        Session["PayPalEmbeddedCheckoutSecureToken"] = response.SecureToken;
        Session["PayPalEmbeddedCheckoutSecureTokenId"] = response.SecureTokenID;

        if (CommonLogic.QueryStringNativeInt("ErrorMsg") > 0)
        {
            ErrorMessage e = new ErrorMessage(CommonLogic.QueryStringNativeInt("ErrorMsg"));
            ShowError(e.Message);
        }

        string frameSrc = response.GetFrameSrc(0, 400);
        litPayPalEmbeddedCheckoutFrame.Text = frameSrc;
    }

    public void Disable()
    {
		this.Visible = false;
    }

    public void Enable()
    {
		this.Visible = true;
	}

    public void Show()
    {
        this.Visible = true;
    }

    public void Hide()
    {
        this.Visible = false;
    }

    public void ShowError(string message)
    {
        PanelError.Visible = true;
        ErrorMessage.Text = message;
    }

}
