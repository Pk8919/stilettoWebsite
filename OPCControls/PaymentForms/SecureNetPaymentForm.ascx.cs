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
using AspDotNetStorefrontGateways;
using AspDotNetStorefrontCore;

public partial class OPCControls_SecureNetPaymentPaymentForm : System.Web.UI.UserControl, IPaymentMethodView
{
	public IStringResourceProvider StringResourceProvider { get; set; }
	public PaymentMethodBaseModel PaymentMethodModel { get; private set; }
	private SecureNetPaymentModel SecureNetModel { get { return (SecureNetPaymentModel)PaymentMethodModel; }}
	private bool HasBeenEnabled { get; set; }
	private bool HasBeenShown { get; set; }
	public bool IsVaultPaymentSelected { get { return SecureNetModel != null && SecureNetModel.SelectedVaultPayment != "-1"; } }
	private string FrameSrc { get; set; }

	public event EventHandler ExistingCreditCardSelected;
	public event EventHandler NewCreditCardSelected;

	public void SetModel(PaymentMethodBaseModel model)
	{
		this.PaymentMethodModel = model;

		if(!AppLogic.SecureNetVaultIsEnabled())
			return;

		if(rblSecureNetVaultMethods.Items.Count != 0)
			return;

		var vaultPaymentInfo = SecureNetModel.GetCustomerVault();
		bool defaultToNewCard = true;

		rblSecureNetVaultMethods.Items.Clear();
		foreach(var paymentInfo in vaultPaymentInfo)
		{
			string text = String.Format("<strong>{0}</strong>: {1} <strong>{2}</strong>: {3}", "account.creditcardprompt".StringResource(), paymentInfo.CardNumberPadded, "account.expires".StringResource(), paymentInfo.ExpDateFormatted);
			string value = paymentInfo.PaymentId;
			bool selected = value == (SecureNetModel.SelectedVaultPayment ?? SecureNetModel.GetCustomersSelectedSecureNetVault());

			if(selected)
				defaultToNewCard = false;

			rblSecureNetVaultMethods.Items.Add(
				new ListItem
				{
					Text = text,
					Value = value,
					Selected = selected
				});
		}

		rblSecureNetVaultMethods.Items.Add(
			new ListItem
			{
				Text = "Use a new credit card",
				Value = "-1",
				Selected = defaultToNewCard,
			});
	}

	public void BindView()
	{
	}

	public void BindView(object identifier)
	{
	}

	public void SaveViewToModel()
	{
		if(SecureNetModel == null)
			return;

		SecureNetModel.SelectedVaultPayment = rblSecureNetVaultMethods.SelectedValue;
		SecureNetModel.Save();
	}

    public void Initialize()
    {
		if(SecureNetModel == null)
			return;

		var vaultPaymentInfo = SecureNetModel.GetCustomerVault();
		
		if(!vaultPaymentInfo.Any(pi => pi.PaymentId == SecureNetModel.SelectedVaultPayment))
			SecureNetModel.SelectedVaultPayment = "-1";
    }

    public void Disable()
    {
		HasBeenEnabled = false;
		UpdateDisplay();
    }

    public void Enable()
    {
		HasBeenEnabled = true;
		UpdateDisplay();
	}

    public void Show()
    {
		HasBeenShown = true;
		UpdateDisplay();
	}	

    public void Hide()
    {
		HasBeenShown = false;
		UpdateDisplay();
	}

	private void UpdateDisplay()
	{
		if(!HasBeenShown || !HasBeenEnabled || !AppLogic.SecureNetVaultIsEnabled() || SecureNetModel == null)
		{
			Visible = false;
			return;
		}

		Visible = SecureNetModel.GetCustomerVault().Any();
	}

	protected void rblSecureNetVaultMethods_OnSelectedIndexChanged(object sender, EventArgs e)
	{
		SaveViewToModel();

		if(rblSecureNetVaultMethods.SelectedValue == "-1")
		{
			FireNewCreditCardSelected();
		}
		else
		{
			FireExistingCreditCardSelected();
		}
	}

	protected void FireExistingCreditCardSelected()
	{
		if(ExistingCreditCardSelected != null)
			ExistingCreditCardSelected(this, EventArgs.Empty);
	}

	protected void FireNewCreditCardSelected()
	{
		if(NewCreditCardSelected != null)
			NewCreditCardSelected(this, EventArgs.Empty);
	}

    public void ShowError(string message)
    {
		PanelError.Visible = true;
		ErrorMessage.Text = message;
    }
}
