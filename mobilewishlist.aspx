<%@ Page language="c#" Inherits="AspDotNetStorefront.mobilewishlist" CodeFile="mobilewishlist.aspx.cs" MasterPageFile="~/App_Templates/Skin_1/template.master" %>
<%@ Register TagPrefix="aspdnsfc" Namespace="AspDotNetStorefrontControls" Assembly="AspDotNetStorefrontControls" %>
<%@ Register TagPrefix="aspdnsf" TagName="XmlPackage" Src="~/Controls/XmlPackageControl.ascx" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PageContent">
    <asp:Literal ID="ltlTopicWishListPageHeader" runat="server" Text="<%$ Tokens:Topic, WishListPageHeader %>" />
    <asp:Literal ID="XmlPackage_WishListPageHeader" runat="server" Mode="PassThrough"></asp:Literal>
    <asp:Literal ID="XmlPackage_WishListPageTopControlLines" runat="server" Mode="PassThrough" Visible="false"></asp:Literal>
    <ul data-role="listview">
        <li class="group" data-role="list-divider">
           <asp:Label ID="lblWishlistMessage" runat="server" Text=""></asp:Label>
        </li>
    </ul>
    <asp:Panel ID="pnlTopControlLines" runat="server" Visible="false">
        <ul data-role="listview">
            <li>
                <asp:Button ID="btnContinueShopping1" CssClass="fullwidthshortgreen ContinueShoppingButton" runat="server" OnClick="btnContinueShopping1_Click" />
                <asp:Button ID="btnUpdateWishList1" CssClass="halfwidthrightwhite updatecart UpdateWishButton" runat="server" OnClick="btnUpdateWishList1_Click" />
            </li>
        </ul>
    </asp:Panel>
    <ul data-role="listview">
        <li>
            <asp:Panel ID="Panel1" runat="server" DefaultButton="btnUpdateWishList1">
                <aspdnsfc:ShoppingCartControl ID="ctrlShoppingCart" runat="server"
                    ProductHeaderText='<%$ Tokens:StringResource, shoppingcart.product %>'
                    QuantityHeaderText='<%$ Tokens:StringResource, shoppingcart.quantity %>'
                    HeaderTabImageURL='<%$ Tokens:SkinImage, spacer.gif %>' 
                    onitemdeleting="ctrlShoppingCart_ItemDeleting" DisplayMode="WishList" 
                    OnMoveToShoppingCartInvoked="ctrlShoppingCart_MoveToShoppingCartInvoked" 
                    EmptyCartTopicName="EmptyWishListText" >
                     <LineItemSettings 
                        LinkToProductPageInCart='<%$ Tokens:AppConfigBool, LinkToProductPageInCart %>' 
                        ImageLabelText='<%$ Tokens:StringResource, shoppingcart.cs.1000 %>'
                        SKUCaption='<%$ Tokens:StringResource, showproduct.aspx.21 %>'  
                        GiftRegistryCaption='<%$ Tokens:StringResource, shoppingcart.cs.92 %>'
                        ItemNotesCaption='<%$ Tokens:StringResource, shoppingcart.cs.86 %>'
                        ItemNotesColumns='<%$ Tokens:AppConfigUSInt, ShoppingCartItemNotesTextareaCols %>'
                        ItemNotesRows='<%$ Tokens:AppConfigUSInt, ShoppingCartItemNotesTextareaRows %>'
                        AllowShoppingCartItemNotes='<%$ Tokens:AppConfigBool, AllowShoppingCartItemNotes %>'
                        ShowPicsInCart='<%$ Tokens:AppConfigBool, ShowPicsInCart %>' 
                        ShowEditButtonInCartForKitProducts='<%$ Tokens:AppConfigBool, ShowEditButtonInCartForKitProducts %>' 
                        ShowMultiShipAddressUnderItemDescription="true"
                        MoveFromWishListText='<%$ Tokens:StringResourceFormat, Mobile.WishList.Move, AppConfig.CartPrompt %>'
                      />
                </aspdnsfc:ShoppingCartControl>
            </asp:Panel> 
        </li>
    </ul>
    <asp:Panel ID="pnlBottomControlLines" runat="server">
        <ul data-role="listview">
            <li>
                <asp:Button ID="btnContinueShopping2" runat="server" CssClass="fullwidthshortgreen ContinueShoppingButton" OnClick="btnContinueShopping2_Click" />
                <asp:Button ID="btnUpdateWishList2" runat="server" CssClass="halfwidthrightwhite updatecart UpdateWishButton" OnClick="btnUpdateWishList2_Click" />
            </li>
        </ul>
    </asp:Panel>

    <asp:Literal ID="Xml_WishListPageBottomControlLines" runat="server" Mode="PassThrough" Visible="false"></asp:Literal>
    <asp:Literal ID="ltlWishListPageFooter" runat="server" Text="<%$ Tokens:Topic, WishListPageFooter %>" />
    <asp:Literal ID="Xml_WishListPageFooter" runat="server" Mode="PassThrough"></asp:Literal> 
</asp:Content>
