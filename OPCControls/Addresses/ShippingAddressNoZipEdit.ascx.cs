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

public partial class VortxControls_ShippingAddressNoZipEdit :
	System.Web.UI.UserControl,
	IAddressView
{
	#region Page Events

	protected void ShipOtherCountry_OnDataBound(object sender, EventArgs e)
	{
		SetSelectedOtherCountry();
	}

	protected void ShipOtherCountry_OnChanged(object sender, EventArgs e)
	{
		this.AddressModel.Country = ShipOtherCountry.SelectedValue;
		this.PopulateOtherStates();
	}

	protected void ShipOtherState_OnDataBound(object sender, EventArgs e)
	{
		SetSelectedOtherState();
	}

	protected void ShipZip_OnTextChanged(object sender, EventArgs e)
	{
		PopulateZipCityState();
		this.UpdatePanelShippingAddressWrap.Update();
	}

	protected void SaveAddress_Click(object sender, EventArgs e)
	{
		this.SaveViewToModel();
	}

	protected void Address1POBoxNotAllowed_ServerValidate(object source, ServerValidateEventArgs args)
	{
        //first use standard logic to check, then use better regex parsing.
        if (args.Value.StartsWith("pobox", StringComparison.InvariantCultureIgnoreCase) ||
                                    args.Value.StartsWith("box", StringComparison.InvariantCultureIgnoreCase) ||
                                    args.Value.IndexOf("postoffice") != -1)
        {
            args.IsValid = false;
            return;
        }


		System.Text.RegularExpressions.Regex regEx = new System.Text.RegularExpressions
			.Regex(@"^[pP] [oO] [bB][oO][xX]|[pP] [oO]\. [bB][oO][xX]|[pP][oO] [bB][oO][xX]|[pP]\.[oO]\. [bB][oO][xX]|[pP]\. [oO]\. [bB][oO][xX]|[pP]\. [oO] [bB][oO][xX]|[pP]\.[oO] [bB][oO][xX]|[pP][oO]\. [bB][oO][xX]|[pP][oO][sS][tT][aA][lL]|[pP][oO]");
		args.IsValid = !regEx.IsMatch(args.Value);
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
        this.ShipOtherState.Items.Clear();
        this.ShipOtherState.DataSource = AddressModel.GetStates(Country);
        this.ShipOtherState.DataTextField = "Key";
        this.ShipOtherState.DataValueField = "Value";
        this.ShipOtherState.DataBind();
    }


	private void SetSelectedOtherState()
	{
        PageUtility.SetSelectedValue(ShipOtherState, AddressModel.State);
	}

	private void PopulateOtherCountries()
	{
		this.ShipOtherCountry.Items.Clear();
		this.ShipOtherCountry.DataSource = AddressModel.GetCountries();
		this.ShipOtherCountry.DataTextField = "Key";
		this.ShipOtherCountry.DataValueField = "Value";
		this.ShipOtherCountry.DataBind();
	}

	private void SetSelectedOtherCountry()
	{
        PageUtility.SetSelectedValue(ShipOtherCountry, AddressModel.Country);
	}

	private void ToggleOtherCityState(bool showOtherStatePanel, bool showZipCityStateDropDown)
	{
		this.ShipZip.Attributes.Remove("onkeyup");
		this.ShipZip.Style.Remove("display");
		if(showOtherStatePanel)
		{
			this.LabelShipZip.Visible = true;
			this.ShipZip.Visible = true;
		}
		else
		{
			this.LabelShipZip.Visible = true;
			this.ShipZip.Visible = true;
		}
		
	}

	#endregion

	#region IView Members

	public void BindView()
	{
		this.Address1POBoxNotAllowed.Enabled = this.Address2POBoxNotAllowed.Enabled = Vortx.OnePageCheckout.Settings.ConfigurationProvider.DefaultProvider.DisallowShippingToPOBoxes;

		if(!PageUtility.IsAsyncPostBackForControl(this, ConfigurationProvider.DefaultProvider.ScriptManagerId))
		{		
            if (!string.IsNullOrEmpty(this.AddressModel.Country))
            {
                PopulateOtherCountries();
                SetSelectedOtherCountry();
                PopulateOtherStates(ShipOtherCountry.SelectedValue);
                SetSelectedOtherState();

                ShipFirstName.Text = AddressModel.FirstName;
                ShipLastName.Text = AddressModel.LastName;
                Company.Text = AddressModel.Company;
                ShipZip.Text = AddressModel.PostalCode;
                ShipOtherCity.Text = AddressModel.City;
                ShipAddress1.Text = AddressModel.Address1;
                ShipAddress2.Text = AddressModel.Address2;
                ShipComments.Text = AddressModel.Notes;
                TextBoxPhone.Text = AddressModel.Phone ?? string.Empty;
                CheckBoxCommercial.Checked = !AddressModel.Residential;
               
                ToggleOtherCityState(true, false);

                this.UpdatePanelShippingAddressWrap.Update();
            }
		}
	}

	public void BindView(object id)
	{
	}


	public void SaveViewToModel()
	{
		Page.Validate("VGShippingAddress");

		Page.Validate("VGShippingOtherAddress");

		if(Page.IsValid)
		{
			String city = String.Empty;
			String state = String.Empty;
			String country = String.Empty;

			city = this.ShipOtherCity.Text;
			state = this.ShipOtherState.SelectedValue;
			country = this.ShipOtherCountry.SelectedValue;
			
			this.AddressModel.FirstName = this.ShipFirstName.Text;
			this.AddressModel.LastName = this.ShipLastName.Text;
			this.AddressModel.Address1 = this.ShipAddress1.Text;
			this.AddressModel.Address2 = this.ShipAddress2.Text;
            this.AddressModel.Company = this.Company.Text;
			this.AddressModel.City = city;
			this.AddressModel.State = state;
			this.AddressModel.PostalCode = this.ShipZip.Text;
			if (this.AddressModel.ShowAddressNotes)
			{
				this.AddressModel.Notes = this.ShipComments.Text;
			}
			this.AddressModel.Phone = this.TextBoxPhone.Text;

			if(!string.IsNullOrEmpty(country))
			{
				this.AddressModel.Country = country;
			}
			this.AddressModel.Residential = !CheckBoxCommercial.Checked;
			this.AddressModel.Save();
            this.Hide();
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
		this.Address1POBoxNotAllowed.Enabled = this.Address2POBoxNotAllowed.Enabled = Vortx.OnePageCheckout.Settings.ConfigurationProvider.DefaultProvider.DisallowShippingToPOBoxes;

		if (!PageUtility.IsAsyncPostBackForControl(this, ConfigurationProvider.DefaultProvider.ScriptManagerId))
		{
            if (this.ShipOtherCountry.SelectedValue == "")
            {
			    PopulateOtherCountries();
                PopulateOtherStates(this.ShipOtherCountry.SelectedValue);
            }

			ShipComments.Visible = this.AddressModel.ShowAddressNotes;
			this.PanelShipComments.Visible = this.AddressModel.ShowAddressNotes;
		}
	}
	
	public void Disable()
	{
		this.ShipFirstName.Enabled = false;		
		this.ShipLastName.Enabled = false;		
        this.TextBoxPhone.Enabled = false;
        this.Company.Enabled = false;
		this.ShipZip.Enabled = false;
		this.ShipOtherCity.Enabled = false;
        this.Company.Enabled = false;
		this.ShipAddress1.Enabled = false;
		this.ShipAddress2.Enabled = false;
		this.ShipComments.Enabled = false;
        this.ButtonSaveAddress.Enabled = false;
		this.ButtonSaveAddress.Visible = false;
        this.CheckBoxCommercial.Enabled = false;
		this.ShipOtherCountry.Enabled = false;
		this.ShipOtherState.Enabled = false;
		PageUtility.AddClass(ShipAddressTable, "disabled");
		
		this.UpdatePanelShippingAddressWrap.Update();
	}

	public void Enable()
	{
		ShipFirstName.Enabled = true;
		ShipLastName.Enabled = true;
        this.TextBoxPhone.Enabled = true;
        this.Company.Enabled = true;
		ShipZip.Enabled = true;
		ShipOtherCity.Enabled = true;
		ShipAddress1.Enabled = true;
		ShipAddress2.Enabled = true;
		ShipComments.Enabled = true;
        ButtonSaveAddress.Enabled = true;
		this.ButtonSaveAddress.Visible = true;
		this.CheckBoxCommercial.Enabled = true;
		this.ShipOtherCountry.Enabled = true;
		this.ShipOtherState.Enabled = true;
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
