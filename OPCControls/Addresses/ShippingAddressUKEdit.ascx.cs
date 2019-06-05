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
using Vortx.OnePageCheckout.WebService;
using System.Collections;

public partial class VortxControls_ShippingAddressUKEdit :
	System.Web.UI.UserControl,
	IAddressView
{
	#region Page Events

	protected void ShipZip_OnTextChanged(object sender, EventArgs e)
	{
		//PopulateZipCityState();
		//this.UpdatePanelShippingAddressWrap.Update();
	}

	protected void ShipZipCityState_OnDataBound(object sender, EventArgs e)
	{
	}

	protected void ShipZipCityState_OnChanged(object sender, EventArgs e)
	{
		//this.UpdatePanelShippingAddressWrap.Update();
	}

	protected void FindAddress_Click(object sender, EventArgs e)
	{
		// Postcode formatting
		ShipZip.Text = ShipZip.Text.Replace(" ", "");

		if (ShipZip.Text.Length == 5)
		{
			ShipZip.Text = ShipZip.Text.Insert(2, " ");
		}
		else if (ShipZip.Text.Length == 6)
		{
			ShipZip.Text = ShipZip.Text.Insert(3, " ");
		}
		else if (ShipZip.Text.Length == 7)
		{
			ShipZip.Text = ShipZip.Text.Insert(4, " ");
		}

		ShipZip.Text = ShipZip.Text.ToUpper();
		PopulateZipCityState();
		this.UpdatePanelShippingAddressWrap.Update();
	}

	protected void SaveAddress_Click(object sender, EventArgs e)
	{
		this.SaveViewToModel();
	}


	#endregion

	#region Private Methods

	private void PopulateZipCityState()
	{
	}

	//private void ToggleOtherCityState(bool showOtherStatePanel, bool showZipCityStateDropDown)
	//{
	//    this.ShipZip.Attributes.Remove("onkeyup");
	//    this.ShipZip.Style.Remove("display");
	//    if(showOtherStatePanel)
	//    {
	//        this.LabelShipZip.Visible = true;
	//        this.ShipZip.Visible = true;
	//    }
	//    else
	//    {
	//        this.LabelShipZip.Visible = true;
	//        this.ShipZip.Visible = true;
	//    }

	//    this.ShipZip.Attributes.Add("onkeyup", "javascript:onZipKeyUp(event);");
	//}

	#endregion

	#region IView Members

	public void BindView()
	{
		if (!PageUtility.IsAsyncPostBackForControl(this, ConfigurationProvider.DefaultProvider.ScriptManagerId))
		{
			if (!string.IsNullOrEmpty(this.AddressModel.Country))
			{
				ShipFirstName.Text = AddressModel.FirstName;
				ShipLastName.Text = AddressModel.LastName;
				ShipZip.Text = AddressModel.PostalCode;
				ShipAddress1.Text = AddressModel.Address1;
				ShipAddress2.Text = AddressModel.Address2;
				ShipComments.Text = AddressModel.Notes;
				TextBoxPhone.Text = AddressModel.Phone ?? string.Empty;

				//ToggleOtherCityState(true, false);

				this.UpdatePanelShippingAddressWrap.Update();
			};
		}
	}

	public void BindView(object id)
	{
	}


	public void SaveViewToModel()
	{
		Page.Validate("VGShippingAddress");

		if (Page.IsValid)
		{

			this.AddressModel.FirstName = this.ShipFirstName.Text;
			this.AddressModel.LastName = this.ShipLastName.Text;
			this.AddressModel.Address1 = this.ShipAddress1.Text;
			this.AddressModel.Address2 = this.ShipAddress2.Text;
			this.AddressModel.City = this.ShipCity.Text;
			this.AddressModel.State = this.ShipCounty.Text;
			this.AddressModel.PostalCode = this.ShipZip.Text;
			this.AddressModel.Notes = this.ShipComments.Text;
			this.AddressModel.Phone = this.TextBoxPhone.Text;
			this.AddressModel.Country = "United Kingdom";

			this.AddressModel.Save();
		}
	}

	public IStringResourceProvider StringResourceProvider { get; set; }
	public IAddressModel AddressModel { get; set; }
	public void SetModel(IAddressModel model)
	{
		this.AddressModel = (IAddressModel)model;
		if (!string.IsNullOrEmpty(this.AddressModel.Notes))
			ShipComments.Text = AddressModel.Notes;
	}

	public void Initialize()
	{

		if (!PageUtility.IsAsyncPostBackForControl(this, ConfigurationProvider.DefaultProvider.ScriptManagerId))
		{
			//ToggleOtherCityState(false, false);
		}

	}

	public void Disable()
	{
		this.ShipFirstName.Enabled = false;
		this.ShipLastName.Enabled = false;
		this.ShipZip.Enabled = false;
		this.ShipCity.Enabled = false;
		this.ShipCounty.Enabled = false;
		this.ShipAddress1.Enabled = false;
		this.ShipAddress2.Enabled = false;
		this.ShipComments.Enabled = false;
		this.TextBoxPhone.Enabled = false;
		this.ButtonSaveAddress.Enabled = false;
		this.ButtonSaveAddress.Visible = false;
		PageUtility.AddClass(ShipAddressTable, "disabled");

		this.UpdatePanelShippingAddressWrap.Update();
	}

	public void Enable()
	{
		ShipFirstName.Enabled = true;
		ShipLastName.Enabled = true;
		ShipZip.Enabled = true;
		ShipCity.Enabled = true;
		ShipCounty.Enabled = true;
		ShipAddress1.Enabled = true;
		ShipAddress2.Enabled = true;
		ShipComments.Enabled = true;
		TextBoxPhone.Enabled = true;
		ButtonSaveAddress.Enabled = true;
		ButtonSaveAddress.Visible = true;

		PageUtility.RemoveClass(ShipAddressTable, "disabled");

		PageUtility.RegisterFocusScript(this, ShipFirstName);

		this.UpdatePanelShippingAddressWrap.Update();
	}

	public void Show()
	{
		this.Visible = true;
		this.UpdatePanelShippingAddressWrap.Visible = true;
		this.UpdatePanelShippingAddressWrap.Update();
	}

	public void Hide()
	{
		this.Visible = false;
		this.UpdatePanelShippingAddressWrap.Visible = true;
		this.UpdatePanelShippingAddressWrap.Update();
	}

	public void ShowError(string message)
	{
		PanelError.Visible = true;
		LabelError.Text = message;
	}

	#endregion
}
