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

public partial class VortxControls_PaymentMethodSelector :
	System.Web.UI.UserControl,
	IPaymentView
{
	public event EventHandler OrderDetailsChanged;

	private IPaymentMethodView CreditCardPaymentView
	{
		get { return this.CreditCardPaymentViewForm; }
	}

	public IAddressView BillingAddressEditView
	{
		get { return this.CreditCardPaymentViewForm.BillingAddressEditView; }
	}

	public IAddressView BillingAddressStaticView
	{
		get { return this.CreditCardPaymentViewForm.BillingAddressStaticView; }
	}
	public IAccountView AddressBookView
	{
		get { return this.CreditCardPaymentViewForm.AddressBookView; }
	}

	#region Page Events

	private void SetActivePaymentMethodFromForm(PaymentType paymentType)
	{
		PaymentMethodBaseModel method = this.PaymentModel.PaymentMethods
			.FirstOrDefault(pm => pm.Key == paymentType).Value;

		ToggleCheckoutByAmazonForm(false);

		this.PaymentModel.SetActivePaymentMethod(method.MethodId);
	}
	protected void RadioCreditCard_CheckedChanged(object sender, EventArgs e)
	{
		SetActivePaymentMethodFromForm(PaymentType.CreditCard);
	}
	protected void RadioPurchaseOrder_CheckedChanged(object sender, EventArgs e)
	{
		SetActivePaymentMethodFromForm(PaymentType.PurchaseOrder);
	}
	protected void RadioPayPal_CheckedChanged(object sender, EventArgs e)
	{
		SetActivePaymentMethodFromForm(PaymentType.PayPal);
	}
	protected void RadioCheckByMail_CheckedChanged(object sender, EventArgs e)
	{
		SetActivePaymentMethodFromForm(PaymentType.CheckByMail);
	}
	protected void RadioPayPalExpress_CheckedChanged(object sender, EventArgs e)
	{
		SetActivePaymentMethodFromForm(PaymentType.PayPalExpress);
	}
	protected void RadioRequestQuote_CheckedChanged(object sender, EventArgs e)
	{
		SetActivePaymentMethodFromForm(PaymentType.RequestAQuote);
	}
	protected void RadioMicroPay_CheckedChanged(object sender, EventArgs e)
	{
		SetActivePaymentMethodFromForm(PaymentType.MicroPay);
	}
	protected void RadioCod_CheckedChanged(object sender, EventArgs e)
	{
		SetActivePaymentMethodFromForm(PaymentType.COD);
	}
    protected void RadioCheckOutByAmazon_CheckedChanged(object sender, EventArgs e)
    {
        SetActivePaymentMethodFromForm(PaymentType.CheckoutByAmazon);
    }
    protected void RadioPayPalEmbeddedCheckout_CheckedChanged(object sender, EventArgs e)
    {
        SetActivePaymentMethodFromForm(PaymentType.PayPalEmbeddedCheckout);
    }
	protected void RadioMoneybookersQuickCheckout_CheckedChanged(object sender, EventArgs e)
	{
		SetActivePaymentMethodFromForm(PaymentType.MoneybookersQuickCheckout);
	}

	#endregion

	protected override void OnLoad(EventArgs e)
	{
		base.OnLoad(e);

		OrderDetailsChanged += (o, ea) => MoneybookersQuickCheckoutPaymentView.ResetCheckout();
	}

	#region Private Methods

	private void HidePaymentForms()
	{
		ToggleForm(CheckPaymentView, RadioCheckByMail, false);
		ToggleForm(PayPalPaymentView, RadioPayPal, false);
		ToggleCreditCardForm(false);
		ToggleForm(PurchaseOrderPaymentView, RadioPurchaseOrder, false);
		ToggleForm(RequestQuoteView, RadioRequestQuote, false);
		ToggleForm(MicroPayPaymentView, RadioMicroPay, false);
		ToggleForm(CodPaymentView, RadioCod, false);
		TogglePayPalExpressForm(false);
		ToggleCheckoutByAmazonForm(false);
        TogglePayPalEmbeddedCheckoutForm(false);
		ToggleForm(MoneybookersQuickCheckoutPaymentView, RadioMoneybookersQuickCheckout, false);
	}

	private void HidePaymentFormPanels()
	{
		PanelCreditCardMethod.Visible = false;
		RadioCreditCard.Visible = false;

		PanelCheckMoneyOrderMethod.Visible = false;
		RadioCheckByMail.Visible = false;

		PanelPayPalMethod.Visible = false;
		RadioPayPal.Visible = false;

		PanelPaypalExpressMethod.Visible = false;
		RadioPayPalExpress.Visible = false;

		PanelRequestQuote.Visible = false;
		RadioPurchaseOrder.Visible = false;

		PanelMicroPayMethod.Visible = false;
		RadioMicroPay.Visible = false;

		PanelCodMethod.Visible = false;
		RadioCod.Visible = false;

		PanelCheckoutByAmazon.Visible = false;
		RadioCheckoutByAmazon.Visible = false;

        PanelPayPalEmbeddedCheckout.Visible = false;
        RadioPayPalEmbeddedCheckout.Visible = false;

		PanelMoneybookersQuickCheckout.Visible = false;
		RadioMoneybookersQuickCheckout.Visible = false;
	}

	private void ToggleForm(IPaymentMethodView paymentView, RadioButton radioButton, bool show)
	{
		if(show)
		{
			HidePaymentForms();

			radioButton.Checked = true;
			paymentView.Initialize();
			paymentView.Show();
			paymentView.BindView();
		}
		else
		{
			radioButton.Checked = false;
			paymentView.Hide();
		}
	}

	private void ToggleCreditCardForm(bool show)
	{
		if (show)
		{
			HidePaymentForms();

			RadioCreditCard.Checked = true;

			if(!SecureNetPaymentView.IsVaultPaymentSelected)
			{
				CreditCardPaymentViewForm.Initialize();
				CreditCardPaymentViewForm.Show();
				CreditCardPaymentViewForm.BindView();
			}

			SecureNetPaymentView.Initialize();
			SecureNetPaymentView.Show();
			SecureNetPaymentView.BindView();
		}
		else
		{
			RadioCreditCard.Checked = false;
			CreditCardPaymentViewForm.Hide();
			SecureNetPaymentView.Hide();
		}
	}

	private void TogglePayPalExpressForm(bool show)
	{
		if (show)
		{
			HidePaymentForms();

			RadioPayPalExpress.Checked = true;
			PayPalExpressView.Initialize();
			PayPalExpressView.Show();
			PayPalExpressView.BindView();

			if (PayPalExpressView != null)
			{
				if (PayPalExpressView.PaymentMethodModel != null)
				{
					if (((PaypalExpressPaymentModel)PayPalExpressView.PaymentMethodModel).ExpressLoginComplete)
					{
						RadioPayPal.Visible = false;
						RadioCheckByMail.Visible = false;
						RadioCreditCard.Visible = false;
						PanelCreditCardMethod.Visible = false;
						PanelPayPalMethod.Visible = false;
						PanelCheckMoneyOrderMethod.Visible = false;
					}
				}
			}
		}
		else
		{
			RadioPayPalExpress.Checked = false;
			PayPalExpressView.Hide();
		}
	}

    private void ToggleCheckoutByAmazonForm(bool show)
    {
        if (show)
        {
            if (CheckOutByAmazonPaymentView != null)
            {
                if (CheckOutByAmazonPaymentView.PaymentMethodModel != null)
                {
                    if (((CheckOutByAmazonPaymentModel)CheckOutByAmazonPaymentView.PaymentMethodModel).IsCheckingOut)
                    {
                        HidePaymentFormPanels();
                        HidePaymentForms();

                        PanelCheckoutByAmazon.Visible = true;
                        RadioCheckoutByAmazon.Visible = true;
                        RadioCheckoutByAmazon.Checked = true;
                        CheckOutByAmazonPaymentView.Initialize();
                        CheckOutByAmazonPaymentView.Show();
                        CheckOutByAmazonPaymentView.BindView();
                    }
                }
            }
        }
        else
        {
            RadioCheckoutByAmazon.Checked = false;
            CheckOutByAmazonPaymentView.Hide();
        }
    }

    private void TogglePayPalEmbeddedCheckoutForm(bool show)
    {
        if (show)
        {
            if (PayPalEmbeddedCheckoutPaymentView != null)
            {
                if (PayPalEmbeddedCheckoutPaymentView.PaymentMethodModel != null)
                {
                    PanelPayPalEmbeddedCheckout.Visible = true;
                    RadioPayPalEmbeddedCheckout.Visible = true;
                    RadioPayPalEmbeddedCheckout.Checked = true;
                    PayPalEmbeddedCheckoutPaymentView.Initialize();
                    PayPalEmbeddedCheckoutPaymentView.Show();
                    PayPalEmbeddedCheckoutPaymentView.BindView();
                }
            }
        }
        else
        {
            RadioPayPalEmbeddedCheckout.Checked = false;
            PayPalEmbeddedCheckoutPaymentView.Hide();
        }
    }

	private void SetSelectedPaymentMethod()
	{
		if (this.PaymentModel != null)
		{
			PaymentMethodBaseModel method = this.PaymentModel.ActivePaymentMethod;
			if (method != null)
			{
				switch (method.PaymentType)
				{
					case PaymentType.CreditCard:
					case PaymentType.SecureNet:
						{
							ToggleCreditCardForm(true);
						}; break;
					case PaymentType.CheckByMail:
						{
							ToggleForm(CheckPaymentView, RadioCheckByMail, true);
						}; break;
					case PaymentType.PurchaseOrder:
						{
							ToggleForm(PurchaseOrderPaymentView, RadioPurchaseOrder, true);
						}; break;
					case PaymentType.RequestAQuote:
						{
							ToggleForm(RequestQuoteView, RadioRequestQuote, true);
						}; break;
					case PaymentType.PayPal:
						{
							ToggleForm(PayPalPaymentView, RadioPayPal, true);
						} break;
					case PaymentType.PayPalExpress:
						{
							TogglePayPalExpressForm(true);
						} break;
					case PaymentType.MicroPay:
						{
							ToggleForm(MicroPayPaymentView, RadioMicroPay, true);
						} break;
					case PaymentType.COD:
						{
							ToggleForm(CodPaymentView, RadioCod, true);
						} break;
					case PaymentType.CheckoutByAmazon:
						{
							ToggleCheckoutByAmazonForm(true);
						} break;
                    case PaymentType.PayPalEmbeddedCheckout:
                        {
                            TogglePayPalEmbeddedCheckoutForm(true);
                        } break;
					case PaymentType.MoneybookersQuickCheckout:
						{
							ToggleForm(MoneybookersQuickCheckoutPaymentView, RadioMoneybookersQuickCheckout, true);
						} break;
				}
			}
		}
	}

	#endregion

	#region IView Members

	public IStringResourceProvider StringResourceProvider { get; set; }

	public IPaymentModel PaymentModel { get; set; }

	public void SetModel(IPaymentModel model)
	{
		this.PaymentModel = (IPaymentModel)model;
		foreach (var kvp in this.PaymentModel.PaymentMethods)
		{
			PaymentMethodBaseModel method = kvp.Value;
			switch (method.PaymentType)
			{			
				case PaymentType.CreditCard:
					{
						CreditCardPaymentViewForm.StringResourceProvider = this.StringResourceProvider;
						CreditCardPaymentViewForm.SetModel(method);
					}; break;
				case PaymentType.SecureNet:
					{
						SecureNetPaymentView.StringResourceProvider = this.StringResourceProvider;
						SecureNetPaymentView.SetModel(method);

						SecureNetPaymentView.ExistingCreditCardSelected += (o, e) => CreditCardPaymentViewForm.Hide();
						SecureNetPaymentView.NewCreditCardSelected += (o, e) => CreditCardPaymentViewForm.Show();

						PaymentModel.ProcessingPayment += (o, e) => 
						{
							if(!(e.PaymentMethod is CreditCardPaymentModel) && !(e.PaymentMethod is SecureNetPaymentModel))
								return;

							((SecureNetPaymentModel)method).SwitchPaymentMethod();
						};
					} break;
				case PaymentType.CheckByMail:
					{
						CheckPaymentView.StringResourceProvider = this.StringResourceProvider;
						CheckPaymentView.SetModel(method);						
					}; break;
				case PaymentType.RequestAQuote:
					{
						RequestQuoteView.StringResourceProvider = this.StringResourceProvider;
						RequestQuoteView.SetModel(method);
					}; break;
				case PaymentType.PurchaseOrder:
					{
						PurchaseOrderPaymentView.StringResourceProvider = this.StringResourceProvider;
						PurchaseOrderPaymentView.SetModel(method);
					}; break;
				case PaymentType.PayPal:
					{
						PayPalPaymentView.StringResourceProvider = this.StringResourceProvider;
						PayPalPaymentView.SetModel(method);
					}; break;
				case PaymentType.PayPalExpress:
					{
						PayPalExpressView.StringResourceProvider = this.StringResourceProvider;
						PayPalExpressView.SetModel(method);
					} break;
				case PaymentType.MicroPay:
					{
						MicroPayPaymentView.StringResourceProvider = this.StringResourceProvider;
						MicroPayPaymentView.SetModel(method);
					} break;
				case PaymentType.COD:
					{
						CodPaymentView.StringResourceProvider = this.StringResourceProvider;
						CodPaymentView.SetModel(method);
					} break;
				case PaymentType.CheckoutByAmazon:
					{
						CheckOutByAmazonPaymentView.StringResourceProvider = this.StringResourceProvider;
						CheckOutByAmazonPaymentView.SetModel(method);
					} break;
                case PaymentType.PayPalEmbeddedCheckout:
                    {
                        PayPalEmbeddedCheckoutPaymentView.StringResourceProvider = this.StringResourceProvider;
                        PayPalEmbeddedCheckoutPaymentView.SetModel(method);
                    } break;
				case PaymentType.MoneybookersQuickCheckout:
					{
						MoneybookersQuickCheckoutPaymentView.StringResourceProvider = this.StringResourceProvider;
						MoneybookersQuickCheckoutPaymentView.SetModel(method);
					} break;
			}
		}
	}

	public void Initialize()
	{
		HidePaymentForms();

		PanelCreditCardMethod.Visible = false;
		RadioCreditCard.Visible = false;

		PanelCheckMoneyOrderMethod.Visible = false;
		RadioCheckByMail.Visible = false;

		PanelPayPalMethod.Visible = false;
		RadioPayPal.Visible = false;

		PanelPaypalExpressMethod.Visible = false;
		RadioPayPalExpress.Visible = false;

		PanelRequestQuote.Visible = false;
		RadioPurchaseOrder.Visible = false;

		PanelMicroPayMethod.Visible = false;
		RadioMicroPay.Visible = false;

		PanelCodMethod.Visible = false;
		RadioCod.Visible = false;

		PanelCheckoutByAmazon.Visible = false;
		RadioCheckoutByAmazon.Visible = false;

        PanelPayPalEmbeddedCheckout.Visible = false;
        RadioPayPalEmbeddedCheckout.Visible = false;

		PanelMicroPayMethod.Visible = false;
		RadioMicroPay.Visible = false;

		PanelMoneybookersQuickCheckout.Visible = false;
		RadioMoneybookersQuickCheckout.Visible = false;
	}

	public void Disable()
	{
		RadioCreditCard.Enabled = false;
		RadioCheckByMail.Enabled = false;
		RadioPayPal.Enabled = false;
		RadioPayPalExpress.Enabled = false;
		RadioPurchaseOrder.Enabled = false;
		RadioRequestQuote.Enabled = false;
		RadioMicroPay.Enabled = false;
		RadioCod.Enabled = false;
		RadioCheckoutByAmazon.Enabled = false;
        RadioPayPalEmbeddedCheckout.Enabled = false;
		RadioMoneybookersQuickCheckout.Enabled = false;

		CreditCardPaymentViewForm.Disable();
		SecureNetPaymentView.Disable();
		CheckPaymentView.Disable();
		RequestQuoteView.Disable();
		PurchaseOrderPaymentView.Disable();
		PayPalPaymentView.Disable();
		PayPalExpressView.Disable();
		MicroPayPaymentView.Disable();
		CodPaymentView.Disable();
		CheckOutByAmazonPaymentView.Disable();
        PayPalEmbeddedCheckoutPaymentView.Disable();
		MoneybookersQuickCheckoutPaymentView.Disable();
	}

	public void Enable()
	{
		RadioCreditCard.Enabled = true;
		RadioCheckByMail.Enabled = true;
		RadioPayPal.Enabled = true;
		RadioPayPalExpress.Enabled = true;
		RadioPurchaseOrder.Enabled = true;
		RadioRequestQuote.Enabled = true;
		RadioMicroPay.Enabled = true;
		RadioCod.Enabled = true;
		RadioCheckoutByAmazon.Enabled = true;
        RadioPayPalEmbeddedCheckout.Enabled = true;
		RadioMoneybookersQuickCheckout.Enabled = true;

		CreditCardPaymentViewForm.Enable();
		SecureNetPaymentView.Enable();
		CheckPaymentView.Enable();
		RequestQuoteView.Enable();
		PurchaseOrderPaymentView.Enable();
		PayPalPaymentView.Enable();
		PayPalExpressView.Enable();
		MicroPayPaymentView.Enable();
		CodPaymentView.Enable();
		CheckOutByAmazonPaymentView.Enable();        
		MoneybookersQuickCheckoutPaymentView.Enable();

		if (this.PaymentModel.ActivePaymentMethod != null && this.PaymentModel.ActivePaymentMethod.PaymentType == PaymentType.PayPalEmbeddedCheckout)
			PayPalEmbeddedCheckoutPaymentView.Enable();
	}

	public void Show()
	{
		this.Visible = true;
		this.UpdatePanelPaymentInfo.Update();
	}

	public void Hide()
	{
		HidePaymentForms();
		this.Visible = false;
		this.UpdatePanelPaymentInfo.Update();
	}

	public void BindView()
	{
        bool hasPayPal = false;
        List<PaymentMethodBaseModel> payPalOptions = new List<PaymentMethodBaseModel>();

		PanelError.Visible = false;
        CreditCardPaymentViewForm.StringResourceProvider = this.StringResourceProvider;
		SecureNetPaymentView.StringResourceProvider = this.StringResourceProvider;
		CheckPaymentView.StringResourceProvider = this.StringResourceProvider;
        RequestQuoteView.StringResourceProvider = this.StringResourceProvider;
        PayPalPaymentView.StringResourceProvider = this.StringResourceProvider;
        PurchaseOrderPaymentView.StringResourceProvider = this.StringResourceProvider;
        PayPalExpressView.StringResourceProvider = this.StringResourceProvider;
        MicroPayPaymentView.StringResourceProvider = this.StringResourceProvider;
        CodPaymentView.StringResourceProvider = this.StringResourceProvider;
        CheckOutByAmazonPaymentView.StringResourceProvider = this.StringResourceProvider;
        PayPalEmbeddedCheckoutPaymentView.StringResourceProvider = this.StringResourceProvider;
		MoneybookersQuickCheckoutPaymentView.StringResourceProvider = this.StringResourceProvider;

		if (PaymentModel != null)
		{
			foreach (var kvp in this.PaymentModel.PaymentMethods)
			{
				PaymentMethodBaseModel method = kvp.Value;
				switch (method.PaymentType)
				{
					case PaymentType.CreditCard:
						{
							PanelCreditCardMethod.Visible = true;
							CreditCardPaymentViewForm.SetModel(method);
							CreditCardPaymentViewForm.Initialize();
							CreditCardPaymentViewForm.Hide();

							IEnumerable<CreditCardType> cardTypes = ((CreditCardPaymentModel)method).AllowedCardTypes;

							ImageCardTypeVisa.Visible = cardTypes.Contains(CreditCardType.Visa);
							ImageCardTypeMastercard.Visible = cardTypes.Contains(CreditCardType.MasterCard);
							ImageCardTypeAmex.Visible = cardTypes.Contains(CreditCardType.AmericanExpress);
							ImageCardTypeDiscover.Visible = cardTypes.Contains(CreditCardType.Discover);
							ImageCardTypeSolo.Visible = cardTypes.Contains(CreditCardType.Solo);
							ImageCardTypeMaestro.Visible = cardTypes.Contains(CreditCardType.Maestro);

							RadioCreditCard.Visible = true;
							RadioCreditCard.Enabled = true;
							RadioCreditCard.Checked = false;

						}; break;
					case PaymentType.SecureNet:
						{
							SecureNetPaymentView.SetModel(method);
							SecureNetPaymentView.Initialize();
							SecureNetPaymentView.Hide();
						} break;
					case PaymentType.CheckByMail:
						{
							PanelCheckMoneyOrderMethod.Visible = true;
							CheckPaymentView.SetModel(method);							
							CheckPaymentView.Initialize();
							CheckPaymentView.Hide();

							RadioCheckByMail.Visible = true;
							RadioCheckByMail.Enabled = true;
							RadioCheckByMail.Checked = false;
						}; break;
					case PaymentType.RequestAQuote:
						{
							PanelRequestQuote.Visible = true;

							RequestQuoteView.SetModel(method);							
							RequestQuoteView.Initialize();
							RequestQuoteView.Hide();

							RadioRequestQuote.Visible = true;
							RadioRequestQuote.Enabled = true;
							RadioRequestQuote.Checked = false;
						}; break;
					case PaymentType.PurchaseOrder:
						{
							PanelPurchaseOrderMethod.Visible = true;
							PurchaseOrderPaymentView.SetModel(method);
							PurchaseOrderPaymentView.Initialize();
							PurchaseOrderPaymentView.Hide();

							RadioPurchaseOrder.Visible = true;
							RadioPurchaseOrder.Enabled = true;
							RadioPurchaseOrder.Checked = false;
						}; break;
                    case PaymentType.PayPalEmbeddedCheckout:
                    case PaymentType.PayPalExpress:
                    case PaymentType.PayPal:
                        hasPayPal = true;
                        payPalOptions.Add(method);                                                   
                        break;
					case PaymentType.MicroPay:
						{
							PanelMicroPayMethod.Visible = true;

							MicroPayPaymentView.SetModel(method);							
							MicroPayPaymentView.Initialize();
							MicroPayPaymentView.Hide();

							RadioMicroPay.Visible = true;
							RadioMicroPay.Enabled = true;
							RadioMicroPay.Checked = false;
						}; break;
					case PaymentType.COD:
						{
							PanelCodMethod.Visible = true;

							CodPaymentView.SetModel(method);							
							CodPaymentView.Initialize();
							CodPaymentView.Hide();

							RadioCod.Visible = true;
							RadioCod.Enabled = true;
							RadioCod.Checked = false;
						}; break;
					case PaymentType.CheckoutByAmazon:
						{
							CheckOutByAmazonPaymentView.SetModel(method);							
							CheckOutByAmazonPaymentView.Initialize();
							CheckOutByAmazonPaymentView.Hide();

							if (((CheckOutByAmazonPaymentModel)CheckOutByAmazonPaymentView.PaymentMethodModel).IsCheckingOut)
							{
								PanelCheckoutByAmazon.Visible = true;
								RadioCheckoutByAmazon.Visible = true;
								RadioCheckoutByAmazon.Enabled = true;
								RadioCheckoutByAmazon.Checked = false;
							}
						}; break;
					case PaymentType.MoneybookersQuickCheckout:
						{
							MoneybookersQuickCheckoutPaymentView.SetModel(method);
							MoneybookersQuickCheckoutPaymentView.Initialize();
							MoneybookersQuickCheckoutPaymentView.Hide();

							PanelMoneybookersQuickCheckout.Visible = true;
							RadioMoneybookersQuickCheckout.Visible = true;
							RadioMoneybookersQuickCheckout.Enabled = true;
							RadioMoneybookersQuickCheckout.Checked = false;
						} break;
				}
			}
            //PayPal options are mutually exclusive so this will ensure only one shows
            if (hasPayPal)
                HandlePayPalOptions(payPalOptions);
		}

		SetSelectedPaymentMethod();
	}

    private void HandlePayPalOptions(List<PaymentMethodBaseModel> payPalOptions)
    {
        PaymentMethodBaseModel method;
        bool payPalEnabled = false;

        if(payPalOptions.Any(ppo => ppo.PaymentType == PaymentType.PayPalEmbeddedCheckout))
        {
            payPalEnabled = true;
            method = payPalOptions.FirstOrDefault(ppo => ppo.PaymentType == PaymentType.PayPalEmbeddedCheckout);
            PayPalEmbeddedCheckoutPaymentView.SetModel(method);
            PayPalEmbeddedCheckoutPaymentView.Initialize();
            PayPalEmbeddedCheckoutPaymentView.Hide();

            PanelPayPalEmbeddedCheckout.Visible = true;
            RadioPayPalEmbeddedCheckout.Visible = true;
            RadioPayPalEmbeddedCheckout.Enabled = true;
            RadioPayPalEmbeddedCheckout.Checked = false;

			if (PaymentModel.ActivePaymentMethod != null && (PaymentModel.ActivePaymentMethod.PaymentType == PaymentType.PayPalExpress || PaymentModel.ActivePaymentMethod.PaymentType == PaymentType.PayPal))
				PaymentModel.SetActivePaymentMethod(method.MethodId);
        }
        if (payPalOptions.Any(ppo => ppo.PaymentType == PaymentType.PayPalExpress) && !payPalEnabled)
	    {
            payPalEnabled = true;
            method = payPalOptions.FirstOrDefault(ppo => ppo.PaymentType == PaymentType.PayPalExpress);
		    PanelPaypalExpressMethod.Visible = true;            

		    PayPalExpressView.SetModel(method);							
		    PayPalExpressView.Initialize();
		    PayPalExpressView.Hide();

		    RadioPayPalExpress.Visible = true;
		    RadioPayPalExpress.Enabled = true;
		    RadioPayPalExpress.Checked = false;

			if (PaymentModel.ActivePaymentMethod != null && (PaymentModel.ActivePaymentMethod.PaymentType == PaymentType.PayPalEmbeddedCheckout || PaymentModel.ActivePaymentMethod.PaymentType == PaymentType.PayPal))
				PaymentModel.SetActivePaymentMethod(method.MethodId);
	    }
        if (payPalOptions.Any(ppo => ppo.PaymentType == PaymentType.PayPal) && !payPalEnabled)
        {
            payPalEnabled = true;
            method = payPalOptions.FirstOrDefault(ppo => ppo.PaymentType == PaymentType.PayPal);
            PanelPayPalMethod.Visible = true;
            PayPalPaymentView.SetModel(method);
            PayPalPaymentView.Initialize();
            PayPalPaymentView.Hide();

            RadioPayPal.Visible = true;
            RadioPayPal.Enabled = true;
            RadioPayPal.Checked = false;

			if (PaymentModel.ActivePaymentMethod != null && (PaymentModel.ActivePaymentMethod.PaymentType == PaymentType.PayPalEmbeddedCheckout || PaymentModel.ActivePaymentMethod.PaymentType == PaymentType.PayPalExpress))
				PaymentModel.SetActivePaymentMethod(method.MethodId);

        }
    }

	public void BindView(object orderNumber)
	{
		Response.Redirect("~/orderconfirmation.aspx?ordernumber=" + Convert.ToInt32(orderNumber).ToString() +
			"&paymentmethod=" + Server.UrlEncode(this.PaymentModel.ActivePaymentMethod.Name));
	}

	public void SaveViewToModel()
	{
		switch (this.PaymentModel.ActivePaymentMethod.PaymentType)
		{
			case PaymentType.CreditCard:
				{
					SecureNetPaymentView.SaveViewToModel();
					this.CreditCardPaymentViewForm.SaveViewToModel();
				}; break;
			case PaymentType.PayPal:
				{
					this.PayPalPaymentView.SaveViewToModel();
				}; break;
			case PaymentType.CheckByMail:
				{
					this.CheckPaymentView.SaveViewToModel();
				}; break;
			case PaymentType.RequestAQuote:
				{
					this.RequestQuoteView.SaveViewToModel();
				}; break;
			case PaymentType.PurchaseOrder:
				{
					this.PurchaseOrderPaymentView.SaveViewToModel();
				} break;
			case PaymentType.PayPalExpress:
				{
					this.PayPalExpressView.SaveViewToModel();
				} break;
			case PaymentType.MicroPay:
				{
					this.MicroPayPaymentView.SaveViewToModel();
				} break;
			case PaymentType.COD:
				{
					this.CodPaymentView.SaveViewToModel();
				} break;
			case PaymentType.CheckoutByAmazon:
				{
					this.CheckOutByAmazonPaymentView.SaveViewToModel();
				} break;
            case PaymentType.PayPalEmbeddedCheckout:
                {
                    this.PayPalEmbeddedCheckoutPaymentView.SaveViewToModel();
                } break;
			case PaymentType.MoneybookersQuickCheckout:
				{
					MoneybookersQuickCheckoutPaymentView.SaveViewToModel();
				} break;
		}
	}

	public void ShowError(string message)
	{
		PanelError.Visible = true;
		ErrorMessage.Text = message;
	}

	public void Redirect3DSecure()
	{
		Response.Redirect("secureform.aspx");
	}

	#endregion

	public void NotifyOrderDetailsChanged()
	{
		FireOrderDetailsChanged();
	}

	private void FireOrderDetailsChanged()
	{
		if(OrderDetailsChanged != null)
			OrderDetailsChanged(this, EventArgs.Empty);
	}
}
