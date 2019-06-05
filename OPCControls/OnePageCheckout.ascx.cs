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
using Vortx.OnePageCheckout;
using Vortx.OnePageCheckout.Models;
using Vortx.OnePageCheckout.Views;
using Vortx.OnePageCheckout.Settings;
using Vortx.OnePageCheckout.Models.PaymentMethods;
using AspDotNetStorefrontCore;

namespace Vortx.OnePageCheckout
{
	public partial class OPCControls_OnePageCheckout :
		System.Web.UI.UserControl
	{
		public IAccountModel AccountModel { get; set; }
		public IAddressView BillingAddressStaticView { get; set; }
		public IAddressView BillingAddressEditView { get; set; }
		public IAccountView BillingAddressBookView { get; set; }
		public IShoppingCartModel ShoppingCartModel { get; set; }
		public IContentModel CustomerServiceModel { get; set; }
		public IPaymentModel PaymentModel { get; set; }
		public CreditCardPaymentModel CreditCardModel { get; set; }
		public IStringResourceProvider StringResourceProvider { get; set; }
		private const string ACTIVE_PANEL_CSSCLASS = "active";

		#region Page Event Handlers

		protected void Page_Load(object sender, EventArgs e)
		{
			IModelFactory modelFactory = Vortx.OnePageCheckout.ObjectFactory.CreateModelFactory();
			IConfigurationProviderFactory configurationFactory = Vortx.OnePageCheckout.ObjectFactory.CreateConfigurationFactory();

			ConfigurationProvider.DefaultProvider = configurationFactory.CreateConfigurationProvider();

			this.StringResourceProvider = modelFactory.CreateStringResourceProvider();

			this.AccountModel = modelFactory.CreateAccountModel();
			this.AccountModel.CreateAccountCompleted += new CreateAccountHandler(AccountModel_CreateAccountCompleted);
			this.AccountModel.FindAccountCompleted += new FindAccountHandler(AccountModel_FindAccountCompleted);
			this.AccountModel.LogOnCompleted += new LogOnHandler(AccountModel_LogOnCompleted);
			this.AccountModel.LogOutCompleted += new LogOutHandler(AccountModel_LogOutCompleted);
			this.AccountModel.AccountChanged += new AccountChangedHandler(AccountModel_AccountChanged);
			this.AccountModel.BillingAddress.AddressChanged += new AddressChangedEventHandler(BillingAddressEditModel_AddressChanged);
			this.AccountModel.ShippingAddress.AddressChanged += new AddressChangedEventHandler(ShippingAddressEditModel_AddressChanged);
			this.AccountModel.PasswordChanged += new PasswordChangedHandler(AccountModel_PasswordChanged);

			this.LoginView.StringResourceProvider = this.StringResourceProvider; 
			this.LoginView.SetModel(this.AccountModel);

			this.CreateAccountView.StringResourceProvider = this.StringResourceProvider; 
			this.CreateAccountView.SetModel(this.AccountModel);
			this.CreateAccountView.AccountCreationActivated += (o, ea) => ApplyAccountCreation();
			
			// Create shopping cart models
			this.ShoppingCartModel = modelFactory.CreateShoppingCartModel();
			this.ShoppingCartModel.AccountModel = this.AccountModel;
			this.ShoppingCartModel.ItemQuantityChanged += new ItemQuantityChangedHandler(ShoppingCartModel_ItemQuantityChanged);
			this.ShoppingCartModel.ItemRemoved += new ItemRemovedHandler(ShoppingCartModel_ItemRemoved);
			this.ShoppingCartModel.ShipMethodChanged += new ShipMethodChangedEventHandler(ShipMethodModel_ShipMethodChanged);

			// Create shopping cart views
			this.ShipMethodView.StringResourceProvider = this.StringResourceProvider; 
			this.ShipMethodView.SetModel(this.ShoppingCartModel);

			this.MiniCartView.StringResourceProvider = this.StringResourceProvider; 
			this.MiniCartView.SetModel(this.ShoppingCartModel);

			this.MiniCartCartSummary.StringResourceProvider = this.StringResourceProvider; 
			this.MiniCartCartSummary.SetModel(this.ShoppingCartModel);

			this.AddressBookView.StringResourceProvider = this.StringResourceProvider; 
			this.AddressBookView.SetModel(this.AccountModel);
			this.AddressBookView.SetAddressType(AddressType.Shipping);
			
			this.ShippingAddressEditView.StringResourceProvider = this.StringResourceProvider; 
			this.ShippingAddressEditView.SetModel(this.AccountModel.ShippingAddress);

			this.ShippingAddressEditUKView.StringResourceProvider = this.StringResourceProvider; 
			this.ShippingAddressEditUKView.SetModel(this.AccountModel.ShippingAddress);

			this.ShippingAddressNoZipEditView.StringResourceProvider = this.StringResourceProvider; 
			this.ShippingAddressNoZipEditView.SetModel(this.AccountModel.ShippingAddress);

			this.ShippingAddressStaticView.StringResourceProvider = this.StringResourceProvider; 
			this.ShippingAddressStaticView.SetModel(this.AccountModel.ShippingAddress);			
			this.ShippingAddressStaticView.AddressEdit += new AddressEditEventHandler(ShippingAddressStaticView_AddressEdit);

			// Create payment model
			this.PaymentModel = modelFactory.CreatePaymentModel();
			this.PaymentModel.ActivePaymentMethodChanged += new ActivePaymentMethodChangedHandler(PaymentMethodModel_ActivePaymentMethodChanged);
			this.PaymentModel.ProcessPaymentComplete += new ProcessPaymentCompleteHandler(PaymentModel_ProcessPaymentComplete);

			if (!ConfigurationProvider.DefaultProvider.ShowCreateAccount &&
				!ConfigurationProvider.DefaultProvider.PasswordIsOptionalDuringCheckout)
			{
                throw new Exception(StringResourceProvider.GetString("smartcheckout.aspx.129"));
			}

			GatewayCheckoutByAmazon.CheckoutByAmazon checkoutByAmazon = new GatewayCheckoutByAmazon.CheckoutByAmazon();

			// Setup payment events
			PaymentMethodBaseModel paymentMethod = null;
			if (checkoutByAmazon.IsEnabled && checkoutByAmazon.IsCheckingOut && (this.PaymentModel.ActivePaymentMethod == null || this.PaymentModel.ActivePaymentMethod.Name.ToLower() != PaymentType.CheckoutByAmazon.ToString().ToLower()))
			{
				this.PaymentModel.SetActivePaymentMethod(PaymentType.CheckoutByAmazon.ToString());
			}
			else
			{
				paymentMethod = this.PaymentModel.PaymentMethods.FirstOrDefault(pm => pm.Key == PaymentType.CreditCard).Value;
				if (paymentMethod != null)
				{
					this.CreditCardModel = (CreditCardPaymentModel) paymentMethod;
					this.CreditCardModel.BillingEqualsShippingChanged += new BillingEqualsShippingChangedHandler(CreditCardModel_BillingEqualsShippingChanged);
				}
			}

			// registered payment data changed events
			foreach (var kvp in this.PaymentModel.PaymentMethods)
			{
				var method = kvp.Value;
				method.PaymentDataChanged += new PaymentDataChangedHandler(PaymentModel_PaymentDataChanged);
			}

			// Create payment views
			this.PaymentView.StringResourceProvider = this.StringResourceProvider; 
			this.PaymentView.SetModel(this.PaymentModel);
			
			this.BillingAddressEditView = this.PaymentView.BillingAddressEditView;
			this.BillingAddressEditView.StringResourceProvider = this.StringResourceProvider; 
			this.BillingAddressEditView.SetModel(this.AccountModel.BillingAddress);			

			this.BillingAddressStaticView = this.PaymentView.BillingAddressStaticView;
			this.BillingAddressStaticView.StringResourceProvider = this.StringResourceProvider; 
			this.BillingAddressStaticView.SetModel(this.AccountModel.BillingAddress);			

			this.BillingAddressBookView = this.PaymentView.AddressBookView;
			this.BillingAddressBookView.StringResourceProvider = this.StringResourceProvider; 
			this.BillingAddressBookView.SetModel(this.AccountModel);
			
			this.AccountModel.PrimaryShippingAddressChanged += new PrimaryShippingAddressChangedHandler(AccountModel_PrimaryShippingAddressChanged);
			this.AccountModel.PrimaryBillingAddressChanged += new PrimaryBillingAddressChangedHandler(AccountModel_PrimaryBillingAddressChanged);

			this.CustomerServiceModel = modelFactory.CreateContentModel();
			this.CustomerServiceModel.LoadContext(Vortx.OnePageCheckout.Settings.ConfigurationProvider.DefaultProvider.CustomerServiceTopic);
			this.CustomerServicePanel.StringResourceProvider = this.StringResourceProvider; 
			this.CustomerServicePanel.SetModel(this.CustomerServiceModel);
			this.CustomerServicePanel.Initialize();
			this.CustomerServicePanel.Show();
			this.CustomerServicePanel.BindView();

			// if billing equals shipping then copy the shipping address to the billing address
			// TODO: evaluate whether or not this logic is neccessary
			if (this.PaymentModel.ActivePaymentMethod != null)
			{
				if (this.PaymentModel.ActivePaymentMethod.PaymentType == PaymentType.CreditCard)
				{
					if (this.CreditCardModel != null)
					{
						if (this.ShoppingCartModel.ShippingRequired && this.CreditCardModel.BillingEqualsShipping)
						{
							this.AccountModel.CopyShippingAddressToBilling();
						}
					}
				}
			}

			if (ConfigurationProvider.DefaultProvider.RequireTermsAndConditions)
			{
				IContentModel termsModel = modelFactory.CreateContentModel();
				termsModel.LoadContext(ConfigurationProvider.DefaultProvider.TermsAndConditionsTopicName);
				ContentPanelTerms.StringResourceProvider = this.StringResourceProvider; 
				ContentPanelTerms.SetModel(termsModel);				
				ContentPanelTerms.BindView();
			}

			if (!Page.IsPostBack)
			{
				this.InitializePage();

				string error = Request.QueryString["error"];
				if (error != null && error.Equals("true"))
				{
                    this.PaymentView.ShowError(StringResourceProvider.GetString("smartcheckout.aspx.130"));
				}

				Page.DataBind();
			}

			StylesheetLiteral.Text = "<link rel=\"stylesheet\" href=\"OPCControls/" + ConfigurationProvider.DefaultProvider.OPCStyleSheetName + "\" />";

			this.UpdatePanelOnePageCheckoutMain.Update();

            ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "registerBuySafeKickers", "try{WriteBuySafeKickers();}catch(err){}", true);
            if (ConfigurationProvider.DefaultProvider.BuySafeEnabled)
            {
                OPC_BuySafeWrap.Attributes.Add("style", "height:102px;");
            }
		}

		private void ResetMoneybookersQuickCheckout()
		{
			if(PaymentModel == null || !(PaymentModel.ActivePaymentMethod is MoneybookersQuickCheckoutPaymentModel))
				return;

			
		}

		public void SubmitOrder_OnClick(object sender, EventArgs e)
		{
			if(this.CreateAccountView.Visible)
				ApplyAccountCreation();

			if (this.ShoppingCartModel.Total > 0)
			{
				this.PaymentView.SaveViewToModel();
			}
			else
			{
				// Force CC payment on zero dollar checkout
				PaymentMethodBaseModel method = this.PaymentModel.PaymentMethods
					.FirstOrDefault(pm => pm.Key == PaymentType.CreditCard).Value;
				this.PaymentModel.SetActivePaymentMethod(method.MethodId);
			}

			if (Page.IsValid)
			{
				this.PaymentModel.ProcessPayment();
			}
		}

		protected void EmailOptInYes_CheckedChanged(object sender, EventArgs e)
		{
			this.AccountModel.AllowEmail = EmailOptInYes.Checked;
			this.AccountModel.Save();
		}

		protected void EmailOptInNo_CheckedChanged(object sender, EventArgs e)
		{
			this.AccountModel.AllowEmail = !EmailOptInNo.Checked;
			this.AccountModel.Save();
		}

		protected void btnRefreshCBAAddress_Click (Object sender, EventArgs e)
		{
			GatewayCheckoutByAmazon.CheckoutByAmazon checkoutByAmazon = new GatewayCheckoutByAmazon.CheckoutByAmazon();
			checkoutByAmazon.BeginCheckout(new Guid(AspDotNetStorefrontCore.Customer.Current.CustomerGUID), false, false);
			this.ShowCurrentPageState();
		}

		protected void Over13Checkbox_CheckedChanged(object sender, EventArgs e)
		{
			ShowCurrentPageState();
		}

		protected void TermsCheckbox_CheckedChanged(object sender, EventArgs e)
		{
			ShowCurrentPageState();
		}

		#endregion

		#region Private State Control Methods

		// Steps

		/*
		 * Enter Email
		 * Enter Password
		 * Enter Shipping Address
		 * Choose Shipping Method
		 * Choose Payment Method
		 * Choose Email Opt In
		 * Create Account
		 * Submit Order
		 * */

		public enum PageStateStep
		{
			LogIn,
			EnterPassword,
			EditShippingAddress,
			ChooseShippingMethod,
			ChoosePaymentMethod,
			ChooseEmailOptIn,
			CreateAccount,
			SubmitOrder
		}

		public PageStateStep CurrentPageStateStep
		{
			get { return (PageStateStep)Session["OPC_CurrentPageStateStep"]; }
			set { Session["OPC_CurrentPageStateStep"] = value; }
		}

		protected void ShowCurrentPageState()
		{
			InitializePageState();

			// Login
			if (!this.AccountModel.IsRegistered && !this.AccountModel.HaveUsername)
			{
				ShowLogin();
				return;
			}

			// Enter Password
			if (this.AccountModel.AccountFound)
			{
				ShowEnterPassword();
				return;
			}

			// we are registered and logged in, but need a password change
			if (this.AccountModel.IsRegistered && this.AccountModel.PasswordChangeRequired)
			{
				this.ShowPasswordChangeRequired();
				return;
			}

			// we are logged in/guest at this point, so Edit address if needed
			if (!IsCheckOutByAmazon() &&
				this.ShoppingCartModel.ShippingRequired &&
				String.IsNullOrEmpty(this.AccountModel.ShippingAddress.Country))
			{
				this.ShowEditShippingAddress();
				return;
			}

			// if we require shipping, then show shipping methods
			if (this.ShoppingCartModel.ShippingRequired &&
				(String.IsNullOrEmpty(this.ShoppingCartModel.ShippingMethodId) ||
				!this.ShoppingCartModel.ShippingMethods.Any(sm => sm.Identifier == this.ShoppingCartModel.ShippingMethodId))
				)
			{
				this.ShowChooseShippingMethod();
				return;
			}

			// If account needs to indicate over 13
			if(AccountModel.IsRegistered)
				PanelCheckboxOver13.Visible = false;

			if(Over13Checkbox.Checked == false && !AccountModel.IsRegistered && ConfigurationProvider.DefaultProvider.RequireOver13Checked)
			{
				ShowOver13();
				return;
			}
			else
				PanelCheckboxOver13.Enabled = true;

			if(!TermsCheckbox.Checked && ConfigurationProvider.DefaultProvider.RequireTermsAndConditions)
			{
				ShowTerms();
				return;
			}
			else
				PanelTerms.Enabled = true;

			// If we require payment, then show payment options
			if (this.ShoppingCartModel.Total > 0)
			{
				this.PaymentView.Show();
				PanelPaymentAndBilling.Visible = true;

				// if we are using credit card payments, make sure we have a billing address
				this.PaymentModel.AccountModel = this.AccountModel;
				if ((this.PaymentModel.PaymentMethods.FirstOrDefault(pm => pm.Key == PaymentType.CreditCard).Value != null) &&
					this.PaymentModel.AccountModel.PrimaryBillingAddressId == "0")
				{
					ConfigureAddresses();
					return;
				}

				// make sure we have a payment method
				if (this.PaymentModel.ActivePaymentMethod == null)
				{
					this.ShowChoosePaymentMethod();
					return;
				}

				// if the active payment method is CC and we don't have data
				if (!this.PaymentModel.ActivePaymentMethod.HavePaymentData)
				{
					// Check if a SecureNet option has been chosen
					if(PaymentModel.ActivePaymentMethod.PaymentType == PaymentType.CreditCard && PaymentModel.PaymentMethods.ContainsKey(PaymentType.SecureNet))
					{
						if(!PaymentModel.PaymentMethods[PaymentType.SecureNet].HavePaymentData)
						{
							this.ShowChoosePaymentMethod();
							return;
						}
					}
					// Check if an Authorize.Net CIM option has been chosen
					else if (new AspDotNetStorefrontGateways.Processors.AuthorizeNet().IsCimEnabled == false || String.IsNullOrEmpty(AspDotNetStorefrontCore.Customer.Current.ThisCustomerSession["ActivePaymentProfileId"]))
					{
						this.ShowChoosePaymentMethod();
						return;
					}
				}
			}
			else
			{
				this.PaymentView.Hide();
				PanelPaymentAndBilling.Visible = false;
			}

			if(PaymentModel.ActivePaymentMethod is MoneybookersQuickCheckoutPaymentModel)
			{
				CreateAccountView.ManualAccountCreationEnabled = true;
				CreateAccountView.AccountCreatedDisplayStringResource = "smartcheckout.aspx.147";
			}

			// if we are already registered, go to the submit order state
			if (this.AccountModel.IsRegistered)
			{
				this.ShowSubmitOrder();
				return;
			}

			// paypal guest express customers don't get to fill in extra stuff, simply complete checkout.
			if (IsPayPalExpressCheckout())
			{
				this.ShowSubmitOrder();
				return;
			}

			// show e-mail opt in if not selected
			if (ConfigurationProvider.DefaultProvider.ShowEmailPreferencesOnCheckout && !this.AccountModel.AllowEmailSelected)
			{
				this.ShowChooseEmailOptIn();
				return;
			}

			if (ConfigurationProvider.DefaultProvider.ShowCreateAccount)
			{
				if (ConfigurationProvider.DefaultProvider.PasswordIsOptionalDuringCheckout)
				{
					// if the customer has not selected yes/no to register, then ask them
					if (!this.AccountModel.RegisterAccountSelected)
					{
						this.ShowCreateAccount();
						return;
					}

					// if the customer has selected 'yes' to registration, then make sure they have a password
					if (this.AccountModel.RegisterAccount && string.IsNullOrEmpty(this.AccountModel.Password))
					{
						this.ShowCreateAccount();
						return;
					}
				}
				else
				{
					if (string.IsNullOrEmpty(this.AccountModel.Password))
					{
						this.ShowCreateAccount();
						return;
					}
				}
			}

			// at this point we have all the data, so submit the order
			this.ShowSubmitOrder();
		}

		private void InitializePageState()
		{
			this.LoginView.Show();
			this.LoginView.BindView();
			this.LoginView.Disable();

			if (this.ShoppingCartModel.ShippingRequired)
			{
				this.PanelShippingMethod.Visible = true;
				this.PanelShippingAddressWrap.Visible = true;

				this.ShipMethodView.Show();
				this.ShipMethodView.BindView();
				this.ShipMethodView.Disable();
			}
			else
			{
				this.PanelShippingMethod.Visible = false;
				this.PanelShippingAddressWrap.Visible = false;

				this.ShipMethodView.Hide();
			}

			this.PaymentView.Show();
			this.PaymentView.BindView();
			this.PaymentView.Disable();

			this.ShippingAddressStaticView.Hide();
			this.ShippingAddressEditView.Hide();
			this.ShippingAddressEditUKView.Hide();
			this.ShippingAddressNoZipEditView.Hide();

			PanelTerms.Visible = ConfigurationProvider.DefaultProvider.RequireTermsAndConditions;
			PanelTerms.Enabled = false;

			PanelCheckboxOver13.Enabled = false;

			if (this.AccountModel.IsRegistered)
			{
				this.CreateAccountView.Hide();
				this.PanelCreateAccount.Visible = false;
				this.PanelEmailOptIn.Visible = false;

				if (this.ShoppingCartModel.ShippingRequired)
				{
					this.AddressBookView.Show();
					this.AddressBookView.BindView();
					this.AddressBookView.Disable();

					this.HyperLinkShippingAddressBook.Enabled = true;
					this.HyperLinkShippingAddressBook.Visible = true;

					this.ShippingAddressStaticView.Show();
					this.ShippingAddressStaticView.BindView();
					this.ShippingAddressStaticView.Disable();
				}
			}
			else
			{
				this.EmailOptInYes.Enabled = this.AccountModel.AllowEmailSelected;

				litEmailPrefYes.Text = this.StringResourceProvider.GetString("smartcheckout.aspx.4");
				litEmailPrefNo.Text = this.StringResourceProvider.GetString("smartcheckout.aspx.5");

				this.EmailOptInNo.Enabled = this.AccountModel.AllowEmailSelected;
				this.PanelEmailOptIn.Visible = ConfigurationProvider.DefaultProvider.ShowEmailPreferencesOnCheckout;

				if (this.ShoppingCartModel.ShippingRequired)
				{
					if (string.IsNullOrEmpty(this.AccountModel.ShippingAddress.Country))
					{
						if (ConfigurationProvider.DefaultProvider.AddressLocale.Equals("UK"))
						{
							this.ShippingAddressEditUKView.Initialize();
							this.ShippingAddressEditUKView.Show();
							this.ShippingAddressEditUKView.BindView();
							this.ShippingAddressEditUKView.Disable();
						}
						else
						{
							if (ConfigurationProvider.DefaultProvider.UseZipcodeService)
							{
								this.ShippingAddressEditView.Initialize();
								this.ShippingAddressEditView.Show();
								this.ShippingAddressEditView.BindView();
								this.ShippingAddressEditView.Disable();
							}
							else
							{
								this.ShippingAddressNoZipEditView.Initialize();
								this.ShippingAddressNoZipEditView.Show();
								this.ShippingAddressNoZipEditView.BindView();
								this.ShippingAddressNoZipEditView.Disable();
							}
						}
					}
					else
					{
						this.ShippingAddressStaticView.Show();
						this.ShippingAddressStaticView.BindView();
						this.ShippingAddressStaticView.Disable();
					}
				}

				if (!ConfigurationProvider.DefaultProvider.ShowCreateAccount &&
					ConfigurationProvider.DefaultProvider.PasswordIsOptionalDuringCheckout)
				{
					this.CreateAccountView.Hide();
					this.PanelCreateAccount.Visible = false;
				}
				else
				{
					this.CreateAccountView.Show();
					this.CreateAccountView.BindView();
					this.CreateAccountView.Disable();
					this.PanelCreateAccount.Visible = true;
				}

				this.HyperLinkShippingAddressBook.Enabled = false;
				this.HyperLinkShippingAddressBook.Visible = false;

				this.AddressBookView.Hide();

				PanelCheckboxOver13.Visible = ConfigurationProvider.DefaultProvider.RequireOver13Checked;
			}

			// Show / Hide payment screen if zero dollar order
			PanelPaymentAndBilling.Visible = this.ShoppingCartModel.Total > 0;

			this.MiniCartCartSummary.BindView();

			// if amazon payments, show widgets, and disable shipping address editor
			GatewayCheckoutByAmazon.CheckoutByAmazon checkoutByAmazon = new GatewayCheckoutByAmazon.CheckoutByAmazon();

			var amazonPaymentModel = this.PaymentModel.PaymentMethods.FirstOrDefault(pm => pm.Key == PaymentType.CheckoutByAmazon).Value;
			if (amazonPaymentModel != null)
			{
				var paymentMethod = (CheckOutByAmazonPaymentModel)amazonPaymentModel;
				LitCheckOutByAmazoneShipping.Text = paymentMethod.RenderAddressWidget(new Guid(AspDotNetStorefrontCore.Customer.Current.CustomerGUID));
				LitAmazonPaymentWidget.Text = paymentMethod.RenderWalletWidget();
			}

			if (IsCheckOutByAmazon())
			{
				PanelCheckOutByAmazonShipping.Visible = true;
				PanelShippingAddressWrap.Visible = false;
				ShippingAddressEditView.Hide();
				ShippingAddressEditUKView.Hide();
				ShippingAddressStaticView.Hide();
				this.ShippingAddressEditView.Visible = false;

				if (checkoutByAmazon.GetDefaultShippingAddress() == null)
				{
					SubmitOrder.OnClientClick = "alert('" + this.StringResourceProvider.GetString("gw.checkoutbyamazon.display.3") + "'); return false;";
				}
			}

			this.SubmitOrder.Visible = false;
			this.SubmitOrder.Enabled = false;
		}

		private void ShowLogin()
		{
			this.LoginView.Enable();
			this.LoginView.BindView();

			this.ActivatePanelClass(PanelAccount, ACTIVE_PANEL_CSSCLASS);
		}

		private void ShowEnterPassword()
		{
			this.LoginView.Enable();
			this.LoginView.BindView();
			this.LoginView.ShowAccountFound();

			this.ActivatePanelClass(PanelAccount, ACTIVE_PANEL_CSSCLASS);
		}

		private void ShowPasswordChangeRequired()
		{
			this.LoginView.Disable();
			this.ActivatePanelClass(PanelAccount, ACTIVE_PANEL_CSSCLASS);
		}

		private void ShowEditShippingAddress()
		{
			this.ShipMethodView.Disable();
			this.PaymentView.Disable();
			this.CreateAccountView.Disable();
			this.SubmitOrder.Visible = false;
			this.EmailOptInNo.Enabled = false;
			this.EmailOptInYes.Enabled = false;

			this.ShippingAddressStaticView.Hide();
			if (ConfigurationProvider.DefaultProvider.AddressLocale.Equals("UK"))
			{
				this.ShippingAddressEditUKView.Show();
				this.ShippingAddressEditUKView.BindView();
				this.ShippingAddressEditUKView.Enable();
			}
			else
			{
				//default is US
				if (ConfigurationProvider.DefaultProvider.UseZipcodeService)
				{
					this.ShippingAddressEditView.Show();
					this.ShippingAddressEditView.BindView();
					this.ShippingAddressEditView.Enable();
				}
				else
				{
					this.ShippingAddressNoZipEditView.Show();
					this.ShippingAddressNoZipEditView.BindView();
					this.ShippingAddressNoZipEditView.Enable();
				}
			}

			this.ActivatePanelClass(PanelShippingAddressWrap, ACTIVE_PANEL_CSSCLASS);
		}

		private void ShowChooseShippingMethod()
		{
			this.ShippingAddressStaticView.Enable();
			this.ShipMethodView.Enable();
			this.ActivatePanelClass(PanelShippingMethod, ACTIVE_PANEL_CSSCLASS);
		}

		private void ShowOver13()
		{
			ShippingAddressStaticView.Enable();
			ShipMethodView.Enable();
			PanelCheckboxOver13.Enabled = true;
			ActivatePanelClass(PanelCheckboxOver13, ACTIVE_PANEL_CSSCLASS);
		}

		private void ShowTerms()
		{
			ShippingAddressStaticView.Enable();
			ShipMethodView.Enable();
			PanelTerms.Enabled = true;
			ActivatePanelClass(PanelTerms, ACTIVE_PANEL_CSSCLASS);
		}

		private void ShowChoosePaymentMethod()
		{
			this.ShippingAddressStaticView.Enable();
			this.ShipMethodView.Enable();
			this.PaymentView.Enable();
			this.ActivatePanelClass(PanelPaymentAndBilling, ACTIVE_PANEL_CSSCLASS);
		}

		private void ShowChooseEmailOptIn()
		{
			this.ShippingAddressStaticView.Enable();
			this.ShipMethodView.Enable();
			this.PaymentView.Enable();

			if (this.ShoppingCartModel.Total > 0 &&
				this.PaymentModel.ActivePaymentMethod.PaymentType == PaymentType.CreditCard &&
				string.IsNullOrEmpty(this.CreditCardModel.CVV2))
			{
				this.ActivatePanelClass(PanelPaymentAndBilling, ACTIVE_PANEL_CSSCLASS);
			}
			else
			{
				this.EmailOptInYes.Enabled = true;
				this.EmailOptInNo.Enabled = true;

				this.ActivatePanelClass(PanelEmailOptIn, ACTIVE_PANEL_CSSCLASS);
				if (this.ShoppingCartModel.Total == 0)
					this.PaymentView.Hide();
			}
		}

		private void ShowCreateAccount()
		{
			this.ShippingAddressStaticView.Enable();
			this.ShipMethodView.Enable();
			this.PaymentView.Enable();

			if (this.AccountModel.AllowEmail)
			{
				EmailOptInNo.Checked = false;
				EmailOptInYes.Checked = true;
			}
			else
			{
				EmailOptInNo.Checked = true;
				EmailOptInYes.Checked = false;
			}

			if (this.ShoppingCartModel.Total > 0 &&
				this.PaymentModel.ActivePaymentMethod.PaymentType == PaymentType.CreditCard &&
				string.IsNullOrEmpty(this.CreditCardModel.CVV2))
			{
				this.ActivatePanelClass(PanelPaymentAndBilling, ACTIVE_PANEL_CSSCLASS);
			}
			else
			{
				this.CreateAccountView.Show();
				this.CreateAccountView.BindView();
				this.CreateAccountView.Enable();

				this.ActivatePanelClass(PanelCreateAccount, ACTIVE_PANEL_CSSCLASS);
			}
		}

		private void ShowSubmitOrder()
		{
			ActivatePanelClass(PanelSubmit, ACTIVE_PANEL_CSSCLASS);

			this.ShippingAddressStaticView.Enable();
			this.ShipMethodView.Enable();
			this.PaymentView.Enable();

			if (this.AccountModel.AllowEmail)
			{
				EmailOptInNo.Checked = false;
				EmailOptInYes.Checked = true;
			}
			else
			{
				EmailOptInNo.Checked = true;
				EmailOptInYes.Checked = false;
			}

			if (!this.AccountModel.IsRegistered)
			{
				this.CreateAccountView.Show();
				this.CreateAccountView.BindView();
				this.CreateAccountView.Enable();
			}

			if(IsMoneybookersQuickCheckout())
			{
				PanelCompleteMoneybookersQuickCheckout.Visible = true;
			    SubmitOrder.Visible = false;
			    return;
			}

            if (IsPayPalEmbeddedCheckout())
            {
                SubmitOrder.Visible = false;
                return;
            }

			this.SubmitOrder.Visible = true;
			this.SubmitOrder.Enabled = true;
		}

		/// <summary>
		/// Determines what state the page should be in at initial load.
		/// </summary>
		private void InitializePage()
		{
			// Initialize views
			this.LoginView.Initialize();
			this.AddressBookView.Initialize();

			if (ConfigurationProvider.DefaultProvider.AddressLocale.Equals("UK"))
			{
				this.ShippingAddressEditUKView.Initialize();
				this.ShippingAddressEditView.Hide();
				this.ShippingAddressNoZipEditView.Hide();
			}
			else
			{
				this.ShippingAddressEditUKView.Hide();
				if (ConfigurationProvider.DefaultProvider.UseZipcodeService)
				{
					this.ShippingAddressEditView.Initialize();
					this.ShippingAddressNoZipEditView.Hide();
				}
				else
				{
					this.ShippingAddressEditView.Hide();
					this.ShippingAddressNoZipEditView.Initialize();
				}
			}

			this.ShippingAddressStaticView.Initialize();
			this.ShipMethodView.Initialize();
			this.PaymentView.Initialize();
			this.CreateAccountView.Initialize();

			this.MiniCartView.Initialize();
			this.MiniCartView.Show();
			this.MiniCartView.BindView();

			this.MiniCartCartSummary.Initialize();
			this.MiniCartCartSummary.Show();
			this.MiniCartCartSummary.BindView();

			if (this.AccountModel.HaveUsername)
			{
				// notify the other models to refresh their state
				this.ShoppingCartModel.AccountModel = this.AccountModel;
				this.PaymentModel.AccountModel = this.AccountModel;
			}

			// Refresh page state
			ShowCurrentPageState();
		}

		private void ActivatePanelClass(Panel panelActive, string className)
		{
			// remove class from other panels
			WebUtility.PageUtility.RemoveClass(PanelAccount, className);
			WebUtility.PageUtility.RemoveClass(PanelShippingAddressWrap, className);
			WebUtility.PageUtility.RemoveClass(PanelShippingMethod, className);
			WebUtility.PageUtility.RemoveClass(PanelCheckboxOver13, className);
			WebUtility.PageUtility.RemoveClass(PanelTerms, className);
			WebUtility.PageUtility.RemoveClass(PanelPaymentAndBilling, className);
			WebUtility.PageUtility.RemoveClass(PanelCreateAccount, className);
			WebUtility.PageUtility.RemoveClass(PanelSubmit, className);
			WebUtility.PageUtility.RemoveClass(PanelEmailOptIn, className);

			WebUtility.PageUtility.AddClass(panelActive, className);
		}
		#endregion

		#region Model Events

		protected void PaymentModel_PaymentDataChanged(object source, EventArgs args)
		{
			// Refresh page state
			this.ShowCurrentPageState();
		}

		protected void CreditCardModel_BillingEqualsShippingChanged(object source, EventArgs args)
		{
			ConfigureAddresses();
			// refresh page state???
		}

		protected void AccountModel_PrimaryBillingAddressChanged(object sender, EventArgs args)
		{
			// Reload the principal's primary billing address (and shipping if it's the same)
			var customer = ((AspDotNetStorefrontPrincipal)HttpContext.Current.User).ThisCustomer;
			int newAddressId = Int32.Parse(AccountModel.PrimaryShippingAddressId);
			bool reloadShipping = customer.PrimaryBillingAddressID == customer.PrimaryShippingAddressID;

			customer.PrimaryBillingAddressID = newAddressId;
			if(reloadShipping)
				customer.PrimaryShippingAddressID = newAddressId;

			// Refresh page state
			this.ShowCurrentPageState();
		}

		protected void AccountModel_PrimaryShippingAddressChanged(object sender, EventArgs args)
		{
			// Reload the principal's primary shipping address (and billing if it's the same)
			var customer = ((AspDotNetStorefrontPrincipal)HttpContext.Current.User).ThisCustomer;
			int newAddressId = Int32.Parse(AccountModel.PrimaryShippingAddressId);
			bool reloadBilling = customer.PrimaryBillingAddressID == customer.PrimaryShippingAddressID;

			customer.PrimaryShippingAddressID = newAddressId;
			if(reloadBilling)
				customer.PrimaryBillingAddressID = newAddressId;

			// refresh the account model because shipping method has changed.
			this.AccountModel.LoadContext(HttpContext.Current.User.Identity.Name);

			this.ShoppingCartModel.AccountModel = this.AccountModel;
			this.PaymentModel.AccountModel = this.AccountModel;

			// no need to refresh page state, because the ShippingMethodChanged event will fire

			// invalidate selected shipping method
			this.ShoppingCartModel.ShippingMethodId = "";
		}

		protected void AccountModel_LogOutCompleted(object sender, EventArgs args)
		{
			this.ShoppingCartModel.ShippingMethodId = string.Empty;

			// Refresh page state
			this.ShowCurrentPageState();
		}

		protected void AccountModel_LogOnCompleted(object sender, LogOnEventArgs args)
		{
			if (args.Successful)
			{
				// Redirect to smartcheckout to refresh context
				Response.Redirect("~/smartcheckout.aspx");
			}

			// show login state
			this.ShowLogin();

			// Set the login view state
			if (String.IsNullOrEmpty(args.ErrorMessage))
			{
				this.LoginView.BindView(false);
			}
			else
			{
				this.LoginView.ShowError(args.ErrorMessage);
			}
		}

		protected void AccountModel_CreateAccountCompleted(object sender, CreateAccountEventArgs args)
		{
			if (args.AlreadyExists || !args.Successful)
			{
				this.AccountModel.Username = string.Empty;
				this.AccountModel.Password = string.Empty;

				// Refresh page state
				this.ShowCurrentPageState();

				this.LoginView.ShowError(args.ErrorMessage);
			}
			else if (args.Successful)
			{
				// Refresh page state
				this.ShowCurrentPageState();
			}
		}

		protected void AccountModel_FindAccountCompleted(object sender, FindAccountEventArgs args)
		{
			if (args.Successful)
			{
				// need to enter password now, because we found the account
				this.ShowEnterPassword();
			}
			else
			{
				// Todo: eval anon conditions
				// Todo: these options should be editable on logon view
				this.AccountModel.Over13 = true;
				this.AccountModel.Email = this.AccountModel.Username;
				this.AccountModel.PersistLogOn = true;
				this.AccountModel.FirstName = String.Empty;
				this.AccountModel.LastName = String.Empty;

				// Create an anon account
				this.AccountModel.CreateAccount();
			}
		}

		/// <summary>
		/// Fires when the account model is saved
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="args"></param>
		protected void AccountModel_AccountChanged(object sender, EventArgs args)
		{
			// Refresh page state
			this.ShowCurrentPageState();
		}

		protected void ShoppingCartModel_ItemRemoved(object source, EventArgs args)
		{
			if (this.ShoppingCartModel.ShoppingCartItems.Count() <= 0)
			{
				Response.Redirect("~/shoppingcart.aspx");
			}
	
			PaymentView.NotifyOrderDetailsChanged();

			this.MiniCartCartSummary.BindView();
			this.MiniCartView.BindView();
			this.ShoppingCartModel.ShippingMethodId = string.Empty;
		}

		protected void ShoppingCartModel_ItemQuantityChanged(object source, EventArgs args)
		{
			if (this.ShoppingCartModel.ShoppingCartItems.Count() <= 0)
			{
				Response.Redirect("~/shoppingcart.aspx");
			}

			PaymentView.NotifyOrderDetailsChanged();

			this.MiniCartView.BindView();
			this.MiniCartCartSummary.BindView();
			this.ShoppingCartModel.ShippingMethodId = string.Empty;
		}

		protected void ShipMethodModel_ShipMethodChanged(object sender, EventArgs eventArgs)
		{
			PaymentView.NotifyOrderDetailsChanged();

			// Refresh page state
			this.ShowCurrentPageState();
		}

		protected void PaymentMethodModel_ActivePaymentMethodChanged(object source, EventArgs args)
		{
			// refresh the account model
			this.AccountModel.LoadContext(HttpContext.Current.User.Identity.Name);

			this.PaymentModel.AccountModel = this.AccountModel;
			this.ShoppingCartModel.AccountModel = this.AccountModel;

			if (!(PaymentModel.ActivePaymentMethod is Vortx.OnePageCheckout.Models.PaymentMethods.Adnsf9200.CheckOutByAmazonPayment))
			{
				GatewayCheckoutByAmazon.CheckoutByAmazon checkoutByAmazon = new GatewayCheckoutByAmazon.CheckoutByAmazon();
				checkoutByAmazon.ResetCheckout(AspDotNetStorefrontCore.Customer.Current.CustomerID);
				//Response.Redirect("smartcheckout.aspx");
			}
			else
			{
				PanelCheckOutByAmazonShipping.Visible = true;
				LitAmazonPaymentWidget.Visible = true;
			}
			// Refresh page state
			this.ShowCurrentPageState();
		}

		protected void PaymentModel_ProcessPaymentComplete(object source, ProcessPaymentCompleteEventArgs args)
		{
			if (args.Success)
			{
				this.PaymentView.BindView(args.OrderNumber);
			}
			else if(args.Message != null && args.Message.Equals(ConfigurationProvider.DefaultProvider.ro_3DSecure))
			{
				this.PaymentView.Redirect3DSecure();
			}
			else
			{
				this.PaymentView.ShowError(args.Message);
			}
		}

		protected void AccountModel_PasswordChanged(object sender, PasswordChangedEventArgs args)
		{
			if (args.Successful)
			{
				// Refresh page state
				this.ShowCurrentPageState();
			}
		}

		#endregion

		#region View Events

		protected void ShippingAddressStaticView_AddressEdit(object sender, EventArgs args)
		{
			// edit the shipping address
			this.ShowEditShippingAddress();
		}

		protected void ShippingAddressEditModel_AddressChanged(object sender, AddressChangedEventArgs addressChanged)
		{
			// update primary shipping address id
			this.AccountModel.PrimaryShippingAddressId = this.AccountModel.ShippingAddress.AddressId;

			// if we don't have a billing address yet, then set the billing address id = shipping address id
			if (string.IsNullOrEmpty(this.AccountModel.PrimaryBillingAddressId) || this.AccountModel.PrimaryBillingAddressId == "0")
			{
				this.AccountModel.PrimaryBillingAddressId = this.AccountModel.PrimaryShippingAddressId;
			}

			PaymentView.NotifyOrderDetailsChanged();
		}

		protected void BillingAddressEditModel_AddressChanged(object sender, AddressChangedEventArgs addressChanged)
		{
			PaymentView.NotifyOrderDetailsChanged();
		}

		#endregion

		private void ConfigurePrimaryBillingAddress()
		{
			IAddressModel address = this.AccountModel.AddressBook
						.FirstOrDefault(abm => abm.AddressId != this.AccountModel.PrimaryShippingAddressId);
			if (address != null)
			{
				// set the billing address id to the first non-shipping address found.                    
				this.AccountModel.PrimaryBillingAddressId = address.AddressId;
			}
			else
			{
				// set to zero, which will force the creation of an address
				this.AccountModel.PrimaryBillingAddressId = "0";
			}
		}

		private void ConfigureAddresses()
		{
			if (this.ShoppingCartModel.ShippingRequired)
			{
				// if billing equals shipping then set them to the same address
				if (this.CreditCardModel.BillingEqualsShipping)
				{
					this.AccountModel.PrimaryBillingAddressId = this.AccountModel.PrimaryShippingAddressId;
				}
				else // otherwise select a billing address
				{
					ConfigurePrimaryBillingAddress();
				}
			}
			else
			{
				// if shipping isn't required, make sure we have a billing address anyway.
				if (this.AccountModel.PrimaryShippingAddressId == "0")
				{
					ConfigurePrimaryBillingAddress();
				}

				// make sure there is a shipping address id, even if shipping isn't required.
				// Some payment methods require shipping address details
				this.AccountModel.PrimaryShippingAddressId = this.AccountModel.PrimaryBillingAddressId;
			}
		}

		private bool IsShortenedCheckout()
		{
			return IsPayPalExpressCheckout() || IsCheckOutByAmazon();
		}

		private bool IsPayPalExpressCheckout()
		{
			var payPalExpressCheckout = false;
			if (this.PaymentModel.ActivePaymentMethod != null)
			{
				var paymentType = this.PaymentModel.ActivePaymentMethod.PaymentType;
				if (paymentType == PaymentType.PayPalExpress)
				{
					payPalExpressCheckout = ((PaypalExpressPaymentModel)this.PaymentModel.ActivePaymentMethod).ExpressLoginComplete;
				}
			}
			return payPalExpressCheckout;
		}

		private bool IsCheckOutByAmazon()
		{
			return new GatewayCheckoutByAmazon.CheckoutByAmazon().IsCheckingOut;
		}

		private bool IsMoneybookersQuickCheckout()
		{
			if(PaymentModel.ActivePaymentMethod == null)
				return false;

			return PaymentModel.ActivePaymentMethod.PaymentType == PaymentType.MoneybookersQuickCheckout;
		}

        private bool IsPayPalEmbeddedCheckout()
        {
            if (PaymentModel.ActivePaymentMethod == null)
                return false;

            return PaymentModel.ActivePaymentMethod.PaymentType == PaymentType.PayPalEmbeddedCheckout;
        }

		private void ApplyAccountCreation()
		{
			this.AccountModel.Over13 = Over13Checkbox.Checked;
			this.CreateAccountView.SaveViewToModel();
		}
	}
}
