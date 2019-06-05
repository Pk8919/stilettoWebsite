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


public partial class OPCControls_PurchaseOrderPaymentForm : System.Web.UI.UserControl,
    IPaymentMethodView
{
	public IStringResourceProvider StringResourceProvider { get; set; }
	public PurchaseOrderPaymentModel PurchaseOrderModel { get; private set; }
	public PaymentMethodBaseModel PaymentMethodModel { get; private set; }
	public void SetModel(PaymentMethodBaseModel model)
	{
		this.PaymentMethodModel = model;
		this.PurchaseOrderModel = (PurchaseOrderPaymentModel)model;
	}


	public void BindView()
	{
		this.TextBoxPONumber.Text = this.PurchaseOrderModel.PONumber;
	}

	public void BindView(object identifier)
	{
	}

	public void SaveViewToModel()
	{
		Page.Validate("VGPOPayment");
		if (Page.IsValid)
		{
			this.PurchaseOrderModel.PONumber = this.TextBoxPONumber.Text;
		}
	}

	public void Initialize()
	{
	}

	public void Disable()
	{
		this.TextBoxPONumber.Enabled = false;
	}

	public void Enable()
	{
		this.TextBoxPONumber.Enabled = true;
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

	protected void ButtonPONext_Click(object sender, EventArgs e)
	{
		SaveViewToModel();
	}
}
