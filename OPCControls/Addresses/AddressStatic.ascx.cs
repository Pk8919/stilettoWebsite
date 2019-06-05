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

public partial class OPCControls_AddressStatic : 
	System.Web.UI.UserControl,
	IAddressView
{
	#region IAddressView Members
	public IStringResourceProvider StringResourceProvider { get; set; }
	public Vortx.OnePageCheckout.Models.IAddressModel AddressModel { get; set; }
	public void SetModel(IAddressModel model)
	{
		this.AddressModel = (Vortx.OnePageCheckout.Models.IAddressModel)model;
	}

	public void BindView()
	{
		this.FirstName.Text = this.AddressModel.FirstName;
		this.LastName.Text = this.AddressModel.LastName;
		this.Address1.Text = this.AddressModel.Address1;
		this.Address2.Text = this.AddressModel.Address2;
		this.Apartment.Text = this.AddressModel.Apartment;
		this.City.Text = this.AddressModel.City;
		this.State.Text = this.AddressModel.State;
		this.Zip.Text = this.AddressModel.PostalCode;
		this.Phone.Text = this.AddressModel.Phone;
		this.Country.Text = this.AddressModel.Country;

		if(String.IsNullOrEmpty(this.Address2.Text))
		{
			PanelAddressLine2.Visible = false;
		}
		if(String.IsNullOrEmpty(this.Apartment.Text))
		{
			PanelApartment.Visible = false;
		}
		if(String.IsNullOrEmpty(this.Phone.Text))
		{
			PanelPhone.Visible = false;
		}
	}
	
	public void BindView(object id)
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
	}

	public void Enable()
	{
	}

	public void Show()
	{
		this.Visible = true;
	}

	public void Hide()
	{
		this.Visible = false;	
	}

    public void ShowError(string message)
    {
    }

	#endregion
}
