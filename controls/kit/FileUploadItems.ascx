<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FileUploadItems.ascx.cs" Inherits="AspDotNetStorefront.Kit.FileUploadItems" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ Import Namespace="AspDotNetStorefrontCore" %>

 <asp:Repeater ID="rptItems" runat="server" DataSource='<%# KitGroup.SelectableItems %>'
    onitemdatabound="rptItems_ItemDataBound" >
         
    <ItemTemplate>
    
        <asp:HiddenField ID="hdfKitItemId" runat="server" Value='<%# Container.DataItemAs<KitItemData>().Id %>' />        
        
        <asp:Label ID="lblItemName" runat="server" 
            CssClass='<%# this.CssClassIf(Container.DataItemAs<KitItemData>().HasImage, "kit_groupItem_nameLabel") %>' 
            Text='<%# KitItemDisplayText(Container.DataItemAs<KitItemData>()) %>'></asp:Label>
            
        <asp:Literal ID="litStockHint" runat="server" Text='<%# StockHint(KitGroup.FirstSelectedItem) %>' ></asp:Literal>
           
        <asp:HyperLink ID="lnkUPload" runat="server"
            Text='<%$ Tokens:StringResource, kitproduct.aspx.19 %>'
            Visible='<%# Container.DataItemAs<KitItemData>().CanBeSelected %>'
            NavigateUrl='<%# GenerateFileUploadLink(Container.DataItemAs<KitItemData>().Group.Id, Container.DataItemAs<KitItemData>().Id) %>' >            
        </asp:HyperLink>
       
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
        
        <div style="padding-left:25px;">
            <asp:Image ID="imgFile" runat="server" 
                Visible='<%# Container.DataItemAs<KitItemData>().HasCustomerUploadedImage %>' 
                ImageUrl='<%# Container.DataItemAs<KitItemData>().CustomerUploadedImagePath %>'  />
        </div>
        <br />
        
    </ItemTemplate>
    
</asp:Repeater>

<div style="display:none">
    <asp:LinkButton ID="lnkRefresh" runat="server">Refresh</asp:LinkButton>
</div>


