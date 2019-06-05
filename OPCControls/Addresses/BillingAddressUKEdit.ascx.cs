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

public partial class VortxControls_BillingAddressUKEdit :
    System.Web.UI.UserControl,
    IAddressView
{
    #region Page Events


    protected void BillZip_OnTextChanged(object sender, EventArgs e)
    {
        //PopulateZipCityState();
        //this.UpdatePanelBillingAddressWrap.Update();
    }

    protected void BillZipCityState_OnDataBound(object sender, EventArgs e)
    {
    }

    protected void BillZipCityState_OnChanged(object sender, EventArgs e)
    {
        // Encountered a problem where billing address was not being saved, but overwritten by shipping address.
        SaveViewToModel();

        this.UpdatePanelBillingAddressWrap.Update();
    }

    protected void FindBillAddress_Click(object sender, EventArgs e)
    {
        // Remove all white space
        BillZip.Text = BillZip.Text.Replace(" ", "");

        if (BillZip.Text.Length == 5)
        {
            BillZip.Text = BillZip.Text.Insert(2, " ");
        }
        else if (BillZip.Text.Length == 6)
        {
            BillZip.Text = BillZip.Text.Insert(3, " ");
        }
        else if (BillZip.Text.Length == 7)
        {
            BillZip.Text = BillZip.Text.Insert(4, " ");
        }

        BillZip.Text = BillZip.Text.ToUpper();
        PopulateZipCityState();
        this.UpdatePanelBillingAddressWrap.Update();
    }

    #endregion

    #region Private Methods

    private void PopulateZipCityState()
    {
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

        //this.BillZip.Attributes.Add("onkeyup", "javascript:onZipKeyUp(event);");
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
                BillFirstName.Text = AddressModel.FirstName;
                BillLastName.Text = AddressModel.LastName;
                BillZip.Text = AddressModel.PostalCode;
                BillAddress1.Text = AddressModel.Address1;
                BillAddress2.Text = AddressModel.Address2;

                ToggleOtherCityState(true, false);

                this.UpdatePanelBillingAddressWrap.Update();
            };
        }
    }

    public void BindView(object id)
    {
    }

    public void SaveViewToModel()
    {
        Page.Validate("VGBillingAddress");

        // Validate the 'Other' Ship city/state/zip if selected
        if (Page.IsValid)
        {
            String city = String.Empty;
            String state = String.Empty;
            String country = String.Empty;

            this.AddressModel.FirstName = this.BillFirstName.Text;
            this.AddressModel.LastName = this.BillLastName.Text;
            this.AddressModel.Address1 = this.BillAddress1.Text;
            this.AddressModel.Address2 = this.BillAddress2.Text;
            this.AddressModel.City = this.BillCity.Text;
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
            BillZip.Text = string.Empty;
            BillAddress1.Text = string.Empty;
            BillAddress2.Text = string.Empty;

            ToggleOtherCityState(false, false);
        }

    }

    public void Disable()
    {
        BillFirstName.Enabled = false;
        BillLastName.Enabled = false;
        BillZip.Enabled = false;
        BillAddress1.Enabled = false;
        BillAddress2.Enabled = false;

        PageUtility.AddClass(this.BillAddressTable, "disabled");

        this.UpdatePanelBillingAddressWrap.Update();
    }

    public void Enable()
    {
        BillFirstName.Enabled = true;
        BillLastName.Enabled = true;
        BillZip.Enabled = true;
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
