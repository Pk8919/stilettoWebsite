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
using Vortx.OnePageCheckout.Settings;
using Vortx.OnePageCheckout.Views;
using Vortx.OnePageCheckout.Models;
using Vortx.OnePageCheckout.WebUtility;
using AspDotNetStorefront.Promotions;
using AspDotNetStorefrontCore;

public partial class VortxControls_ShippingMethodSelector : 
	System.Web.UI.UserControl,
	 IShoppingCartView
{
	#region Page Events

	protected void ShippingMethods_SelectedIndexChanged(object sender, EventArgs e)
	{
		this.ShoppingCartModel.ShippingMethodId = ShippingMethods.SelectedValue.Trim();
        var customer = AspDotNetStorefrontCore.Customer.Current;
	}

	#endregion

	#region Private Methods

	private void PopulateShippingMethods()
	{
		IEnumerable<IShippingMethod> shippingMethods = this.ShoppingCartModel.ShippingMethods;	

		if (shippingMethods.Count() <= 0)
        {
            ShowError(StringResourceProvider.GetString("smartcheckout.aspx.131"));
			ShippingMethods.Items.Clear();
            this.Disable();
        }
        else
        {
			PanelError.Visible = false;			
			ShippingMethods.DataSource = shippingMethods;
            ShippingMethods.DataTextField = "DisplayName";
            ShippingMethods.DataValueField = "Identifier";
            ShippingMethods.DataBind();
        }
	}

	private void SetSelectedShippingMethod()
	{
        PageUtility.SetSelectedValue(this.ShippingMethods, this.ShoppingCartModel.ShippingMethodId);
	}

	#endregion	

	#region IView Members

	public IStringResourceProvider StringResourceProvider { get; set; }
	public IShoppingCartModel ShoppingCartModel { get; set; }
    public void SetModel(IShoppingCartModel model)
	{
		this.ShoppingCartModel = (IShoppingCartModel)model;
	}

	public void Initialize()
	{
		ShippingMethods.ClearSelection();
		ShippingMethods.Items.Clear();

        SetMultiShipVisibility();
	}

    private void SetMultiShipVisibility()
    {
        GatewayCheckoutByAmazon.CheckoutByAmazon checkoutByAmazon = new GatewayCheckoutByAmazon.CheckoutByAmazon();
        PanelMultiShip.Visible = ConfigurationProvider.DefaultProvider.AllowMultipleShippingAddressPerOrder &&
            (this.ShoppingCartModel.ShoppingCartItems.Count() > 1 || this.ShoppingCartModel.ShoppingCartItems.FirstOrDefault().Quantity > 1) && !(checkoutByAmazon.IsEnabled && checkoutByAmazon.IsCheckingOut);
    }

	public void Disable()
	{
		ShippingMethods.Enabled = false;
	}

	public void Enable()
	{
		ShippingMethods.Enabled = true;
	}

	public void Show()
	{
		this.Visible = true;
		this.UpdatePanelShipMethod.Visible = true;
		this.UpdatePanelShipMethod.Update();
	}

	public void Hide()
	{
		this.Visible = false;
		this.UpdatePanelShipMethod.Visible = false;
		this.UpdatePanelShipMethod.Update();
	}

	public void BindView()
	{
		PopulateShippingMethods();
		SetSelectedShippingMethod();
        SetMultiShipVisibility();
	}

	public void BindView(object id)
	{
		PopulateShippingMethods();
		SetSelectedShippingMethod();
        SetMultiShipVisibility();
    }

	public void SaveViewToModel()
	{

	}

	public void ShowError(string message)
	{
		PanelError.Visible = true;
		LabelError.Visible = true;
		LabelError.Text = message;
	}
	#endregion
}
