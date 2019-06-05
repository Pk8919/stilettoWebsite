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

public partial class OPCControls_MoneybookersQuickCheckoutPaymentForm : System.Web.UI.UserControl, IPaymentMethodView
{
	public IStringResourceProvider StringResourceProvider { get; set; }
	public PaymentMethodBaseModel PaymentMethodModel { get; private set; }
	private bool HasBeenEnabled { get; set; }
	private bool HasBeenShown { get; set; }
	private string FrameSrc { get; set; }

	protected override void OnInit(EventArgs e)
	{
		Page.RegisterRequiresControlState(this);

		base.OnInit(e);
	}

	protected override object SaveControlState()
	{
		Stack<object> state = new Stack<object>();
		state.Push(base.SaveControlState());
		state.Push(FrameSrc);

		return state;
	}

	protected override void LoadControlState(object savedState)
	{
		Stack<object> state = savedState as Stack<object>;

		if(state == null)
			base.LoadControlState(savedState);

		FrameSrc = (string)state.Pop();
		base.LoadControlState(state.Pop());
	}

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
		HasBeenEnabled = false;
		Visible = HasBeenShown && HasBeenEnabled;
	}

    public void Enable()
    {
		HasBeenEnabled = true;
		Visible = HasBeenShown && HasBeenEnabled;
	}

    public void Show()
    {
		HasBeenShown = true;
		Visible = HasBeenShown && HasBeenEnabled;
	}	

    public void Hide()
    {
		HasBeenShown = false;
		Visible = HasBeenShown && HasBeenEnabled;
	}

	private void UpdateDisplay()
	{
		// Reset panel visibility to a known state
		ExternalPaymentMethodFrame.Visible = true;
		Instructions.Visible = true;
		PanelError.Visible = false;
		ErrorMessage.Text = String.Empty;

		try
		{
			if(FrameSrc == null && PaymentMethodModel != null)
				FrameSrc = ((MoneybookersQuickCheckoutPaymentModel)PaymentMethodModel).InitiateCheckout();
		}
		catch(MoneybookersQuickCheckoutException exception)
		{
			ExternalPaymentMethodFrame.Visible = false;
			Instructions.Visible = false;
			PanelError.Visible = true;
			ErrorMessage.Text = exception.Message;

			AspDotNetStorefrontCore.SysLog.LogMessage("Error initializing Skrill (Moneybookers) Quick Checkout", exception.Result, AspDotNetStorefrontCore.MessageTypeEnum.GeneralException, AspDotNetStorefrontCore.MessageSeverityEnum.Error);
		}
		catch(Exception exception)
		{
			ExternalPaymentMethodFrame.Visible = false;
			Instructions.Visible = false;
			PanelError.Visible = true;
			ErrorMessage.Text = exception.Message;

			AspDotNetStorefrontCore.SysLog.LogException(exception, AspDotNetStorefrontCore.MessageTypeEnum.GeneralException, AspDotNetStorefrontCore.MessageSeverityEnum.Error);
		}
	}

	protected override void OnPreRender(EventArgs e)
	{
		base.OnPreRender(e);

		UpdateDisplay();

		if(FrameSrc == null)
			return;

		if(!Visible)
			return;

		ExternalPaymentMethodFrame.Attributes.Add("src", FrameSrc);
	}

	public void ResetCheckout()
	{
		FrameSrc = null;
	}

    public void ShowError(string message)
    {
		PanelError.Visible = true;
		ErrorMessage.Text = message;
    }
}
