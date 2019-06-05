// --------------------------------------------------------------------------------
// Copyright AspDotNetStorefront.com. All Rights Reserved.
// http://www.aspdotnetstorefront.com
// For details on this license please visit the product homepage at the URL above.
// THE ABOVE NOTICE MUST REMAIN INTACT. 
// --------------------------------------------------------------------------------
using System;
using System.Linq;
using AspDotNetStorefrontCore;
using Vortx.OnePageCheckout.Models;
using Vortx.OnePageCheckout.Views;

public partial class OPCControls_CartSummary : 
	System.Web.UI.UserControl,
	IShoppingCartView
{
	public IStringResourceProvider StringResourceProvider { get; set; }

	public IShoppingCartModel ShoppingCartModel
	{
		get;
		private set;
	}    
	public void SetModel(IShoppingCartModel model)
	{
		this.ShoppingCartModel = (IShoppingCartModel)model;
	}	
	
	public void BindView()
	{
        var currentCustomer = AspDotNetStorefrontCore.Customer.Current;
        var shoppingCart = new AspDotNetStorefrontCore.ShoppingCart(currentCustomer.SkinID, currentCustomer, AspDotNetStorefrontCore.CartTypeEnum.ShoppingCart, 0, false);

		decimal shipTotal = Math.Round(this.ShoppingCartModel.ShippingTotal, 2, MidpointRounding.AwayFromZero);
        decimal subTotal = Math.Round(this.ShoppingCartModel.SubTotal, 2, MidpointRounding.AwayFromZero);
        decimal discount = Math.Round(this.ShoppingCartModel.Discount1, 2, MidpointRounding.AwayFromZero);
        decimal total = Math.Round(this.ShoppingCartModel.Total, 2, MidpointRounding.AwayFromZero);

		this.ShipMethodAmount.Text = Localization.CurrencyStringForDisplayWithExchangeRate(shipTotal, currentCustomer.CurrencySetting);
		this.TaxAmount.Text = Localization.CurrencyStringForDisplayWithExchangeRate(this.ShoppingCartModel.TaxTotal, currentCustomer.CurrencySetting);
		this.SubTotal.Text = Localization.CurrencyStringForDisplayWithExchangeRate(subTotal, currentCustomer.CurrencySetting);
        this.ShippingMethod.Text = this.ShoppingCartModel.ShippingMethod;

		QuantityDiscountRow.Visible = (this.ShoppingCartModel.Discount2 > decimal.Zero);
        LabelQuantityDiscountAmount.Text = Localization.CurrencyStringForDisplayWithExchangeRate(this.ShoppingCartModel.Discount2 * -1, currentCustomer.CurrencySetting);
                
        Decimal lineItemDiscount = shoppingCart.DiscountResults.Sum(dr => dr.LineItemTotal);
        Decimal orderItemDiscount = shoppingCart.DiscountResults.Sum(dr => dr.OrderTotal);

        LineItemDiscountRow.Visible = lineItemDiscount < 0;
        OrderItemDiscountRow.Visible = orderItemDiscount < 0;

        LineItemDiscountLabel.Text = "shoppingcart.cs.200".StringResource();
        OrderItemDiscountLabel.Text = "shoppingcart.cs.201".StringResource();

        LineItemDiscount.Text = Localization.CurrencyStringForDisplayWithExchangeRate(lineItemDiscount, currentCustomer.CurrencySetting);
        OrderItemDiscount.Text = Localization.CurrencyStringForDisplayWithExchangeRate(orderItemDiscount, currentCustomer.CurrencySetting);

        this.Total.Text = Localization.CurrencyStringForDisplayWithExchangeRate(total, currentCustomer.CurrencySetting);

        trTaxAmounts.Visible = !AppLogic.AppConfigBool("VAT.Enabled") || AspDotNetStorefrontCore.Customer.Current.VATSettingReconciled != VATSettingEnum.ShowPricesInclusiveOfVAT;
	}
	
	public void BindView(object identifier)
	{
	}

	public void SaveViewToModel()
	{
	}

	public void Initialize()
	{
		this.ShipMethodAmount.Text = (0.0m).ToString("C");
		this.TaxAmount.Text = (0.0m).ToString("C");
		this.SubTotal.Text = (0.0m).ToString("C");
		this.Total.Text = (0.0m).ToString("C");
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
		this.UpdatePanelCartSummary.Visible = true;
		this.UpdatePanelCartSummary.Update();
	}

	public void Hide()
	{
		this.Visible = false;
		this.UpdatePanelCartSummary.Visible = false;
		this.UpdatePanelCartSummary.Update();
	}

    public void ShowError(string message)
    {
    }
}
