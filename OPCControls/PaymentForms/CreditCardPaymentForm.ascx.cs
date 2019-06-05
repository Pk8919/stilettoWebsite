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

public partial class OPCControls_CreditCardPaymentForm : 
	System.Web.UI.UserControl,
    IPaymentMethodView
{
	public event EventHandler PaymentFormSubmitted;
	public event EventHandler SecurityCodeTextChanged;

    private Int64 paymentProfileId
    {
        get
        {
            return Session["CCPaymentFormNewProfileId"] == null ? 0 : (Int64)Session["CCPaymentFormNewProfileId"];
        }
        set
        {
            Session["CCPaymentFormNewProfileId"] = value;
        }
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        //Make sure our paymentProfileId is preserved during postbacks but gets cleared out when a user first enters the page
        if (!IsPostBack)
        {
            paymentProfileId = 0;
        }
    }

    protected void SaveCreditCardPaymentForm_Click(object sender, EventArgs e)
    {
        if (PaymentFormSubmitted != null)
            PaymentFormSubmitted(this, null);
		
	    if (SecurityCodeTextChanged != null)
            SecurityCodeTextChanged(this, null);

        ButtonSaveCreditCardPaymentForm.Visible = false;
	}

	protected void CCSecurityCode_OnTextChanged(object sender, EventArgs e)
	{
		if (SecurityCodeTextChanged != null)
			SecurityCodeTextChanged(this, null);
	}

    protected void CCIssueNumber_OnTextChanged(object sender, EventArgs e)
    {
        if (SecurityCodeTextChanged != null)
            SecurityCodeTextChanged(this, null);
    }

	protected void CCNumber_OnTextChanged(object sender, EventArgs e)
	{
		if (SecurityCodeTextChanged != null)
			SecurityCodeTextChanged(this, null);
	}
	
    #region Private Methods

    private void PopupateMonth()
    {
        this.CCExpiresMonth.DataSource = this.CCPaymentMethodModel.AvailableCCMonths;
        this.CCExpiresMonth.DataTextField = "Key";
        this.CCExpiresMonth.DataValueField = "Value";
        this.CCExpiresMonth.DataBind();
    }
    private void SetSelectedMonth()
    {
        PageUtility.SetSelectedValue(CCExpiresMonth, CCPaymentMethodModel.CCMonth);
    }
    private void PopulateYear()
    {
        this.CCExpiresYear.DataSource = this.CCPaymentMethodModel.AvailableCCYears;
        this.CCExpiresYear.DataTextField = "Value";
        this.CCExpiresYear.DataValueField = "Key";
        this.CCExpiresYear.DataBind();
    }
    private void SetSelectedYear()
    {
        PageUtility.SetSelectedValue(CCExpiresYear, CCPaymentMethodModel.CCYear);
    }

    private void SetCardTypeImageOpacity()
    {
        this.ImageCardTypeVisa.CssClass = "opacity25";
        this.ImageCardTypeMastercard.CssClass = "opacity25";
        this.ImageCardTypeDiscover.CssClass = "opacity25";
        this.ImageCardTypeAmex.CssClass = "opacity25";
        this.ImageCardTypeSolo.CssClass = "opacity25";
        this.ImageCardTypeMaestro.CssClass = "opacity25";

        if(!String.IsNullOrEmpty(this.CCPaymentMethodModel.CCNumber))
        {
            switch(this.CCPaymentMethodModel.CreditCardType)
            {
                case CreditCardType.Visa:
                    this.ImageCardTypeVisa.CssClass = "opacity100"; break;
				case CreditCardType.MasterCard:
                    this.ImageCardTypeMastercard.CssClass = "opacity100"; break;
				case CreditCardType.Discover:
                    this.ImageCardTypeDiscover.CssClass = "opacity100"; break;
				case CreditCardType.AmericanExpress:
                    this.ImageCardTypeAmex.CssClass = "opacity100"; break;
                case CreditCardType.Solo:
                    this.ImageCardTypeSolo.CssClass = "opacity100"; break;
                case CreditCardType.Maestro:
                    // enable issue number box if maestro card
                    this.CCIssueNumber.Enabled = true;
                    this.ImageCardTypeMaestro.CssClass = "opacity100"; break;
            }
        }
    }

    #endregion

    #region IPaymentMethod members

	public IStringResourceProvider StringResourceProvider { get; set; }
	private CreditCardPaymentModel CCPaymentMethodModel { get; set; }
	public PaymentMethodBaseModel PaymentMethodModel { get; private set; }
    public void SetModel(PaymentMethodBaseModel model)
	{
		this.PaymentMethodModel = model;
		this.CCPaymentMethodModel = (CreditCardPaymentModel)model;
	}

	public void Initialize()
	{
		PanelError.Visible = false;

		if (this.CCPaymentMethodModel == null)
			return;

        PopupateMonth();
        PopulateYear();

		this.CCNameOnCard.Text = string.Empty;
		this.CCExpiresMonth.ClearSelection();        
        this.CCExpiresYear.ClearSelection();
		this.CCNumber.Text = string.Empty;
		this.CCSecurityCode.Text = string.Empty;
        this.CCIssueNumber.Text = string.Empty;
		this.HFCreditCardType.Value = string.Empty;

		string javascript = String.Format("javascript:setCreditCardType(event,'{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}');",
			 this.HFCreditCardType.ClientID,
             this.ImageCardTypeVisa.ClientID,
             this.ImageCardTypeMastercard.ClientID,
             this.ImageCardTypeDiscover.ClientID,
             this.ImageCardTypeAmex.ClientID,
             this.ImageCardTypeSolo.ClientID,
             this.ImageCardTypeMaestro.ClientID,
             this.CCIssueNumber.ClientID,
             this.CCSecurityCode.ClientID,
             this.CCNumber.ClientID);

        this.CCNumber.Attributes.Add("onkeyup",  javascript);

        SetCardTypeImageOpacity();		       
	}

	public void Disable()
	{
		if (this.CCPaymentMethodModel == null)
			return;

		this.CCNameOnCard.Enabled = false;
		this.CCExpiresMonth.Enabled = false;
		this.CCExpiresYear.Enabled = false;
		this.CCNumber.Enabled = false;
		this.CCSecurityCode.Enabled = false;
        this.CCIssueNumber.Enabled = false;
		this.ButtonSaveCreditCardPaymentForm.Enabled = false;
        this.UpdatePanelCreditCard.Update();
	}

	public void Enable()
	{
		if (this.CCPaymentMethodModel == null)
			return;

        PopupateMonth();
        PopulateYear();
        
        this.CCNameOnCard.Enabled = true;
		this.CCExpiresMonth.Enabled = true;
		this.CCExpiresYear.Enabled = true;
		this.CCNumber.Enabled = true;
		this.CCSecurityCode.Enabled = true;
		this.CCIssueNumber.Enabled = true;
		this.ButtonSaveCreditCardPaymentForm.Enabled = true;
		this.UpdatePanelCreditCard.Update();
	}

	public void Show()
	{
		this.Visible = true;
		this.UpdatePanelCreditCard.Visible = true;
		this.UpdatePanelCreditCard.Update();
	}

	public void Hide()
	{
		this.Visible = false;
		this.UpdatePanelCreditCard.Visible = false;
		this.UpdatePanelCreditCard.Update();
	}

    public void ShowError(string message)
    {
        PanelError.Visible = true;
        ErrorMessage.Text = message;
    }
        
    public void BindView()
	{
		if (this.CCPaymentMethodModel == null)
			return;

		this.CCNameOnCard.Text = this.CCPaymentMethodModel.NameOnCard;
		this.CCNumber.Text = this.CCPaymentMethodModel.CCNumber;
		this.CCSecurityCode.Text = this.CCPaymentMethodModel.CVV2;
        this.CCIssueNumber.Text = this.CCPaymentMethodModel.CCIssueNumber;
        this.SetSelectedMonth();
        this.SetSelectedYear();
		this.HFCreditCardType.Value = this.CCPaymentMethodModel.CreditCardType.ToString();
        this.SetCardTypeImageOpacity();

		IEnumerable<CreditCardType> cardTypes = this.CCPaymentMethodModel.AllowedCardTypes;

		ImageCardTypeVisa.Visible = cardTypes.Contains(CreditCardType.Visa);
		ImageCardTypeMastercard.Visible = cardTypes.Contains(CreditCardType.MasterCard);
		ImageCardTypeAmex.Visible = cardTypes.Contains(CreditCardType.AmericanExpress);
		ImageCardTypeDiscover.Visible = cardTypes.Contains(CreditCardType.Discover);
        ImageCardTypeSolo.Visible = cardTypes.Contains(CreditCardType.Solo);
        ImageCardTypeMaestro.Visible = cardTypes.Contains(CreditCardType.Maestro);

		AspDotNetStorefrontGateways.Processors.AuthorizeNet authorizeNet = new AspDotNetStorefrontGateways.Processors.AuthorizeNet();
		RowSaveToWallet.Visible = authorizeNet.IsCimEnabled;
		
        if (cardTypes.Contains(CreditCardType.Solo) || cardTypes.Contains(CreditCardType.Maestro))
            this.CCIssueNumberRow.Visible = true;
        else
            this.CCIssueNumberRow.Visible = false;

        //Lets always enable the next button unless we have just pushed it.
		//ButtonSaveCreditCardPaymentForm.Visible = !PaymentMethodModel.HavePaymentData;
	}

	public void BindView(object id)
	{

	}

	public void SaveViewToModel()
	{
		Page.Validate("VGCreditCardPayment");

		if(!Page.IsValid)
			return;

		AspDotNetStorefrontGateways.Processors.AuthorizeNet authorizeNet = new AspDotNetStorefrontGateways.Processors.AuthorizeNet();
		if(authorizeNet.IsCimEnabled)
		{
			var customer = AspDotNetStorefrontCore.Customer.Current;
			if(CBSaveToAccount.Checked && paymentProfileId < 1)
			{
				string errorMsg, errorCode;

				string cardNumberToUse;
				if(CCNumber.Text.StartsWith("****"))
					cardNumberToUse = customer.PrimaryBillingAddress.CardNumber;
				else
					cardNumberToUse = CCNumber.Text;

                //set session var so that we don't try to create a new card multiple times
                paymentProfileId = GatewayAuthorizeNet.ProcessTools.SaveProfileAndPaymentProfile(customer.CustomerID, customer.EMail,
						AspDotNetStorefrontCore.AppLogic.AppConfig("StoreName"), paymentProfileId, customer.PrimaryBillingAddressID,
						cardNumberToUse, this.CCSecurityCode.Text, CCExpiresMonth.SelectedValue, CCExpiresYear.SelectedValue, out errorMsg, out errorCode);
				if(paymentProfileId <= 0 && errorCode != "E00039")
				{
					ShowError(errorMsg);
					return;
				}
			}
			if(!string.IsNullOrEmpty(customer.ThisCustomerSession["ActivePaymentProfileId"]))
			{
				long profileId = long.Parse(customer.ThisCustomerSession["ActivePaymentProfileId"]);
				var profile = GatewayAuthorizeNet.DataUtility.GetPaymentProfileWrapper(customer.CustomerID, customer.EMail, profileId);

				string cardType = profile.CardType == "AMEX" ? "AmericanExpress" : profile.CardType;

				this.CCPaymentMethodModel.CCMonth = profile.ExpirationMonth;
				this.CCPaymentMethodModel.CCYear = profile.ExpirationYear;
				this.CCPaymentMethodModel.CCNumber = profile.CreditCardNumberMasked;
				this.CCPaymentMethodModel.CreditCardType = (CreditCardType)
						Enum.Parse(typeof(CreditCardType), cardType, true);

				this.CCPaymentMethodModel.Save();

				return;
			}
		}

		this.CCPaymentMethodModel.NameOnCard = this.CCNameOnCard.Text;
		this.CCPaymentMethodModel.CCMonth = this.CCExpiresMonth.SelectedValue;
		this.CCPaymentMethodModel.CCYear = this.CCExpiresYear.SelectedValue;
		this.CCPaymentMethodModel.CCIssueNumber = this.CCIssueNumber.Text;

		// Don't save out the number again if it has been hidden
		if(!this.CCNumber.Text.StartsWith("****"))
		{
			this.CCPaymentMethodModel.CCNumber = this.CCNumber.Text;
		}
		this.CCPaymentMethodModel.CVV2 = this.CCSecurityCode.Text;
		if(!string.IsNullOrEmpty(HFCreditCardType.Value))
		{
			this.CCPaymentMethodModel.CreditCardType = (CreditCardType)
				Enum.Parse(typeof(CreditCardType), HFCreditCardType.Value, true);
		}
		this.CCPaymentMethodModel.Save();
	}
	#endregion

}
