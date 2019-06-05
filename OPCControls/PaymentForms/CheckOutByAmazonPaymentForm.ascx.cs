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


public partial class OPCControls_PaymentForms_CheckOutByAmazonPaymentForm : System.Web.UI.UserControl,
		IPaymentMethodView
{
	#region IPaymentMethodView Members

	public Vortx.OnePageCheckout.Models.PaymentMethodBaseModel PaymentMethodModel
	{
		get;
		private set;
	}

	public IStringResourceProvider StringResourceProvider { get; set; }
	public void SetModel(Vortx.OnePageCheckout.Models.PaymentMethodBaseModel model)
	{
		this.PaymentMethodModel = model;
	}

	#endregion

	#region IView Members

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

	public void BindView()
	{
	}

	public void BindView(object identifier)
	{
	}

	public void SaveViewToModel()
	{
		CheckOutByAmazonPaymentModel cbaModel = (CheckOutByAmazonPaymentModel)this.PaymentMethodModel;
		if (!cbaModel.IsCheckingOut)
		{			
			Response.Redirect("shoppingcart.aspx");
		}
	}

	public void ShowError(string message)
	{
	}

	#endregion
}
