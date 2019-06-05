<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MobileDropDownListItems.ascx.cs" Inherits="AspDotNetStorefront.Kit.MobileDropDownListItems" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ Import Namespace="AspDotNetStorefrontCore" %>

<asp:DropDownList ID="cboKitItems" runat="server" AutoPostBack="true">
</asp:DropDownList>
<asp:Literal ID="litStockHint" runat="server" Text='<%# StockHint(KitGroup.FirstSelectedItem) %>' ></asp:Literal>
   
<asp:Panel ID="pnlKitItemImage" runat="server" Visible='<%# KitGroup.FirstSelectedItem.HasImage %>' >        
    <asp:Image ID="imgKitItem" runat="server" CssClass="kit_groupitem_image"            
        ImageUrl='<%# KitGroup.FirstSelectedItem.ImagePath %>' /><br />          
</asp:Panel> 
<asp:Panel ID="pnlKitItemDescription" runat="server" Visible='<%# KitGroup.FirstSelectedItem.HasDescription %>'>
    <asp:Literal ID="ltKitItemDescription" runat="server" Text='<%# KitGroup.FirstSelectedItem.Description %>' />
</asp:Panel>



