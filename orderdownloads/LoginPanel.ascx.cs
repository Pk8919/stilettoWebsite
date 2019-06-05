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
using Vortx.OnePageCheckout.WebUtility;
using Vortx.OnePageCheckout.Models.PaymentMethods;

public partial class LoginPanel : 
	System.Web.UI.UserControl,
	IAccountView
{
	protected void ButtonCreateNewPassword_Click(object sender, EventArgs e)
	{
		Page.Validate("VGCreateNewPassword");
		if (Page.IsValid)
		{
			this.AccountModel.ChangePassword(TextBoxNewPassword1.Text);
		}
	}

	protected void btnEmailSubmit_Click(object sender, EventArgs e)
	{
        Page.Validate("VGAccount");
        if(Page.IsValid)
        {
            this.AccountModel.Username = txtEmailAddress.Text;
			this.AccountModel.FindAccount();
        }
	}

	protected void btnPasswordSubmit_Click(object sender, EventArgs e)
	{
        Page.Validate("VGAccount");
        if(Page.IsValid)
        {
			this.AccountModel.Username = txtEmailAddress.Text;
			this.AccountModel.Password = txtPassword.Text;

			this.AccountModel.LogOn();
        }
	}

	protected void ButtonForgotPassword_Click(object sender, EventArgs e)
	{
		this.PanelError.Visible = false;
		this.AccountModel.SendLostPassword(txtEmailAddress.Text);
	}

	protected void linkSwitchUser_Click(object sender, EventArgs e)
	{
		this.AccountModel.LogOut();
        Response.Redirect("~/smartcheckout.aspx?checkout=true");
	}

	#region ILoginView Members
	public IStringResourceProvider StringResourceProvider { get; set; }
	public IAccountModel AccountModel { get; private set; }
	// HACK
	public IPaymentModel PaymentModel { get; private set; }
	// HACK - end

    public void SetModel(IAccountModel model)
	{
		this.AccountModel = (IAccountModel)model;

		// HACK
		this.PaymentModel = Vortx.OnePageCheckout.ObjectFactory.CreateModelFactory().CreatePaymentModel();
		// HACK - end

		this.AccountModel.LostPasswordSent += new LostPasswordSentHandler(AccountModel_LostPasswordSent);
		this.AccountModel.PasswordChanged += new PasswordChangedHandler(AccountModel_PasswordChanged);
	}

	protected void AccountModel_PasswordChanged(object sender, PasswordChangedEventArgs args)
	{
		if (args.Successful)
		{
			this.ShowAuthenticated();
			LabelCreateNewPasswordResults.Visible = false;
			PanelCreateNewPasswordResults.Visible = false;
		}
		else
		{
			PanelCreateNewPasswordResults.Visible = true;
			LabelCreateNewPasswordResults.Visible = true;
			LabelCreateNewPasswordResults.Text = args.Message;
		}

		this.UpdatePanelLogin.Update();		
	}

	protected void AccountModel_LostPasswordSent(object sender, LostPasswordSentEventArgs args)
	{
		this.LostPasswordResults.Visible = true;
		this.LabelForgotPasswordResults.Text = args.Message;
		this.LabelForgotPasswordResults.Visible = true;
		this.UpdatePanelLogin.Update();
	}

	public void Initialize()
	{
		PanelUsername.Visible = true;
		PanelPassword.Visible = false;
		PanelError.Visible = false;
        PanelNoAccount.Visible = false;

		txtEmailAddress.Visible = true;
		txtEmailAddress.Enabled = true;
		txtEmailAddress.Text = String.Empty;

		PanelCreateNewPassword.Visible = false;

		txtPassword.Visible = false;
		txtPassword.Enabled = false;
        PageUtility.AddClass(txtPassword, "disabled");
        PageUtility.RemoveClass(txtEmailAddress, "disabled");

		txtPassword.Text = String.Empty;

		btnEmailSubmit.Visible = true;
		btnEmailSubmit.Enabled = true;

		btnPasswordSubmit.Visible = false;
		btnPasswordSubmit.Enabled = false;

		ButtonForgotPassword.Visible = false;
		ButtonForgotPassword.Enabled = false;

		LostPasswordResults.Visible = false;
		LabelForgotPasswordResults.Visible = false;
		
		linkSwitchUser.Visible = false;
		linkSwitchUser.Enabled = false;

        EmailHelperText.Visible = true;

        if (!ConfigurationProvider.DefaultProvider.PasswordIsOptionalDuringCheckout)
        {
            lblNoAccount.Text = StringResourceProvider.GetString("smartcheckout.aspx.127");
        }

		PageUtility.RegisterFocusScript(this, txtEmailAddress);
	}


	public void Enable()
	{
	}

	public void Disable()
	{
	}

	public void Show()
	{
	}

	public void Hide()
	{
	}
	
	public void BindView()
	{
		if(this.AccountModel.IsRegistered)
		{
			if (this.AccountModel.PasswordChangeRequired)
			{
				this.ShowCreateNewPassword();
			}
			else
			{
				this.ShowAuthenticated();
			}
		}
		else if(this.AccountModel.AccountFound)
		{
			this.ShowAccountFound();
		}
		else if(this.AccountModel.HaveUsername)
		{
			this.ShowAccountNotFound();
		}
		else
		{
			this.Initialize();
		}
	}

	public void BindView(object identifier)
	{
		bool authenticated = (bool) identifier;
		if(authenticated)
		{
			if (this.AccountModel.PasswordChangeRequired)
			{
				this.ShowCreateNewPassword();
			}
			else
			{
				this.ShowAuthenticated();
			}
		}
		else
		{
			this.ShowNotAuthenticated();
		}
	}

	public void SaveViewToModel()
	{
	}


	public void ShowError(string message)
	{
		this.PanelError.Visible = true;
		this.lblError.Visible = true;
		this.lblError.Text = message;
		this.PanelNoAccount.Visible = false;
	}


	#endregion

	public void ShowCreateNewPassword()
	{
		PanelUsername.Visible = true;
		PanelPassword.Visible = true;
		PanelPassword.Enabled = false;

		PanelError.Visible = false;

		PanelCreateNewPassword.Visible = true;
		LabelCreateNewPasswordFirstName.Text = this.AccountModel.FirstName;

		PanelNoAccount.Visible = false;

		txtEmailAddress.Visible = true;
		txtEmailAddress.Enabled = false;
		PageUtility.AddClass(txtEmailAddress, "disabled");

		btnEmailSubmit.Visible = false;
		btnEmailSubmit.Enabled = false;

		btnPasswordSubmit.Visible = false;
		btnPasswordSubmit.Enabled = true;

		ButtonForgotPassword.Visible = true;
		ButtonForgotPassword.Enabled = true;

		LabelForgotPasswordResults.Visible = false;
		LostPasswordResults.Visible = false;

		if (PaymentModel.ActivePaymentMethod != null && 
			PaymentModel.ActivePaymentMethod.PaymentType == PaymentType.PayPalExpress &&
			((PaypalExpressPaymentModel)this.PaymentModel.ActivePaymentMethod).ExpressLoginComplete)
		{
			linkSwitchUser.Visible = false;
			this.PanelNoAccount.Visible = false;
		}
		else
		{
			linkSwitchUser.Visible = true;
			linkSwitchUser.Enabled = true;
		}

		txtPassword.Visible = true;
		txtPassword.Enabled = false;
		PageUtility.AddClass(txtPassword, "disabled");

		txtEmailAddress.Text = this.AccountModel.Username;
		txtPassword.Text = "********";
		txtPassword.TextMode = TextBoxMode.SingleLine;
		EmailHelperText.Visible = false;

		PageUtility.RegisterFocusScript(this, TextBoxNewPassword1);
	}

	public void ShowAccountFound()
	{
		PanelUsername.Visible = true;
		PanelPassword.Visible = true;
		PanelError.Visible = false;

		PanelNoAccount.Visible = false;

		PanelCreateNewPassword.Visible = false;

		txtEmailAddress.Visible = true;
		txtEmailAddress.Enabled = false;
        PageUtility.AddClass(txtEmailAddress, "disabled");

		btnEmailSubmit.Visible = false;
		btnEmailSubmit.Enabled = false;

		btnPasswordSubmit.Visible = true;
		btnPasswordSubmit.Enabled = true;

		ButtonForgotPassword.Visible = true;
		ButtonForgotPassword.Enabled = true;

		LabelForgotPasswordResults.Visible = false;
		LostPasswordResults.Visible = false;

		if (PaymentModel.ActivePaymentMethod != null && 
			PaymentModel.ActivePaymentMethod.PaymentType == PaymentType.PayPalExpress &&
			((PaypalExpressPaymentModel)this.PaymentModel.ActivePaymentMethod).ExpressLoginComplete)
		{
			linkSwitchUser.Visible = false;
			this.PanelNoAccount.Visible = false;
		}
		else
		{
			linkSwitchUser.Visible = true;
			linkSwitchUser.Enabled = true;
		}

		txtPassword.Visible = true;
		txtPassword.Enabled = true;
		txtPassword.TextMode = TextBoxMode.Password;
        PageUtility.RemoveClass(txtPassword, "disabled");

		txtEmailAddress.Text = this.AccountModel.Username;
        EmailHelperText.Visible = false;

		PageUtility.RegisterFocusScript(this, txtPassword);
	}

	#region Private Methods
	
	private void ShowAccountNotFound()
	{
		PanelUsername.Visible = true;
		PanelPassword.Visible = false;

        PanelError.Visible = false;
        PanelNoAccount.Visible = true;

		PanelCreateNewPassword.Visible = false;

		txtEmailAddress.Visible = true;
		txtEmailAddress.Enabled = false;
        PageUtility.AddClass(txtEmailAddress, "disabled");

		btnEmailSubmit.Visible = false;
		btnEmailSubmit.Enabled = false;

		btnPasswordSubmit.Visible = false;
		btnPasswordSubmit.Enabled = false;

		ButtonForgotPassword.Visible = false;
		ButtonForgotPassword.Enabled = false;

		LabelForgotPasswordResults.Visible = false;
		LostPasswordResults.Visible = false;

		if (PaymentModel.ActivePaymentMethod != null && 
			PaymentModel.ActivePaymentMethod.PaymentType == PaymentType.PayPalExpress &&
			 ((PaypalExpressPaymentModel)this.PaymentModel.ActivePaymentMethod).ExpressLoginComplete)
		{
			linkSwitchUser.Visible = false;
			this.PanelNoAccount.Visible = false;
		}
		else
		{
			PanelNoAccount.Visible = true;
			linkSwitchUser.Visible = true;
			linkSwitchUser.Enabled = true;
		}

		txtPassword.Visible = false;
		txtPassword.Enabled = false;
        PageUtility.AddClass(txtPassword, "disabled");

		txtEmailAddress.Text = this.AccountModel.Username;
        EmailHelperText.Visible = false;
	}

	private void ShowNotAuthenticated()
	{
		PanelUsername.Visible = true;
		PanelPassword.Visible = true;

		PanelError.Visible = true;
        PanelNoAccount.Visible = false;

		PanelCreateNewPassword.Visible = false;

		txtEmailAddress.Visible = true;
		txtEmailAddress.Enabled = false;
        PageUtility.AddClass(txtEmailAddress, "disabled");

		btnEmailSubmit.Visible = false;
		btnEmailSubmit.Enabled = false;

		btnPasswordSubmit.Visible = true;
		btnPasswordSubmit.Enabled = true;

		ButtonForgotPassword.Visible = true;
		ButtonForgotPassword.Enabled = true;

		LabelForgotPasswordResults.Visible = false;
		LostPasswordResults.Visible = false;

		if (PaymentModel.ActivePaymentMethod != null && 
			PaymentModel.ActivePaymentMethod.PaymentType == PaymentType.PayPalExpress  &&
			 ((PaypalExpressPaymentModel)this.PaymentModel.ActivePaymentMethod).ExpressLoginComplete)
		{
			linkSwitchUser.Visible = false;
		}
		else
		{
			linkSwitchUser.Visible = true;
			linkSwitchUser.Enabled = true;
		}

		txtPassword.Visible = true;
		txtPassword.Enabled = true;
		txtPassword.TextMode = TextBoxMode.Password;
        PageUtility.RemoveClass(txtPassword, "disabled");

		txtEmailAddress.Text = this.AccountModel.Username;
		lblError.Text = StringResourceProvider.GetString("smartcheckout.aspx.128");
        EmailHelperText.Visible = false;

		PageUtility.RegisterFocusScript(this, txtPassword);
	}

	private void ShowAuthenticated()
	{
		PanelUsername.Visible = true;
		PanelPassword.Visible = true;

		PanelError.Visible = false;
		PanelNoAccount.Visible = false;

		txtEmailAddress.Visible = true;
		txtEmailAddress.Enabled = false;
        PageUtility.AddClass(txtEmailAddress, "disabled");

		btnEmailSubmit.Visible = false;
		btnEmailSubmit.Enabled = false;

		PanelCreateNewPassword.Visible = false;

		btnPasswordSubmit.Visible = false;
		btnPasswordSubmit.Enabled = false;

		ButtonForgotPassword.Visible = false;
		ButtonForgotPassword.Enabled = false;

		LabelForgotPasswordResults.Visible = false;
		LostPasswordResults.Visible = false;

		linkSwitchUser.Visible = true;
        linkSwitchUser.Enabled = true;

		txtPassword.Visible = false;
		txtPassword.Enabled = false;
        lblPassword.Visible = false;
        PageUtility.AddClass(txtPassword, "disabled");

		txtEmailAddress.Text = this.AccountModel.Username;		
		txtPassword.Text = "********";
		txtPassword.TextMode = TextBoxMode.SingleLine;
        EmailHelperText.Visible = false;
	}

	#endregion
}
