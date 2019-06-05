<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MobileTextItems.ascx.cs" Inherits="AspDotNetStorefront.Kit.MobileTextItems"  %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ Import Namespace="AspDotNetStorefrontCore" %>
<%@ Register TagPrefix="aspdnsf" Namespace="AspDotNetStorefrontControls.Extenders" Assembly="AspDotNetStorefrontControls" %>

 <asp:Repeater ID="rptItems" runat="server" DataSource='<%# KitGroup.SelectableItems %>'
    onitemdatabound="rptItems_ItemDataBound" >
         
    <ItemTemplate>
    
        <asp:HiddenField ID="hdfKitItemId" runat="server" Value='<%# Container.DataItemAs<KitItemData>().Id %>' />        
        
        <asp:Label ID="lblItemName" runat="server" 
            CssClass='<%# this.CssClassIf(Container.DataItemAs<KitItemData>().HasImage, "kit_groupItem_nameLabel") %>' 
            Text='<%# KitItemDisplayText(Container.DataItemAs<KitItemData>()) %>'></asp:Label>
            
        <asp:Literal ID="litStockHint" runat="server" Text='<%# StockHint(KitGroup.FirstSelectedItem) %>' ></asp:Literal>
         
        <asp:Panel ID="pnlCollapsible" runat="server">
            <asp:Panel ID="pnlKitItemImage" runat="server" Visible='<%# Container.DataItemAs<KitItemData>().HasImage %>' >        
                <asp:Image ID="imgKitItem" runat="server" CssClass="kit_groupitem_image"            
                    ImageUrl='<%# Container.DataItemAs<KitItemData>().ImagePath %>' />            
            </asp:Panel>
            <asp:Panel ID="pnlKitItemDescription" runat="server" Visible='<%# Container.DataItemAs<KitItemData>().HasDescription %>'>
                <asp:Literal ID="ltKitItemDescription" runat="server" Text='<%# Container.DataItemAs<KitItemData>().Description %>' />
            </asp:Panel>
        </asp:Panel>
        
        <ajax:CollapsiblePanelExtender ID="extCollapseImage" runat="server" 
            TargetControlID="pnlCollapsible" 
            CollapseControlID="lblItemName" 
            ExpandControlID="lblItemName"
            Collapsed="true">
        </ajax:CollapsiblePanelExtender>
        
        <br />
        
        <div>
            <asp:TextBox ID="txtKitItemText" runat="server" 
                AutoPostBack="true"
                style="width:300px"
                TextMode='<%# DetermineTextMode() %>'
                Text='<%# Container.DataItemAs<KitItemData>().TextOption %>'
                Width="300px"
                Enabled='<%# Container.DataItemAs<KitItemData>().CanBeSelected %>' >
            </asp:TextBox>
                
            <aspdnsf:TextStateChangePostbackBehavior ID="extTextOption" runat="server" TargetControlID="txtKitItemText" Timeout="50000" />
        </div>
        <br />        
    </ItemTemplate>    
</asp:Repeater>



