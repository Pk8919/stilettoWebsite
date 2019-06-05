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

public partial class OPCControls_Content_ContentPanel : 
	System.Web.UI.UserControl,
	IContentView
{
	#region IContentView Members

	public IStringResourceProvider StringResourceProvider { get; set; }
	public IContentModel ContentModel { get; private set; }

	public void SetModel(IContentModel model)
	{
		this.ContentModel = model;
	}

	#endregion

	#region IView Members

	public void Initialize()
	{
		this.ContentDisplay.Text = string.Empty;
	}

	public void Disable()
	{
		
	}

	public void Enable()
	{
		
	}

	public void Show()
	{
		this.PanelContent.Visible = true;
		this.Visible = true;
		this.ContentDisplay.Visible = true;
	}

	public void Hide()
	{
		this.PanelContent.Visible = false;
		this.Visible = false;
		this.ContentDisplay.Visible = false;
	}

	public void BindView()
	{
		this.ContentDisplay.Text = this.ContentModel.Html;
	}

	public void BindView(object identifier)
	{

	}

	public void SaveViewToModel()
	{
	}

	public void ShowError(string message)
	{
	}

	#endregion
}
