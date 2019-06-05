<%@ Page language="c#" Inherits="AspDotNetStorefront.checkoutshipping" CodeFile="checkoutshipping.aspx.cs" MasterPageFile="~/App_Templates/skin_1/template.master" %>

<%@ Register Assembly="AspDotNetStorefrontControls" Namespace="AspDotNetStorefrontControls" TagPrefix="aspdnsfc" %>
<%@ Register TagPrefix="aspdnsf" TagName="Topic" Src="~/Controls/TopicControl.ascx" %>
<%@ Register TagPrefix="aspdnsf" TagName="XmlPackage" Src="~/Controls/XmlPackageControl.ascx" %>
<%@ Register TagPrefix="aspdnsf" TagName="OrderOption" Src="~/controls/OrderOption.ascx" %>
<%@ Register TagPrefix="aspdnsf" TagName="BuySafeKicker" Src="~/controls/BuySafeKicker.ascx" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PageContent">
    <asp:Panel ID="pnlContent" runat="server" >
    <asp:Literal ID="CheckoutValidationScript" runat="server" Mode="PassThrough"></asp:Literal>
    <asp:Literal ID="JSPopupRoutines" runat="server"></asp:Literal>
    
        <div style="text-align:center;">
            <asp:ImageMap ID="checkoutheadergraphic" HotSpotMode="PostBack" runat="server">
                <asp:RectangleHotSpot HotSpotMode="Navigate" NavigateUrl="~/shoppingcart.aspx" Top="0" Left="0" Bottom="54" Right="87" />
                <asp:RectangleHotSpot HotSpotMode="Navigate" NavigateUrl="~/account.aspx?checkout=true" Top="0" Left="87" Bottom="54" Right="173" />
            </asp:ImageMap>
        </div>
        
        <asp:Panel ID="pnlErrorMsg" runat="server" Visible="false">
            <asp:Label ID="ErrorMsgLabel" CssClass="errorLg" runat="server"></asp:Label>
        </asp:Panel>

		<asp:Panel ID="pnlCBAAddressWidget" runat="server" Visible="false">
			<div style="float: left;">
				<asp:Literal ID="litCBAAddressWidget" runat="server" />
			</div>
			<div id="CBAAddressWidgetInstruction" style="float: left; padding: 10px; font-weight: bolder; width: 300px;">
				<asp:Literal ID="litCBAAddressWidgetInstruction" runat="server" />
			</div>
			<br style="clear: both;" />
		</asp:Panel>

         <br/>
            <asp:Panel runat="server" ID="pnlSelectShipping">
            <asp:Label ID="lblChooseShippingAddr" Text="<%$ Tokens:StringResource,checkoutshipping.aspx.20 %>" Font-Bold="true" runat="server"></asp:Label>
            <asp:DropDownList ID="ddlChooseShippingAddr" runat="server" OnSelectedIndexChanged="ddlChooseShippingAddr_SelectedIndexChanged"></asp:DropDownList>
            <br/>
            <asp:Panel runat="server" ID="pnlNewShipAddr" Visible="false">
                <asp:Table ID="tblShippingInfo" CellSpacing="0" CellPadding="2" Width="100%" runat="server">
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="left" VerticalAlign="top">
                            <asp:Image runat="server" ID="shippinginfo_gif" />
                            <asp:Table ID="tblShippingInfoBox" CellSpacing="0" CellPadding="2" Width="100%" runat="server">
                                <asp:TableRow>
                                    <asp:TableCell HorizontalAlign="left" VerticalAlign="top">
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td width="25%">
                                                                    <asp:Literal ID="Checkout1aspx55" runat="server" Text="<%$ Tokens:StringResource,createaccount.aspx.55 %>"></asp:Literal></td>
                                                                <td width="75%">
                                                                    <asp:TextBox ID="ShippingFirstName" Columns="20" MaxLength="50" runat="server" CausesValidation="true" ValidationGroup="shipping1" />
                                                                    <asp:RequiredFieldValidator ID="valReqShipFName" ErrorMessage="<%$ Tokens:StringResource,address.cs.13 %>" ControlToValidate="ShippingFirstName" EnableClientScript="false" runat="server" ValidationGroup="shipping1" Display="None"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="25%">
                                                                    <asp:Literal ID="Checkout1aspx57" runat="server" Text="<%$ Tokens:StringResource,createaccount.aspx.57 %>"></asp:Literal></td>
                                                                <td width="75%">
                                                                    <asp:TextBox ID="ShippingLastName" Columns="20" MaxLength="50" runat="server" CausesValidation="true" ValidationGroup="shipping1" />
                                                                    <asp:RequiredFieldValidator ID="valReqShipLName" ErrorMessage="<%$ Tokens:StringResource,address.cs.14 %>" ControlToValidate="ShippingLastName" EnableClientScript="false" runat="server" ValidationGroup="shipping1" Display="None"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="25%">
                                                                    <asp:Literal ID="Checkout1aspx59" runat="server" Text="<%$ Tokens:StringResource,createaccount.aspx.59 %>"></asp:Literal></td>
                                                                <td width="75%">
                                                                    <asp:TextBox ID="ShippingPhone" Columns="20" MaxLength="25" runat="server" CausesValidation="true" ValidationGroup="shipping1" />
                                                                    <asp:RequiredFieldValidator ID="valReqShipPhone" ErrorMessage="<%$ Tokens:StringResource,address.cs.15 %>" ControlToValidate="ShippingPhone" EnableClientScript="false" runat="server" ValidationGroup="shipping1" Display="None"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="25%">
                                                                    <asp:Literal ID="Checkout1aspx62" runat="server" Text="<%$ Tokens:StringResource,createaccount.aspx.62 %>"></asp:Literal></td>
                                                                <td width="75%">
                                                                    <asp:TextBox ID="ShippingCompany" Columns="25" MaxLength="100" runat="server" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td width="25%">
                                                                    <asp:Literal ID="addresscs58_2" runat="server" Text="<%$ Tokens:StringResource,address.cs.58 %>"></asp:Literal></td>
                                                                <td width="75%">
                                                                    <asp:DropDownList ID="ShippingResidenceType" runat="server"></asp:DropDownList></td>
                                                            </tr>
                                                            <tr>
                                                                <td width="25%">
                                                                    <asp:Literal ID="Checkout1aspx63" runat="server" Text="<%$ Tokens:StringResource,createaccount.aspx.63 %>"></asp:Literal></td>
                                                                <td width="75%">
                                                                    <asp:TextBox ID="ShippingAddress1" Columns="25" MaxLength="100" runat="server" CausesValidation="true" ValidationGroup="shipping1" />
                                                                    <asp:RequiredFieldValidator ID="valReqShipAddr1" ErrorMessage="<%$ Tokens:StringResource,address.cs.16 %>" ControlToValidate="ShippingAddress1" EnableClientScript="false" runat="server" ValidationGroup="shipping1" Display="None"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="25%">
                                                                    <asp:Literal ID="Checkout1aspx65" runat="server" Text="<%$ Tokens:StringResource,createaccount.aspx.65 %>"></asp:Literal></td>
                                                                <td width="75%">
                                                                    <asp:TextBox ID="ShippingAddress2" Columns="25" MaxLength="100" runat="server" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td width="25%">
                                                                    <asp:Literal ID="Checkout1aspx66" runat="server" Text="<%$ Tokens:StringResource,createaccount.aspx.66 %>"></asp:Literal></td>
                                                                <td width="75%">
                                                                    <asp:TextBox ID="ShippingSuite" Columns="25" MaxLength="50" runat="server" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td width="25%">
                                                                    <asp:Literal ID="Checkout1aspx67" runat="server" Text="<%$ Tokens:StringResource,createaccount.aspx.67 %>"></asp:Literal></td>
                                                                <td width="75%">
                                                                    <asp:TextBox ID="ShippingCity" Columns="25" MaxLength="50" runat="server" CausesValidation="true" ValidationGroup="shipping1" />
                                                                    <asp:RequiredFieldValidator ID="valReqShipCity" ErrorMessage="<%$ Tokens:StringResource,address.cs.17 %>" ControlToValidate="ShippingCity" EnableClientScript="false" runat="server" ValidationGroup="shipping1" Display="None"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="25%">
                                                                    <asp:Literal ID="Checkout1aspx73" runat="server" Text="<%$ Tokens:StringResource,createaccount.aspx.73 %>"></asp:Literal></td>
                                                                <td width="75%">
                                                                    <asp:DropDownList ID="ShippingCountry" Style="width: 175px;" runat="server" OnSelectedIndexChanged="ShippingCountry_Change" AutoPostBack="True"></asp:DropDownList>
                                                                    <asp:RequiredFieldValidator ID="valReqShipCountry" ErrorMessage="<%$ Tokens:StringResource,createaccount.aspx.11 %>" ControlToValidate="ShippingCountry" EnableClientScript="false" runat="server" ValidationGroup="shipping1" Display="None"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="25%">
                                                                    <asp:Literal ID="Checkout1aspx69" runat="server" Text="<%$ Tokens:StringResource,createaccount.aspx.69 %>"></asp:Literal></td>
                                                                <td width="75%">
                                                                    <asp:DropDownList ID="ShippingState" Style="width: 175px;" runat="server"> </asp:DropDownList>
                                                                    <asp:RequiredFieldValidator ID="valReqShipState" ErrorMessage="<%$ Tokens:StringResource,address.cs.1 %>" ControlToValidate="ShippingState" EnableClientScript="false" runat="server" ValidationGroup="shipping1" Display="None"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="25%">
                                                                    <asp:Literal ID="Checkout1aspx70" runat="server" Text="<%$ Tokens:StringResource,createaccount.aspx.70 %>"></asp:Literal></td>
                                                                <td width="75%">
                                                                    <asp:TextBox ID="ShippingZip" Columns="14" MaxLength="10" runat="server" CausesValidation="true" ValidationGroup="shipping1" />
                                                                    <asp:RequiredFieldValidator ID="valReqShipZip" ErrorMessage="<%$ Tokens:StringResource,address.cs.18 %>" ControlToValidate="ShippingZip" EnableClientScript="false" runat="server" ValidationGroup="shipping1" Display="None"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                        </table>

                                        <br />
                                        <center><asp:Button ID="btnNewShipAddr" runat="server" Text="<%$ Tokens:StringResource,checkoutshipping.aspx.21 %>" CssClass="ShippingPageContinueCheckoutButton" Visible="true" ValidationGroup="shipping1" OnClick="btnNewShipAddr_OnClick" /></center>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                 
            </asp:Panel>
            <br />
            </asp:Panel>        
            
            <aspdnsf:Topic runat="server" ID="HeaderMsg" TopicName="CheckoutShippingPageHeader" />
            <asp:Literal ID="XmlPackage_CheckoutShippingPageHeader" runat="server" Mode="PassThrough"></asp:Literal>

            <asp:Panel ID="pnlGetFreeShippingMsg" CssClass="FreeShippingThresholdPrompt" Visible="false" runat="server">
                <asp:Literal ID="GetFreeShippingMsg" runat="server" Mode="PassThrough"></asp:Literal>
            </asp:Panel>
            
            <asp:Panel ID="pnlFreeShippingMsg" CssClass="FreeShippingThresholdPrompt" runat="server">
                <asp:Label ID="FreeShippingMsg" Visible="false" runat="server"></asp:Label>
            </asp:Panel>
            
            <asp:Panel ID="pnlCartAllowsShippingMethodSelection" runat="server">
                <asp:Label ID="ShipSelectionMsg" runat="server"></asp:Label>
                <asp:Label ID="lblMultiShipPrompt" runat="server" Visible="false" />
                <table style="width:100%;">
                    <tr>
                        <td>
                            <aspdnsfc:ShippingMethodControl ID="ctrlShippingMethods" runat="server"/>
                        </td>
                        <td style="width:250px;">
                            <aspdnsf:BuySafeKicker ID="buySAFEKicker" WrapperClass="shippingKicker" runat="server" />
                        </td>
                    </tr>
                </table>
            <br />
            </asp:Panel>

            
        <center><asp:Button ID="btnContinueCheckout" runat="server" 
                Text="<%$ Tokens:StringResource,checkoutshipping.aspx.13 %>" 
                CssClass="ShippingPageContinueCheckoutButton" Visible="false"
                onclick="btnContinueCheckout_Click" /></center>
        
    
    <div>
                
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
        
        <asp:Literal ID="CartSummary" runat="server"></asp:Literal>

        <br />
        <aspdnsf:OrderOption id="ctrlOrderOption" runat="server" EditMode="false" />
        
        <%--Total Summary--%>
        <aspdnsf:CartSummary ID="ctrlCartSummary" runat="server" ShowShipping="False" ShowTax="false"
            ShowTotal="false"             
            SubTotalCaption='<%$Tokens:StringResource, shoppingcart.cs.96 %>'
            SubTotalWithDiscountCaption='<%$Tokens:StringResource, shoppingcart.cs.97 %>'    
            IncludeTaxInSubtotal="false" 
            LineItemDiscountCaption ="<%$Tokens:StringResource, shoppingcart.cs.200 %>" OrderDiscountCaption="<%$Tokens:StringResource, shoppingcart.cs.201 %>"       
            />                       
        
        <aspdnsf:Topic runat="server" ID="CheckoutShippingPageFooter" TopicName="CheckoutShippingPageFooter" />
        <asp:Literal ID="XmlPackage_CheckoutShippingPageFooter" runat="server" Mode="PassThrough"></asp:Literal>

    </div>
    <asp:Panel runat="server">
    <div>
        <asp:Literal ID="DebugInfo" runat="server" Mode="PassThrough"/>
    </div>
    </asp:Panel>


</asp:Panel>
</asp:Content>
