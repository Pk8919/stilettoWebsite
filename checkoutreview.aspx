<%@ Page language="c#" Inherits="AspDotNetStorefront.checkoutreview" CodeFile="checkoutreview.aspx.cs" MasterPageFile="~/App_Templates/skin_1/template.master" %>
<%@ Register TagPrefix="aspdnsfc" Namespace="AspDotNetStorefrontControls" Assembly="AspDotNetStorefrontControls" %>
<%@ Register TagPrefix="aspdnsf" TagName="Topic" Src="~/Controls/TopicControl.ascx" %>
<%@ Register TagPrefix="aspdnsf" TagName="XmlPackage" Src="~/Controls/XmlPackageControl.ascx" %>
<%@ Register TagPrefix="aspdnsf" TagName="OrderOption" Src="~/controls/OrderOption.ascx" %>
<%@ Register TagPrefix="aspdnsf" TagName="BuySafeKicker" Src="~/controls/BuySafeKicker.ascx" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PageContent">
    <asp:Panel ID="pnlContent" runat="server" >
    <asp:Literal ID="JSPopupRoutines" runat="server"></asp:Literal>
    <div style="text-align:center;">
        <div style="text-align:center;">
            <asp:ImageMap ID="checkoutheadergraphic" HotSpotMode="PostBack" runat="server">
                <asp:RectangleHotSpot AlternateText="" HotSpotMode="Navigate" NavigateUrl="~/shoppingcart.aspx" Top="0" Left="0" Bottom="54" Right="87" />
                <asp:RectangleHotSpot AlternateText="" HotSpotMode="Navigate" NavigateUrl="~/account.aspx?checkout=true" Top="0" Left="87" Bottom="54" Right="173" />
                <asp:RectangleHotSpot AlternateText="" HotSpotMode="Inactive" NavigateUrl="~/checkoutshipping.aspx" Top="0" Left="173" Bottom="54" Right="259" />
                <asp:RectangleHotSpot AlternateText="" HotSpotMode="Navigate" NavigateUrl="~/checkoutpayment.aspx" Top="0" Left="259" Bottom="54" Right="345" />
            </asp:ImageMap>
        </div>

        <aspdnsf:Topic runat="server" ID="CheckoutReviewPageHeader" TopicName="CheckoutReviewPageHeader" />
        <asp:Literal ID="XmlPackage_CheckoutReviewPageHeader" runat="server" Mode="PassThrough"></asp:Literal>
        <br />
        <asp:Literal ID="checkoutreviewaspx6" Mode="PassThrough" runat="server" Text="<%$ Tokens:StringResource,checkoutreview.aspx.6 %>"></asp:Literal>
        <br/><br/>
        <center><asp:Button ID="btnContinueCheckout1" Text="<%$ Tokens:StringResource,checkoutreview.aspx.7 %>" CssClass="ReviewPageContinueCheckoutButton" runat="server" OnClick="btnContinueCheckout1_Click" /></center>
        <br /><br />

		<table>
			<tr>
				<td>
					<asp:Panel ID="pnlAmazonAddressWidget" runat="server" Visible="false">
						<%= new GatewayCheckoutByAmazon.CheckoutByAmazon().RenderAddressWidget("CBAAddressWidgetContainer", true, String.Empty, new Guid(ThisCustomer.CustomerGUID)) %>
					</asp:Panel>
				</td>
				<td>
					<asp:Panel ID="pnlAmazonWalletWidget" runat="server" Visible="false">
						<%= new GatewayCheckoutByAmazon.CheckoutByAmazon().RenderWalletWidget("CBAWalletWidgetContainer", true)%>
					</asp:Panel>
				</td>
			</tr>
		</table>
		
		<table width="100%">
        <tr>
            <td width="35%" align="left" valign="top">
                <asp:Label ID="checkoutreviewaspx8" Text="<%$ Tokens:StringResource,checkoutreview.aspx.8 %>" Font-Bold="true" runat="server"></asp:Label>
                <br />
                <asp:Literal ID="litBillingAddress" runat="server" Mode="PassThrough"></asp:Literal>
                <br /><br />
                <asp:Label ID="checkoutreviewaspx9" Text="<%$ Tokens:StringResource,checkoutreview.aspx.9 %>" Font-Bold="true" runat="server"></asp:Label>
                <br />
                <asp:Literal ID="litPaymentMethod" runat="server" Mode="PassThrough"></asp:Literal>
            </td>
            <td width="35%" align="left" valign="top">
                <asp:Label ID="ordercs57" Text="<%$ Tokens:StringResource,order.cs.57 %>" Font-Bold="true" runat="server"></asp:Label>
                <br />
                <asp:Literal ID="litShippingAddress" runat="server" Mode="PassThrough"></asp:Literal>
            </td>
            <td align="right" valign="top">
                <aspdnsf:BuySafeKicker ID="buySAFEKicker" WrapperClass="reviewKicker" runat="server" />
            </td>
        </tr>
        </table>
        <br />
            <div id="pnlOrderSummary" style="text-align: left">
                      
             <%--Shopping cart control--%>
            <aspdnsfc:ShoppingCartControl ID="ctrlShoppingCart"
                ProductHeaderText='<%$ Tokens:StringResource, shoppingcart.product %>'
                QuantityHeaderText='<%$ Tokens:StringResource, shoppingcart.quantity %>'
                SubTotalHeaderText='<%$ Tokens:StringResource, shoppingcart.subtotal %>'
                runat="server" AllowEdit="false"> 
                 <LineItemSettings 
                    LinkToProductPageInCart='<%$ Tokens:AppConfigBool, LinkToProductPageInCart %>' 
                    SKUCaption='<%$ Tokens:StringResource, showproduct.aspx.21 %>' 
                    GiftRegistryCaption='<%$ Tokens:StringResource, shoppingcart.cs.92 %>'
                    ItemNotesCaption='<%$ Tokens:StringResource, shoppingcart.cs.86 %>'
                    ItemNotesColumns='<%$ Tokens:AppConfigUSInt, ShoppingCartItemNotesTextareaCols %>'
                    ItemNotesRows='<%$ Tokens:AppConfigUSInt, ShoppingCartItemNotesTextareaRows %>'
                    AllowShoppingCartItemNotes="false"
                  />
            </aspdnsfc:ShoppingCartControl>
        
            <asp:Literal ID="CartSummary" Mode="PassThrough" runat="server"></asp:Literal>
            
            <aspdnsf:OrderOption id="ctrlOrderOption" runat="server" EditMode="false" />
        
            <%--Total Summary--%>
        <aspdnsfc:CartSummary ID="ctrlCartSummary" runat="server"             
            SubTotalCaption='<%$Tokens:StringResource, shoppingcart.cs.96 %>'
            SubTotalWithDiscountCaption='<%$Tokens:StringResource, shoppingcart.cs.97 %>'
            ShippingCaption='<%$Tokens:StringResource, shoppingcart.aspx.12 %>'
            ShippingVatExCaption='<%$Tokens:StringResource, setvatsetting.aspx.7 %>'
            ShippingVatInCaption='<%$Tokens:StringResource, setvatsetting.aspx.6 %>'
            TaxCaption='<%$Tokens:StringResource, shoppingcart.aspx.14 %>'
            TotalCaption='<%$Tokens:StringResource, shoppingcart.cs.61 %>'
            GiftCardTotalCaption='<%$Tokens:StringResource, order.cs.83 %>'            
            ShowGiftCardTotal="true"
            IncludeTaxInSubtotal="false"
            LineItemDiscountCaption ="<%$Tokens:StringResource, shoppingcart.cs.200 %>" OrderDiscountCaption="<%$Tokens:StringResource, shoppingcart.cs.201 %>"
            />
           </div>
           
            <br />
                      
        <center><asp:Button ID="btnContinueCheckout2" Text="<%$ Tokens:StringResource,checkoutreview.aspx.7 %>" CssClass="ReviewPageContinueCheckoutButton" runat="server" OnClick="btnContinueCheckout2_Click" /></center>
        <br /><br />

        <aspdnsf:Topic runat="server" ID="CheckoutReviewPageFooter" TopicName="CheckoutReviewPageFooter" />
        <asp:Literal ID="XmlPackage_CheckoutReviewPageFooter" runat="server" Mode="PassThrough"></asp:Literal>
        
    </div>
    </asp:Panel>
</asp:Content>
