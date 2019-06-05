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

public partial class OPCControls_CheckPaymentForm : System.Web.UI.UserControl,
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
    }

    public void Disable()
    {
    }

    public void Enable()
    {
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
