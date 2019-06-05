<%@ Page Language="c#" Inherits="AspDotNetStorefront.ShoppingCartPage" CodeFile="ShoppingCart.aspx.cs" MasterPageFile="~/App_Templates/Skin_1/template.master" %>

<%@ Register TagPrefix="aspdnsfc" Namespace="AspDotNetStorefrontControls" Assembly="AspDotNetStorefrontControls" %>
<%@ Register TagPrefix="aspdnsf" TagName="Topic" Src="~/Controls/TopicControl.ascx" %>
<%@ Register TagPrefix="aspdnsf" TagName="XmlPackage" Src="~/Controls/XmlPackageControl.ascx" %>
<%@ Register TagPrefix="aspdnsf" TagName="OrderOption" Src="~/controls/OrderOption.ascx" %>
<%@ Register TagPrefix="aspdnsf" TagName="BuySafeKicker" Src="~/controls/BuySafeKicker.ascx" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PageContent">
    <asp:Panel ID="pnlContent" runat="server">
        <asp:Literal ID="ValidationScript" runat="server"></asp:Literal>
        <asp:Literal ID="JSPopupRoutines" runat="server"></asp:Literal>
        <div class="shoppingCartContainer">
            <aspdnsf:Topic runat="server" ID="HeaderMsg" TopicName="CartPageHeader" />
            <asp:Literal ID="XmlPackage_ShoppingCartPageHeader" runat="server"></asp:Literal>
            <table cellspacing="3" cellpadding="0" width="100%" border="0">
                <tr>
                    <td>
                        <aspdnsf:BuySafeKicker ID="buySAFEKicker" WrapperClass="shoppingCartKicker" runat="server" />
                        <asp:Panel ID="ShippingInformation" runat="server">
                            <asp:Image ID="redarrow1" AlternateText="" runat="server" />&#0160;<a onclick="popuptopicwh('Shipping+Information','shipping',650,550,'yes')"
                                href="javascript:void(0);"><asp:Literal ID="shoppingcartaspx8" runat="server"></asp:Literal></a><br />
                        </asp:Panel>
                        <asp:Image ID="redarrow2" AlternateText="" runat="server" />&#0160;<a onclick="popuptopicwh('Return+Policy+Information','returns',650,550,'yes')"
                            href="javascript:void(0);"><asp:Literal ID="shoppingcartaspx9" Text="<%$ Tokens:StringResource,shoppingcart.aspx.9 %>"
                                runat="server"></asp:Literal></a><br />
                        <asp:Image ID="redarrow3" AlternateText="" runat="server" />&#0160;<a onclick="popuptopicwh('Privacy+Information','privacy',650,550,'yes')"
                            href="javascript:void(0);"><asp:Literal ID="shoppingcartaspx10" Text="<%$ Tokens:StringResource,shoppingcart.aspx.10 %>"
                                runat="server"></asp:Literal></a><br />
                        <asp:Panel ID="AddresBookLlink" runat="server">
                            <asp:Image ID="redarrow4" AlternateText="" runat="server" />&#0160;<a href="address.aspx?returnurl=shoppingcart.aspx&AddressType=Shipping"><asp:Literal
                                ID="shoppingcartaspx11" Text="<%$ Tokens:StringResource,shoppingcart.aspx.11 %>"
                                runat="server"></asp:Literal></a><br />
                        </asp:Panel>
                        &#160;<br />
                    </td>
                    <td valign="top" align="right" style="width: 270px;">
                        <asp:Button ID="btnContinueShoppingTop" Text="<%$ Tokens:StringResource,shoppingcart.cs.62 %>"
                            CssClass="ContinueShoppingButton" runat="server" />&#160;
                        <asp:Button ID="btnCheckOutNowTop" Text="<%$ Tokens:StringResource,shoppingcart.cs.111 %>"
                            runat="server" CssClass="CheckoutNowButton" />&#160;
                        <asp:Button ID="btnQuickCheckoutTop" Text="<%$ Tokens:StringResource,shoppingcart.cs.111a %>"
                            Visible="false" runat="server" CssClass="CheckoutNowButton" />
                        <asp:Button ID="btnInternationalCheckOutNowTop" Visible="false" Text="<%$ Tokens:StringResource,shoppingcart.cs.111b %>"
                            runat="server" CssClass="CheckoutNowButton" />&#160;
                        <br />
                    </td>
                </tr>
                <tr runat="server" id="AlternativeCheckouts">
                    <td colspan="2" align="right" style="height: 61px">
                        <table border="0" width="100%">
                            <tr>
                                <td align="right" style="height: 61px;">
                                    <div runat="server" id="AmazonCheckoutSpan" style="float: right;">
                                        <asp:Literal ID="litAmazonCheckoutButton" runat="server" />
                                    </div>
                                    <div runat="server" id="PayPalExpressSpan" style="float: right;">
                                        <asp:ImageButton ImageAlign="Top" ID="btnPayPalExpressCheckout" Style="margin-right: 7px;"
                                            runat="server" OnClick="btnPayPalExpressCheckout_Click" />
                                    </div>
                                    <div runat="server" id="GoogleCheckoutSpan" style="float: right;">
                                        <asp:ImageButton ImageAlign="Top" runat="server" ID="btnGoogleCheckout" OnClick="btnGoogleCheckout_Click"
                                            ImageUrl="https://checkout.google.com/buttons/checkout.gif?w=180&h=46&style=white&variant=text"
                                            Style="margin-right: 7px;" />
                                        <asp:Image ImageAlign="Top" runat="server" ID="imgGoogleCheckoutDisabled" ImageUrl="https://checkout.google.com/buttons/checkout.gif?w=180&h=46&style=white&variant=disabled"
                                            Visible="false" Style="margin-right: 7px;" />
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="pnlCouponError" runat="Server" Visible="false">
                <p>
                    <asp:Label ID="CouponError" CssClass="errorLg" runat="Server"></asp:Label></p>
            </asp:Panel>
            <asp:Panel ID="pnlErrorMsg" runat="Server" Visible="false">
                <p>
                    <asp:Label ID="ErrorMsgLabel" CssClass="errorLg" runat="Server"></asp:Label></p>
            </asp:Panel>
            <asp:Panel ID="pnlInventoryTrimmedError" runat="Server" Visible="false">
                <p>
                    <asp:Label ID="InventoryTrimmedError" CssClass="errorLg" runat="Server"></asp:Label></p>
            </asp:Panel>
            <asp:Panel ID="pnlRecurringScheduleConflictError" runat="Server" Visible="false">
                <p>
                    <asp:Label ID="RecurringScheduleConflictError" CssClass="errorLg" runat="Server"></asp:Label></p>
            </asp:Panel>
            <asp:Panel ID="pnlMinimumQuantitiesUpdatedError" runat="Server" Visible="false">
                <p>
                    <asp:Label ID="MinimumQuantitiesUpdatedError" CssClass="errorLg" runat="Server"></asp:Label></p>
            </asp:Panel>
            <asp:Panel ID="pnlMeetsMinimumOrderAmountError" runat="Server" Visible="false">
                <p>
                    <asp:Label ID="MeetsMinimumOrderAmountError" CssClass="errorLg" runat="Server"></asp:Label></p>
            </asp:Panel>
            <asp:Panel ID="pnlMeetsMinimumOrderQuantityError" runat="Server" Visible="false">
                <p>
                    <asp:Label ID="MeetsMinimumOrderQuantityError" CssClass="errorLg" runat="Server"></asp:Label></p>
            </asp:Panel>
            <asp:Panel ID="pnlMicropay_EnabledError" runat="Server" Visible="false">
                <asp:Literal ID="Micropay_EnabledError" runat="Server"></asp:Literal>
            </asp:Panel>
            
            <asp:Panel ID="pnlCartSummary" runat="server" HorizontalAlign="right" DefaultButton="btnUpdateCart1">
                <br />
                <table width="100%" cellpadding="2" cellspacing="0" border="0" style="border-style: solid;
                    border-width: 0px; border-color: #444444">
                    <tr>
                        <td align="left" valign="top">
                            <aspdnsfc:ShoppingCartControl ID="ctrlShoppingCart" runat="server" HeaderTabImageURL='<%$ Tokens:SkinImage, shoppingcart.gif %>'
                                AllowEdit="true" ProductHeaderText='<%$ Tokens:StringResource, shoppingcart.product %>'
                                QuantityHeaderText='<%$ Tokens:StringResource, shoppingcart.quantity %>' SubTotalHeaderText='<%$ Tokens:StringResource, shoppingcart.subtotal %>'
                                OnItemDeleting="ctrlShoppingCart_ItemDeleting">
                                <LineItemSettings LinkToProductPageInCart='<%$ Tokens:AppConfigBool, LinkToProductPageInCart %>'
                                    ImageLabelText='<%$ Tokens:StringResource, shoppingcart.cs.1000 %>' SKUCaption='<%$ Tokens:StringResource, showproduct.aspx.21 %>'
                                    GiftRegistryCaption='<%$ Tokens:StringResource, shoppingcart.cs.92 %>' ItemNotesCaption='<%$ Tokens:StringResource, shoppingcart.cs.86 %>'
                                    ItemNotesColumns='<%$ Tokens:AppConfigUSInt, ShoppingCartItemNotesTextareaCols %>'
                                    ItemNotesRows='<%$ Tokens:AppConfigUSInt, ShoppingCartItemNotesTextareaRows %>'
                                    AllowShoppingCartItemNotes='<%$ Tokens:AppConfigBool, AllowShoppingCartItemNotes %>'
                                    ShowPicsInCart='<%$ Tokens:AppConfigBool, ShowPicsInCart %>' ShowEditButtonInCartForKitProducts='<%$ Tokens:AppConfigBool, ShowEditButtonInCartForKitProducts %>'
                                    ShowMultiShipAddressUnderItemDescription="true" />
                            </aspdnsfc:ShoppingCartControl>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Button ID="btnUpdateCart1" CssClass="UpdateCartButton" Text="<%$ Tokens:StringResource,shoppingcart.cs.110 %>"
                    runat="server" />
            </asp:Panel>
            
            <asp:Panel ID="pnlOrderOptions" runat="server" Visible="false" HorizontalAlign="right">
                <br />
                <aspdnsf:OrderOption ID="ctrlOrderOption" runat="server" EditMode="true" />
                <br />
                <asp:Button ID="btnUpdateCart2" runat="server" Text="<%$ Tokens:StringResource,shoppingcart.cs.110 %>"
                    CssClass="UpdateCartButton" />
            </asp:Panel>
            
            <asp:Panel ID="pnlCartSummarySubTotals" runat="server">
                <br />
                <br />
                <table width="100%">
                    <tr>
                        <td align="right" colspan="2">
                            <aspdnsf:CartSummary ID="ctrlCartSummary" runat="server" CalculateShippingDuringCheckout="true"
                                CalculateTaxDuringCheckout="true" CalculateShippingDuringCheckoutText='<%$Tokens:StringResource, shoppingcart.aspx.13 %>'
                                CalculateTaxDuringCheckoutText='<%$Tokens:StringResource, shoppingcart.aspx.15 %>'
                                SubTotalCaption='<%$Tokens:StringResource, shoppingcart.cs.96 %>' SubTotalWithDiscountCaption='<%$Tokens:StringResource, shoppingcart.cs.97 %>'
                                ShippingCaption='<%$Tokens:StringResource, shoppingcart.aspx.12 %>' SkipShippingOnCheckout='<%$Tokens:AppConfigBool, SkipShippingOnCheckout %>'
                                TaxCaption='<%$Tokens:StringResource, shoppingcart.aspx.14 %>' ShowTotal="False"
                                LineItemDiscountCaption ="<%$Tokens:StringResource, shoppingcart.cs.200 %>" OrderDiscountCaption="<%$Tokens:StringResource, shoppingcart.cs.201 %>"
                                IncludeTaxInSubtotal="False" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" colspan="2">
                            <asp:Button ID="btnRemoveEstimator" runat="server" OnClick="btnRemoveEstimator_Click"
                                Text="<%$ Tokens:StringResource,checkoutshipping.estimator.control.remove %>"
                                Visible="false" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" colspan="2">
                            <br />
                            <asp:Button ID="btnRequestEstimates" runat="server" OnClick="btnRequestEstimates_Click"
                                Visible="false" />
                            <asp:Panel ID="pnlShippingAndTaxEstimator" runat="server" CssClass="ShippingEstimatorPanel"
                                Visible="false">
                                <aspdnsfc:ShippingAndTaxEstimateTableControl ID="ctrlEstimate" runat="server" Visible="false" />
                                <aspdnsfc:ShippingAndTaxEstimatorAddressControl ID="ctrlEstimateAddress" runat="server"
                                    Visible="false" OnRequestEstimateButtonClicked="EstimateAddressControl_RequestEstimateButtonClicked" />
                            </asp:Panel>
                            <br />
                        </td>
                    </tr>
                </table>
                <br />
            </asp:Panel>
            
            <asp:Panel ID="pnlUpsellProducts" runat="server" Visible="false">
                <br />
                <asp:Literal ID="UpsellProducts" runat="server"></asp:Literal>
                <div style="text-align: right;">
                    <asp:Button ID="btnUpdateCart5" runat="server" Text="<%$ Tokens:StringResource,shoppingcart.cs.110 %>"
                        CssClass="UpdateCartButton" Visible="false" /></div>
            </asp:Panel>

            <asp:Panel ID="pnlCoupon" runat="server" Visible="false" DefaultButton="btnUpdateCart3">
                <table width="100%" cellpadding="2" cellspacing="0" border="0" style="border-style: solid;
                    border-width: 0px; border-color: #444444">
                    <tr>
                        <td align="left" valign="top">
                            <asp:Image ID="ShoppingCartCoupon_gif" runat="server" /><br />
                            <table width="100%" cellpadding="4" cellspacing="0" border="0" style="border-style: solid;
                                border-width: 1px; border-color: #444444;">
                                <tr>
                                    <td align="left" valign="top">
                                        <asp:Label ID="shoppingcartcs31" runat="server" Text="<%$ Tokens:StringResource,shoppingcart.cs.117 %>"></asp:Label>&#160;
                                        <asp:TextBox ID="CouponCode" Columns="30" MaxLength="50" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="btnRemoveCoupon" runat="server" Text="<%$ Tokens:StringResource,shoppingcart.aspx.removecoupon %>"
                                            Visible="false" OnClick="btnRemoveCoupon_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <div style="text-align: right">
                    <asp:Button ID="btnUpdateCart3" runat="server" Text="<%$ Tokens:StringResource,shoppingcart.cs.110 %>"
                        CssClass="UpdateCartButton" />
                </div>
            </asp:Panel>

            
            <asp:Panel ID="pnlPromotion" runat="server" DefaultButton="btnAddPromotion" CssClass="promotiontable">
                <br />
                <table width="100%" cellpadding="2" cellspacing="0" border="0" style="border-style: solid; border-width: 0px; border-color: #444444">
                    <tr>
                        <td align="left" valign="top">
                            <asp:Image ID="Image1" runat="server" ImageUrl="<%$ Tokens:SkinImage, specialoffercode.gif %>" CssClass="SpecialOfferCodeBanner" /><br />
                            <table width="100%" cellpadding="4" cellspacing="0" border="0" class="cartPageBox" style="border-style: solid; border-width: 1px; border-color: #444444;">
                                <tr>
                                    <td class="promotioncodeentrycell">
                                        <span class="promotioncodeentrydescription">
                                            <asp:Label ID="shoppingcartcs118" runat="server" Text="<%$ Tokens:StringResource,shoppingcart.cs.118 %>"></asp:Label>&#160;
                                        </span>
                                        <span class="promotioncodeentrybox">
                                            <asp:TextBox ID="txtPromotionCode" Columns="20" MaxLength="100" runat="server"></asp:TextBox>
                                        </span>
                                        <span class="promotioncodeentryvalidation">
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPromotionCode" ValidationGroup="AddPromotion" ErrorMessage="*" Display="Static" />
                                        </span>
                                        <span class="promotioncodeentrybutton">
                                            <asp:Button ID="btnAddPromotion" runat="server" Text="Add" OnClick="btnAddPromotion_Click" ValidationGroup="AddPromotion" />
                                        </span>
                                        <div class="promotioncodeentryerror">
                                            <asp:Label ID="lblPromotionError" runat="Server" CssClass="error" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="promotionlist">
                                        <asp:Repeater ID="repeatPromotions" runat="server" OnItemDataBound="repeatPromotions_ItemDataBound" OnItemCommand="repeatPromotions_ItemCommand">
                                            <ItemTemplate>
                                                <div class="promotionlistitem">
                                                    <span class="promotionlistitemcode">
                                                        <%# Eval("Code") %>
                                                    </span>
                                                    <span class="promotionlistitemdescription">
                                                        <%# Eval("Description") %>
                                                    </span>
                                                    <span class="promotioncodeentrylink">
                                                        <asp:LinkButton ID="lnkRemovePromotion" runat="server" CommandArgument='<%# Eval("Code") %>' CommandName="RemovePromotion" Text="Remove" />
                                                    </span>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            

            <asp:Panel ID="pnlOrderNotes" runat="server" Visible="false" DefaultButton="btnUpdateCart4">
                <br />
                <table width="100%" cellpadding="2" cellspacing="0" border="0" style="border-style: solid;
                    border-width: 0px; border-color: #444444">
                    <tr>
                        <td align="left" valign="top">
                            <asp:Image ID="ShoppingCartNotes_gif" runat="server" /><br />
                            <table width="100%" cellpadding="4" cellspacing="0" border="0" style="border-style: solid;
                                border-width: 1px; border-color: #444444;">
                                <tr>
                                    <td align="left" valign="top">
                                        <asp:Label ID="lblOrderNotes" runat="server" Text="<%$ Tokens:StringResource,shoppingcart.cs.66 %>"></asp:Label><br />
                                        <asp:TextBox ID="OrderNotes" Style="width: 99%;" Rows="4" TextMode="MultiLine" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <div style="text-align: right">
                    <asp:Button ID="btnUpdateCart4" runat="server" Text="<%$ Tokens:StringResource,shoppingcart.cs.110 %>"
                        CssClass="UpdateCartButton" />
                </div>
            </asp:Panel>
            <br />
            <table cellspacing="3" cellpadding="0" width="100%" border="0">
                <tr>
                    <td>
                        &#160;
                    </td>
                    <td valign="bottom" align="right">
                        <asp:Button ID="btnContinueShoppingBottom" Text="<%$ Tokens:StringResource,shoppingcart.cs.62 %>"
                            CssClass="ContinueShoppingButton" runat="server" />&#160;
                        <asp:Button ID="btnCheckOutNowBottom" Text="<%$ Tokens:StringResource,shoppingcart.cs.111 %>"
                            runat="server" CssClass="CheckoutNowButton" />&#160;
                        <asp:Button ID="btnQuickCheckoutBottom" Text="<%$ Tokens:StringResource,shoppingcart.cs.111a %>"
                            runat="server" Visible="false" CssClass="CheckoutNowButton" />
                        <asp:Button ID="btnInternationalCheckOutNowBottom" Text="<%$ Tokens:StringResource,shoppingcart.cs.111b %>"
                            Visible="False" runat="server" CssClass="CheckoutNowButton" />&#160;
                    </td>
                </tr>
                <tr runat="server" id="AlternativeCheckouts2">
                    <td colspan="2" align="right" style="height: 61px">
                        <table border="0" width="100%">
                            <tr>
                                <td align="right" style="height: 61px">
                                    <div runat="server" id="AmazonCheckoutSpan2" style="float: right;">
                                        <asp:Literal ID="litAmazonCheckoutButton2" runat="server" />
                                    </div>
                                    <div runat="server" id="PayPalExpressSpan2" style="float: right;">
                                        <asp:ImageButton ImageAlign="Top" ID="btnPayPalExpressCheckout2" ImageUrl="" Style="margin-right: 7px;"
                                            runat="server" OnClick="btnPayPalExpressCheckout_Click" />
                                    </div>
                                    <div runat="server" id="GoogleCheckoutSpan2" style="float: right;">
                                        <asp:ImageButton ImageAlign="Top" runat="server" ID="btnGoogleCheckout2" OnClick="btnGoogleCheckout_Click"
                                            ImageUrl="https://checkout.google.com/buttons/checkout.gif?w=180&h=46&style=white&variant=text"
                                            Style="margin-right: 7px;" />
                                        <asp:Image ImageAlign="Top" runat="server" ID="imgGoogleCheckout2Disabled" ImageUrl="https://checkout.google.com/buttons/checkout.gif?w=180&h=46&style=white&variant=disabled"
                                            Visible="false" Style="margin-right: 7px;" />
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <aspdnsf:Topic ID="CartPageFooterTopic" runat="server" TopicName="CartPageFooter" />
            <asp:Literal ID="XmlPackage_ShoppingCartPageFooter" runat="server"></asp:Literal>
        </div>
    </asp:Panel>
</asp:Content>
