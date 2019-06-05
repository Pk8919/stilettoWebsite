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
using Vortx.OnePageCheckout.WebUtility;
using Vortx.OnePageCheckout.Models.PaymentMethods;
using Vortx.OnePageCheckout.Settings;
using AspDotNetStorefront;
using AspDotNetStorefrontCore;
using AspDotNetStorefrontGateways.Processors;
using AspDotNetStorefrontGateways;

public partial class OPCControls_CreditCardAndBillingAddress :
	System.Web.UI.UserControl,
	IPaymentMethodView
{
	public IAddressView BillingAddressEditView
	{
		get
		{
            if (ConfigurationProvider.DefaultProvider.AddressLocale.Equals("UK"))
            {
                return this.BillingAddressUKEdit1;
            }
            else
            {
                //default is for US
                return this.BillingAddressEdit1;
            }
		}
	}

	public IAddressView BillingAddressStaticView
	{
		get { return this.BillingAddressStatic1; }
	}

	public IAccountView AddressBookView
	{
		get { return this.AddressBook1; }
	}

	public bool WalletSelected
	{
		get
		{ 
			if (Session["WalletSelected"] != null)
				return (bool)Session["WalletSelected"];
			return false;
		}
		set { Session["WalletSelected"] = value; }
	}

    //Added so we can tell when to hide/show the first pay controls    
    private GatewayProcessor activeGateway;

    private GatewayProcessor ActiveGateway
    {
        get
        {
            if (activeGateway == null)
            {
                SkinBase page = HttpContext.Current.Handler as SkinBase;
                if (page != null)
                {
                    string gateway = AppLogic.ActivePaymentGatewayCleaned();
                    activeGateway = GatewayLoader.GetProcessor(gateway);
                }
            }
            return activeGateway;
        }
    }

    private bool IsFirstPay
    {
        get
        {
            if (ActiveGateway.GatewayIdentifier.ToUpper() == "FIRSTPAY")
                return true;
            else
                return false;
        }
    }

	#region Page Events

	protected void Page_Load(object sender, EventArgs e)
	{
		AspDotNetStorefrontGateways.Processors.AuthorizeNet authorizeNet = new AspDotNetStorefrontGateways.Processors.AuthorizeNet();
		if(authorizeNet.IsCimEnabled)
		{
			var customer = AspDotNetStorefrontCore.Customer.Current;
			this.WalletSelector1.Visible = customer.IsRegistered;
			this.WalletSelector1.PaymentProfileSelected += new CIM_WalletSelector.PaymentProfileSelectedHandler(WalletSelector1_PaymentProfileSelected);
		}
	}

	protected void WalletSelector1_PaymentProfileSelected(object sender, long paymentProfileId)
	{
		SaveViewToModel();
	}

	protected void BillSameNo_CheckedChanged(object sender, EventArgs e)
	{
		((CreditCardPaymentModel)this.PaymentMethodModel).BillingEqualsShipping = false;
		ToggleShowBillSameAsShip(false);
	}
	protected void BillSameYes_CheckedChanged(object sender, EventArgs e)
	{
		((CreditCardPaymentModel)this.PaymentMethodModel).BillingEqualsShipping = true;
		ToggleShowBillSameAsShip(true);
	}
	
	protected void OPCControls_CreditCardAndBillingAddress_SecurityCodeChanged(object source, EventArgs args)
	{
		this.SaveViewToModel();
	}

	#endregion

	#region Private Methods

    private void ToggleShowBillSameAsShip(bool same)
    {
        if (same)
        {
            HyperLinkBillingAddressBook.Visible = false;

            if (ConfigurationProvider.DefaultProvider.AddressLocale.Equals("UK"))
            {
                BillingAddressUKEdit1.Hide();
            }
            else
            {
                //default is for US
                BillingAddressEdit1.Hide();
            }

            BillingAddressStatic1.Show();
            BillingAddressStatic1.BindView();
        }
        else
        {
            HyperLinkBillingAddressBook.Visible = this.AddressBookView.AccountModel.IsRegistered;

            if (ConfigurationProvider.DefaultProvider.AddressLocale.Equals("UK"))
            {
                BillingAddressUKEdit1.Initialize();
                BillingAddressUKEdit1.Show();
                BillingAddressUKEdit1.Enable();
                BillingAddressUKEdit1.BindView();
            }
            else
            {
                //default is for US
                BillingAddressEdit1.Initialize();
                BillingAddressEdit1.Show();
                BillingAddressEdit1.Enable();
                BillingAddressEdit1.BindView();
            }

            BillingAddressStatic1.Hide();

        }
    }

	#endregion

	#region IView Members

    public IStringResourceProvider StringResourceProvider { get; set; }
    public PaymentMethodBaseModel PaymentMethodModel { get; set; }

    public void SetModel(PaymentMethodBaseModel model)
    {
        this.PaymentMethodModel = model;
        this.CreditCardPaymentForm1.StringResourceProvider = this.StringResourceProvider;
        this.BillingAddressUKEdit1.StringResourceProvider = this.StringResourceProvider;
        this.CreditCardPaymentForm1.SetModel(model);
        this.CreditCardPaymentForm1.PaymentFormSubmitted += new EventHandler(OPCControls_CreditCardAndBillingAddress_PaymentFormSubmitted);
        this.CreditCardPaymentForm1.SecurityCodeTextChanged += new EventHandler(OPCControls_CreditCardAndBillingAddress_SecurityCodeChanged);
    }

	protected void OPCControls_CreditCardAndBillingAddress_PaymentFormSubmitted(object source, EventArgs args)
	{
		this.SaveViewToModel();
	}

	public void BindView()
	{
		if (!Vortx.OnePageCheckout.Settings.ConfigurationProvider.DefaultProvider.AllowSeparateBillingAndShipping)
		{
			if (((CreditCardPaymentModel)this.PaymentMethodModel).ShippingEnabled)
			{
				((CreditCardPaymentModel)this.PaymentMethodModel).BillingEqualsShipping = true;
			}
		}
		PanelAddressBook.Visible = Vortx.OnePageCheckout.Settings.ConfigurationProvider.DefaultProvider.AllowSeparateBillingAndShipping;

		this.BillSameNo.Checked = !((CreditCardPaymentModel)this.PaymentMethodModel).BillingEqualsShipping;
		this.BillSameYes.Checked = ((CreditCardPaymentModel)this.PaymentMethodModel).BillingEqualsShipping;

		this.PanelBillSame.Visible = ((CreditCardPaymentModel)this.PaymentMethodModel).ShippingEnabled &&
			Vortx.OnePageCheckout.Settings.ConfigurationProvider.DefaultProvider.AllowSeparateBillingAndShipping;

		this.CreditCardPaymentForm1.BindView();
		this.AddressBookView.BindView();

		if (this.BillSameYes.Checked)
		{
			this.BillingAddressStatic1.StringResourceProvider = this.StringResourceProvider;
			this.BillingAddressStatic1.SetModel(this.AddressBookView.AccountModel.ShippingAddress);
		}

		if (((CreditCardPaymentModel)this.PaymentMethodModel).ShippingEnabled)
		{
			ToggleShowBillSameAsShip(this.BillSameYes.Checked);
		}
		else
		{
			ToggleShowBillSameAsShip(false);
		}
	}

	public void BindView(object id)
	{
	}

	public void Initialize()
	{
        if (ConfigurationProvider.DefaultProvider.AddressLocale.Equals("US"))
        {
            this.BillingAddressEdit1.Initialize();
        }
        else
        {
            this.BillingAddressUKEdit1.Initialize();
        }
		this.BillingAddressStatic1.Initialize();
		this.CreditCardPaymentForm1.Initialize();

		if(!PageUtility.IsAsyncPostBackForControl(this, ConfigurationProvider.DefaultProvider.ScriptManagerId) &&
			!PageUtility.IsAsyncPostBackForControl(CreditCardPaymentForm1, ConfigurationProvider.DefaultProvider.ScriptManagerId))
		{
			PanelChooseWalletOrNewCard.Visible = false;

			AspDotNetStorefrontGateways.Processors.AuthorizeNet authorizeNet = new AspDotNetStorefrontGateways.Processors.AuthorizeNet();
			if (authorizeNet.IsCimEnabled)
			{
				if(this.AddressBookView.AccountModel.IsRegistered && GatewayAuthorizeNet.DataUtility.GetPaymentProfiles(Int32.Parse(AddressBookView.AccountModel.AccountId), AddressBookView.AccountModel.Email).Any())
				{
					PanelChooseWalletOrNewCard.Visible = true;

					PanelWallet.Visible = WalletSelected;
					PanelAddACard.Visible = !WalletSelected;

					RadioButtonNewCard.Checked = !WalletSelected;
					RadioButtonWallet.Checked = WalletSelected;
				}
				else
				{
					PanelAddACard.Visible = true;
					RadioButtonNewCard.Checked = true;
					PanelSelectWallet.Visible = false;
					RadioButtonWallet.Checked = false;
				}
			}
		}
	}

	public void Disable()
	{
        if (ConfigurationProvider.DefaultProvider.AddressLocale.Equals("US"))
        {
            this.BillingAddressEdit1.Disable();
        }
        else
        {
            this.BillingAddressUKEdit1.Disable();

        }
		this.BillingAddressStatic1.Disable();
		this.CreditCardPaymentForm1.Disable();
        if(IsFirstPay)
            this.FirstPayPaymentForm.Disable();
		this.BillSameNo.Enabled = false;
		this.BillSameYes.Enabled = false;

		PanelSelectWallet.Enabled = false;
		PanelWallet.Enabled = false;
		PanelSelectAddNew.Enabled = false;
		PanelAddACard.Enabled = false;
	}

	public void Enable()
	{
        this.BillingAddressEdit1.Enable();
		this.BillingAddressStatic1.Enable();
		this.CreditCardPaymentForm1.Enable();
        if (IsFirstPay)
            this.FirstPayPaymentForm.Enable();
		this.BillSameNo.Enabled = true;
		this.BillSameYes.Enabled = true;

		PanelSelectWallet.Enabled = true;
		PanelWallet.Enabled = true;
		PanelSelectAddNew.Enabled = true;
		PanelAddACard.Enabled = true;
	}

    public void Show()
    {
        this.Visible = true;

        this.PanelBillSame.Visible = ((CreditCardPaymentModel)this.PaymentMethodModel).ShippingEnabled;

        this.UpdatePanelCreditCardAndBillingAddress.Visible = true;
        this.ToggleShowBillSameAsShip(BillSameYes.Checked);

        if (IsFirstPay)
        {
            FirstPayPaymentForm.gateway = ActiveGateway;
            FirstPayPaymentForm.thisCustomer = Vortx.OnePageCheckout.Models.Adnsf9200.AdnsfUtility.ContextCustomer;
            FirstPayPaymentForm.Show();
            FirstPayPaymentForm.Initialize();
        }
        else
            this.CreditCardPaymentForm1.Show();
    }

	public void Hide()
	{
		this.Visible = false;
		this.UpdatePanelCreditCardAndBillingAddress.Visible = false;
		this.UpdatePanelCreditCardAndBillingAddress.Update();
	}

	public void ShowError(string message)
	{

	}

    public void SaveViewToModel()
    {
        if (BillingAddressEdit1.Visible)
            BillingAddressEdit1.SaveViewToModel();

        CreditCardPaymentForm1.SaveViewToModel();

        // Refresh the billing address. This must happen after CreditCardPaymentForm1.SaveViewToModel().
        if (BillingAddressEdit1.Visible)
            Vortx.OnePageCheckout.Models.Adnsf9200.AdnsfUtility.ContextCustomer.PrimaryBillingAddress.LoadFromDB(int.Parse(this.BillingAddressEdit1.AddressModel.AddressId));
    }

	#endregion

	protected void RadioButtonWallet_CheckedChanged(object sender, EventArgs e)
	{
		if (RadioButtonWallet.Checked)
		{
			WalletSelected = true;

			PanelWallet.Visible = true;
			PanelAddACard.Visible = false;

			WalletSelector1.BindPage();
		}
	}

	protected void RadioButtonNewCard_CheckedChanged(object sender, EventArgs e)
	{		
		if (RadioButtonNewCard.Checked)
		{
			WalletSelected = false;

			PanelWallet.Visible = false;
			PanelAddACard.Visible = true;

			ToggleShowBillSameAsShip(this.BillSameYes.Checked && this.PanelBillSame.Visible);

			AspDotNetStorefrontCore.Customer.Current.ThisCustomerSession["ActivePaymentProfileId"] = string.Empty;
		}
	}
}
