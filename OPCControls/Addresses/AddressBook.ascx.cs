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
using Vortx.OnePageCheckout.Models;
using Vortx.OnePageCheckout.Views;
using Vortx.OnePageCheckout.WebUtility;
using Vortx.OnePageCheckout.Settings;

public partial class OPCControls_AddressBook : 
	System.Web.UI.UserControl,
	IAccountView
{
	#region Page Events

	protected void DataListAddressBook_OnItemCommand(object source, DataListCommandEventArgs e)
	{
		if(e.CommandName == "UseSelected")
		{
			string addressId = (string)e.CommandArgument;

			if(AddressType == AddressType.Billing)
			{
				this.AccountModel.PrimaryBillingAddressId = addressId;
			}
			if(AddressType == AddressType.Shipping)
			{
				this.AccountModel.PrimaryShippingAddressId = addressId;
			}
		}
	}

	protected void DataListAddressBook_OnItemDataBound(object source, DataListItemEventArgs args)
	{
		if((args.Item.ItemType == ListItemType.Item) ||
			(args.Item.ItemType == ListItemType.AlternatingItem))
		{
			IAddressModel model = (IAddressModel)args.Item.DataItem;
			IAddressView addressView = (IAddressView)args.Item.FindControl("AddressStaticItem");
			addressView.StringResourceProvider = this.StringResourceProvider;
			addressView.SetModel(model);
			addressView.Enable();
			addressView.Show();
			addressView.BindView();
		}
	}

	#endregion

	#region Private Methods

	private void BindPage(IEnumerable<IAddressModel> addressBook)
	{
		if(!PageUtility.IsAsyncPostBackForControl(this, ConfigurationProvider.DefaultProvider.ScriptManagerId))
		{
			this.DataListAddressBook.DataSource = addressBook;
			this.DataListAddressBook.DataBind();
		}
	}

	#endregion 

	#region IAccountView Members
	public IStringResourceProvider StringResourceProvider { get; set; }
	public IAccountModel AccountModel { get; private set; }
	public void SetModel(IAccountModel model)
	{
		this.AccountModel = model;
	}

	public AddressType AddressType { get; private set; }
	public void SetAddressType(AddressType addressType)
	{
		this.AddressType = addressType;	
	}

	public void BindView()
	{
		this.BindPage(this.AccountModel.AddressBook);
	}

	public void BindView(object id)
	{
		BindView();
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
	}

	public void Hide()
	{
	}

	public void ShowError(string message)
	{

	}
	#endregion
}

