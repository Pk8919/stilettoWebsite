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
using Vortx.OnePageCheckout.Settings;

public partial class VortxControls_CreateAccount : System.Web.UI.UserControl,
     IAccountView   
{
	public event EventHandler AccountCreationActivated;

	private string _AccountCreatedDisplayStringResource = null;

	public bool ManualAccountCreationEnabled
	{
		get { return CreateAccountPanel.Visible; }
		set { CreateAccountPanel.Visible = value; }
	}

	public string AccountCreatedDisplayStringResource
	{
		get { return _AccountCreatedDisplayStringResource ?? "smartcheckout.aspx.126"; }
		set { _AccountCreatedDisplayStringResource = value; }
	}

	protected void CreateAccountPasswordConfirm_OnTextChanged(object sender, EventArgs e)
	{
		string eventTarget = Request.Params["__EVENTTARGET"];
		// when we programmatically set the password value it causes this event to fire
		// even when a different control triggers the postback.
		// SO, make sure the text box triggers the postback
		if (eventTarget.Contains("CreateAccountPasswordConfirm"))
		{
			Page.Validate("VGCreateAccount");
            if (Page.IsValid)
            {
                this.AccountModel.Password = CreateAccountPasswordConfirm.Text;
                this.AccountModel.Save();
                this.Disable();
            }
		}
	}

    protected void RadioCreateAccount_CheckedChanged(object sender, EventArgs e)
    {
        this.PanelCreateAccount.Visible = RadioCreateAccountYes.Checked;
        this.RadioCreateAccountYes.Enabled = true;

        if (ConfigurationProvider.DefaultProvider.PasswordIsOptionalDuringCheckout)
            this.RadioCreateAccountNo.Enabled = true;
        else
        {
            this.RadioCreateAccountYes.Enabled = false;
            this.RadioCreateAccountNo.Enabled = false;
            this.RadioCreateAccountNo.Visible = false;
            this.RadioCreateAccountYes.Visible = false;
            LabelOptional.Visible = false;
        }

        this.CreateAccountPassword.Enabled = true;
        this.CreateAccountPasswordConfirm.Enabled = true;
        
		this.AccountModel.RegisterAccount = RadioCreateAccountYes.Checked;
		this.AccountModel.Save();
    }

    protected void CreateAccountButton_Click(object sender, EventArgs e)
    {
		FireAccountCreationActivated();
    }

	protected void CustomValidatorCreateAccount_ServerValidate(object source, ServerValidateEventArgs args)
	{
		args.IsValid = RadioCreateAccountYes.Checked || RadioCreateAccountNo.Checked;		
	}

	public IStringResourceProvider StringResourceProvider { get; set; }
	public IAccountModel AccountModel
    {
        get;
        set;
    }

    public void SetModel(IAccountModel model)
    {
		this.AccountModel = model;
		this.AccountModel.RegisterCompleted += new RegisterCompletedHandler(Model_RegisterCompleted);
    }

	public void BindView()
	{
		if (this.AccountModel.RegisterAccountSelected)
		{
			this.PanelCreateAccount.Visible = this.AccountModel.RegisterAccount;
			this.CreateAccountPassword.Enabled = this.AccountModel.RegisterAccount;
			this.CreateAccountPasswordConfirm.Enabled = this.AccountModel.RegisterAccount;

			this.RadioCreateAccountYes.Checked = this.AccountModel.RegisterAccount;
			this.RadioCreateAccountNo.Checked = !this.AccountModel.RegisterAccount;
            
			if (!string.IsNullOrEmpty(this.AccountModel.Password))
			{
				this.CreateAccountPassword.Attributes.Add("value", this.AccountModel.Password);
				this.CreateAccountPasswordConfirm.Attributes.Add("value", this.AccountModel.Password);
			}
		}
        this.CreateAccountPassword.Attributes.Add("onkeyup", "javascript:document.getElementById('" + this.CreateAccountPasswordConfirm.ClientID + "').value='';document.getElementById('" + VSCreateAccount.ClientID + "').style.display = 'none';");
		this.CreateAccountPasswordConfirm.Attributes.Add("onkeyup", "javascript:onCreateAccountPasswordKeyUp(event, '" + this.CreateAccountPassword.ClientID + "', '" + this.CreateAccountPasswordConfirm.ClientID + "');");
	}

	public void BindView(object identifier)
	{
	}

	public void SaveViewToModel()
	{
		Page.Validate("VGCreateAccount");
        if (Page.IsValid)
        {
            if (!this.AccountModel.IsRegistered)
            {
                if (!ConfigurationProvider.DefaultProvider.ShowEmailPreferencesOnCheckout)
                {
                    this.AccountModel.AllowEmail = false;
                }
                this.AccountModel.FirstName = this.AccountModel.BillingAddress.FirstName;
                this.AccountModel.LastName = this.AccountModel.BillingAddress.LastName;
                this.AccountModel.Phone = this.AccountModel.ShippingAddress.Phone;

                if (this.RadioCreateAccountYes.Checked)
                {
                    this.AccountModel.Password = this.CreateAccountPassword.Text;
                    this.AccountModel.Register();
                }
                else
                {
                    this.AccountModel.Save();
                }
            }
        }
        else
        {
            this.Show();
            UpdatePanelCreateAccount.Update();
        }
	}

    public void ShowError(string message)
    {
        PanelError.Visible = true;
        LabelError.Text = message;
    }

    public void Initialize()
    {
        this.RadioCreateAccountYes.Enabled = true;
        this.RadioCreateAccountNo.Enabled = false;
        this.RadioCreateAccountYes.Checked = false;
        this.RadioCreateAccountNo.Checked = false;
        this.PanelCreateAccount.Visible = false;

        if (!ConfigurationProvider.DefaultProvider.PasswordIsOptionalDuringCheckout)
        {
            this.RadioCreateAccountNo.Visible = false;
            this.RadioCreateAccountYes.Visible = false;
            this.RadioCreateAccountYes.Checked = true;
            LabelOptional.Visible = false;
            this.AccountModel.RegisterAccount = true;
        }

	}

    public void Disable()
    {
        this.PanelCreateAccount.Visible = false;
        this.RadioCreateAccountYes.Enabled = false;
		this.RadioCreateAccountNo.Enabled = false;
        this.CreateAccountPassword.Enabled = false;
        this.CreateAccountPasswordConfirm.Enabled = false;
    }

    public void Enable()
    {
        this.RadioCreateAccountYes.Enabled = true;

        if (ConfigurationProvider.DefaultProvider.PasswordIsOptionalDuringCheckout)
            this.RadioCreateAccountNo.Enabled = true;
        else
        {
            //this.RadioCreateAccountYes.Checked = true;
            this.RadioCreateAccountYes.Enabled = false;
            this.RadioCreateAccountNo.Enabled = false;
            this.RadioCreateAccountNo.Visible = false;
            this.RadioCreateAccountYes.Visible = false;
            LabelOptional.Visible = false;
            this.CreateAccountPassword.Enabled = true;
            this.CreateAccountPasswordConfirm.Enabled = true;
		
            this.PanelCreateAccount.Visible = true;
            //this.AccountModel.RegisterAccount = true;
        }
	}

    public void Show()
    {
        this.Visible = true;
        this.UpdatePanelCreateAccount.Visible = true;

        this.UpdatePanelCreateAccount.Update();
    }

    public void Hide()
    {
        this.Visible = false;
        this.UpdatePanelCreateAccount.Visible = false;
        this.UpdatePanelCreateAccount.Update();
    }

	private void Model_RegisterCompleted(object sender, EventArgs args)
	{
		this.PanelCreateAccount.Visible = true;
        this.RadioCreateAccountYes.Enabled = false;
		this.CreateAccountPassword.Enabled = false;
		this.CreateAccountPasswordConfirm.Enabled = false;
		CreateAccountButton.Enabled = false;

		this.CreateAccountPassword.Text = "********";
		this.CreateAccountPassword.TextMode = TextBoxMode.SingleLine;
		this.CreateAccountPasswordConfirm.Text = "********";
		this.CreateAccountPasswordConfirm.TextMode = TextBoxMode.SingleLine;


        ShowError(StringResourceProvider.GetString("smartcheckout.aspx.126"));
	}

	private void FireAccountCreationActivated()
	{
		if(AccountCreationActivated != null)
			AccountCreationActivated(this, EventArgs.Empty);
	}
}
