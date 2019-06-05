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

public partial class VortxControls_BillingAddressNoZipEdit :
	System.Web.UI.UserControl,
	IAddressView
{
	#region Page Events

	protected void BillOtherCountry_OnDataBound(object sender, EventArgs e)
	{
		SetSelectedOtherCountry();
	}

	protected void BillOtherCountry_OnChanged(object sender, EventArgs e)
	{
		this.AddressModel.Country = BillOtherCountry.SelectedValue;
		this.PopulateOtherStates();
	}

	protected void BillOtherState_OnDataBound(object sender, EventArgs e)
	{
		SetSelectedOtherState();
	}

	protected void BillZip_OnTextChanged(object sender, EventArgs e)
	{
		//PopulateZipCityState();
		//this.UpdatePanelBillingAddressWrap.Update();
	}

	protected void BillZipCityState_OnDataBound(object sender, EventArgs e)
	{
	}

	#endregion

	#region Private Methods

	private void PopulateZipCityState()
	{

	}

	private void PopulateOtherStates()
	{
		PopulateOtherStates(this.AddressModel.Country);
	}

	private void PopulateOtherStates(string Country)
	{
		this.BillOtherState.Items.Clear();
		this.BillOtherState.DataSource = AddressModel.GetStates(Country);
		this.BillOtherState.DataTextField = "Key";
		this.BillOtherState.DataValueField = "Value";
		this.BillOtherState.DataBind();
	}

	private void SetSelectedOtherState()
	{
		PageUtility.SetSelectedValue(BillOtherState, AddressModel.State);
	}

	private void PopulateOtherCountries()
	{
		this.BillOtherCountry.Items.Clear();
		this.BillOtherCountry.DataSource = AddressModel.GetCountries();
		this.BillOtherCountry.DataTextField = "Key";
		this.BillOtherCountry.DataValueField = "Value";
		this.BillOtherCountry.DataBind();
	}

	private void SetSelectedOtherCountry()
	{
		PageUtility.SetSelectedValue(BillOtherCountry, AddressModel.Country);
	}

	private void ToggleOtherCityState(bool showOtherStatePanel, bool showZipCityStateDropDown)
	{
		this.BillZip.Attributes.Remove("onkeyup");
		this.BillZip.Style.Remove("display");
		if (showOtherStatePanel)
		{
			this.LabelBillZip.Visible = true;
			this.BillZip.Visible = true;
		}
		else
		{
			this.LabelBillZip.Visible = true;
			this.BillZip.Visible = true;
		}
	}

	#endregion

	#region IView Members
	public IStringResourceProvider StringResourceProvider { get; set; }
	public IAddressModel AddressModel { get; set; }
	public void SetModel(IAddressModel model)
	{
		this.AddressModel = (IAddressModel)model;
	}

	public void BindView()
	{
		if (!PageUtility.IsAsyncPostBackForControl(this, ConfigurationProvider.DefaultProvider.ScriptManagerId))
		{
			if (!string.IsNullOrEmpty(this.AddressModel.Country))
			{
				PopulateOtherCountries();
				SetSelectedOtherCountry();
				PopulateOtherStates(BillOtherCountry.SelectedValue);
				SetSelectedOtherState();

				BillFirstName.Text = AddressModel.FirstName;
				BillLastName.Text = AddressModel.LastName;
				BillZip.Text = AddressModel.PostalCode;
				BillOtherCity.Text = AddressModel.City;
				BillAddress1.Text = AddressModel.Address1;
				BillAddress2.Text = AddressModel.Address2;
				BillCompany.Text = AddressModel.Company;

				ToggleOtherCityState(true, false);

				this.UpdatePanelBillingAddressWrap.Update();
			}
		}
	}

	public void BindView(object id)
	{
	}

	public void SaveViewToModel()
	{
		Page.Validate("VGBillingAddress");
		Page.Validate("VGBillingOtherAddress");

		if (Page.IsValid)
		{
			String city = String.Empty;
			String state = String.Empty;
			String country = String.Empty;

			city = this.BillOtherCity.Text;
			state = this.BillOtherState.SelectedValue;
			country = this.BillOtherCountry.SelectedValue;

			this.AddressModel.FirstName = this.BillFirstName.Text;
			this.AddressModel.LastName = this.BillLastName.Text;
			this.AddressModel.Company = this.BillCompany.Text;
			this.AddressModel.Address1 = this.BillAddress1.Text;
			this.AddressModel.Address2 = this.BillAddress2.Text;
			this.AddressModel.City = city;
			this.AddressModel.State = state;
			this.AddressModel.PostalCode = this.BillZip.Text;

			if (!string.IsNullOrEmpty(country))
			{
				this.AddressModel.Country = country;
			}

			this.AddressModel.Save();
		}
	}

	public void Initialize()
	{
		if (!PageUtility.IsAsyncPostBackForControl(this, ConfigurationProvider.DefaultProvider.ScriptManagerId))
		{
			BillFirstName.Text = string.Empty;
			BillLastName.Text = string.Empty;
			BillCompany.Text = string.Empty;
			BillZip.Text = string.Empty;
			BillOtherCity.Text = string.Empty;
			BillAddress1.Text = string.Empty;
			BillAddress2.Text = string.Empty;

			if (this.BillOtherCountry.SelectedValue == "")
			{
				PopulateOtherCountries();
				PopulateOtherStates(this.BillOtherCountry.SelectedValue);
			}

			ToggleOtherCityState(false, false);
		}
	}

	public void Disable()
	{
		BillFirstName.Enabled = false;
		BillLastName.Enabled = false;
		BillCompany.Enabled = false;
		BillZip.Enabled = false;
		BillOtherCity.Enabled = false;
		BillAddress1.Enabled = false;
		BillAddress2.Enabled = false;

		PageUtility.AddClass(this.BillAddressTable, "disabled");

		this.UpdatePanelBillingAddressWrap.Update();
	}

	public void Enable()
	{
		BillFirstName.Enabled = true;
		BillLastName.Enabled = true;
		BillCompany.Enabled = true;
		BillZip.Enabled = true;
		BillOtherCity.Enabled = true;
		BillAddress1.Enabled = true;
		BillAddress2.Enabled = true;

		PageUtility.RemoveClass(this.BillAddressTable, "disabled");

		this.UpdatePanelBillingAddressWrap.Update();
	}

	public void Show()
	{
		this.Visible = true;
		this.UpdatePanelBillingAddressWrap.Visible = true;
		this.UpdatePanelBillingAddressWrap.Update();
	}

	public void Hide()
	{
		this.Visible = false;
		this.UpdatePanelBillingAddressWrap.Visible = true;
		this.UpdatePanelBillingAddressWrap.Update();
	}

	public void ShowError(string message)
	{
		PanelError.Visible = true;
		LabelError.Text = message;
	}

	#endregion

}
