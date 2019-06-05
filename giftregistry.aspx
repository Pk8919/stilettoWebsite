<%@ Page language="c#" Inherits="AspDotNetStorefront.giftregistry" CodeFile="giftregistry.aspx.cs" MasterPageFile="~/App_Templates/Skin_1/template.master" %>
<%@ Register TagPrefix="aspdnsfc" Namespace="AspDotNetStorefrontControls" Assembly="AspDotNetStorefrontControls" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PageContent">
    <asp:Panel ID="pnlContent" runat="server" >
    
        <asp:Literal ID="giftregistry_aspx_10" Mode="PassThrough" runat="server"></asp:Literal> <br /><br />
            <script type="text/javascript" >
                function GiftRegistryForm_Validator(theForm)
                {
                    return (true);
                }
            </script>
             <asp:Panel ID="pnlGiftRegistrySearches" runat="server" Visible="true">
                    <asp:Table ID="tblGiftRegistrySearches" CellSpacing="0" CellPadding="2" Width="100%" runat="server">
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="left" VerticalAlign="top">
                                <asp:Image ID="giftregistry6_gif" runat="server" /><br/>

                                <asp:Table ID="tblGiftRegistrySearchesBox" CellSpacing="0" CellPadding="4" Width="100%" runat="server">
                                    <asp:TableRow>
                                        <asp:TableCell HorizontalAlign="left" VerticalAlign="top">
                                            <asp:Repeater ID="rptrGiftRegistrySearches" runat="server">
                                                <HeaderTemplate><table cellpadding="2" cellspacing="1" border="0" width="100%"></HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td align="left" valign="middle"><asp:HyperLink ID="lnkGiftRegistry" runat="server" NavigateUrl='<%#"giftregistry.aspx?guid=" + DataBinder.Eval(Container.DataItem, "GiftRegistryGUID").ToString() %>' Text='<%#DataBinder.Eval(Container.DataItem, "CustomerName") %>'></asp:HyperLink></td>
                                                        <td align="right" valign="middle"><asp:Button ID="btnDelGiftRegSrch" CssClass="UpdateGiftSettingsButton" Text='<%#DataBinder.Eval(Container.DataItem, "Label") %>' CommandArgument='<%#DataBinder.Eval(Container.DataItem, "CustomerGiftRegistrySearchesID") %>' CommandName="delete" runat="server" /></td>
                                                    </tr>
                                                </ItemTemplate>
                                                <FooterTemplate></table></FooterTemplate>
                                            </asp:Repeater>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                    <br />
                </asp:Panel>
                <asp:Panel ID="pnlNoCustomer" runat="server" Visible="false">
                    <asp:Table ID="tblNoCustomer" CellSpacing="0" CellPadding="2" Width="100%" runat="server">
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="left" VerticalAlign="top">
                                <asp:Image ID="giftregistry_gif1" runat="server" /><br/>
                                <asp:Table ID="tblNoCustomerBox" CellSpacing="0" CellPadding="4" Width="100%" runat="server">
                                    <asp:TableRow>
                                        <asp:TableCell HorizontalAlign="left" VerticalAlign="top">
                                            <asp:Label ID="giftregistry_aspx_2" runat="server" Font-Bold="false"></asp:Label><br/><br/>
                                            <asp:Button ID="btnContinueShopping1" runat="server" CssClass="UpdateGiftSettingsButton"  Text="<%$ Tokens:StringResource,giftregistry.aspx.3 %>"/>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                    <br />
                </asp:Panel>
                <asp:Literal ID="giftregistry_aspx_18" runat="server" Mode="PassThrough" Visible="false"></asp:Literal>
                <asp:Panel ID="pnlGiftRegistrySettings" runat="server" Visible="false">
                    <asp:Literal ID="giftregistry_aspx_17" runat="server" Mode="PassThrough" Visible="false"></asp:Literal>
                    <asp:Table ID="tblGiftRegSettings" CellSpacing="0" CellPadding="2" Width="100%" runat="server">
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="left" VerticalAlign="top">
                                <asp:Image ID="giftregistry2_gif" runat="server" AlternateText="" /><br />

                                <asp:Table ID="tblGiftRegSettingsBox" CellSpacing="0" CellPadding="4" Width="100%" runat="server">
                                    <asp:TableRow>
                                        <asp:TableCell HorizontalAlign="left" VerticalAlign="top">
                                            <asp:Label ID="giftregistry_aspx_5" runat="server" Font-Bold="true"></asp:Label><br />
                                            <asp:Literal ID="litYes1" Mode="PassThrough" runat="server"></asp:Literal>&nbsp;<asp:RadioButton ID="GiftRegistryIsAnonymousYes" GroupName="GiftRegistryIsAnonymous" runat="server" />&nbsp;&nbsp;&nbsp;<asp:Literal ID="LitNo1" Mode="PassThrough" runat="server"></asp:Literal>&nbsp;<asp:RadioButton ID="GiftRegistryIsAnonymousNo" GroupName="GiftRegistryIsAnonymous" runat="server" /><br />
                                            <br />
                                            <asp:Label ID="giftregistry_aspx_6" runat="server"></asp:Label><br />
                                            <asp:TextBox ID="txtGiftRegistryNickName" MaxLength="50" runat="server" ></asp:TextBox><asp:Literal ID="giftregistry_aspx_9" runat="server" Mode="PassThrough"></asp:Literal>
                                            <br />
                                            <asp:Literal ID="giftregistry_aspx_19" runat="server" Mode="PassThrough" Visible="false"></asp:Literal>
                                            <br />
                                            <asp:Label ID="giftregistry_aspx_7" runat="server"></asp:Label><br />
                                            <asp:Literal ID="litYes2" Mode="PassThrough" runat="server"></asp:Literal>&nbsp;<asp:RadioButton ID="GiftRegistryHideShippingAddressesYes" GroupName="GiftRegistryHideShippingAddresses" runat="server" />&nbsp;&nbsp;&nbsp;<asp:Literal ID="LitNo2" Mode="PassThrough" runat="server"></asp:Literal>&nbsp;<asp:RadioButton ID="GiftRegistryHideShippingAddressesNo" GroupName="GiftRegistryHideShippingAddresses" runat="server" /><br />
                                            <br />
                                            <br />
                                            <asp:Label ID="giftregistry_aspx_12" runat="server"></asp:Label><br />
                                            <asp:Literal ID="litYes3" Mode="PassThrough" runat="server"></asp:Literal>&nbsp;<asp:RadioButton ID="GiftRegistryAllowSearchByOthersYes" GroupName="GiftRegistryAllowSearchByOthers" runat="server" />&nbsp;&nbsp;&nbsp;<asp:Literal ID="LitNo3" Mode="PassThrough" runat="server"></asp:Literal>&nbsp;<asp:RadioButton ID="GiftRegistryAllowSearchByOthersNo" GroupName="GiftRegistryAllowSearchByOthers" runat="server" /><br />
                                            <br />
                                            <div align="center">
                                                <asp:Button ID="btnUpdateGiftSettings" runat="server" CssClass="UpdateGiftButton" />
                                            </div>
                                            <br />
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </asp:Panel>
                <br />
                <asp:Panel ID="pnlRegistryLink" runat="server" Visible="false">
                    <asp:Table ID="tblRegistryLink" CellSpacing="0" CellPadding="2" Width="100%" runat="server">
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="left" VerticalAlign="top">
                                <asp:Image ID="giftregistry7_gif" runat="server" AlternateText="" /><br />

                                <asp:Table ID="tblRegistryLinkBox" CellSpacing="0" CellPadding="4" Width="100%" runat="server">
                                    <asp:TableRow>
                                        <asp:TableCell HorizontalAlign="left" VerticalAlign="top">
                                            <asp:Literal ID="giftregistry_aspx_11" runat="server" Mode="PassThrough"></asp:Literal><br />
                                            <asp:TextBox ID="txtMyyRegistryLink" TextMode="MultiLine" runat="server" Rows="5" ReadOnly="true" style="width: 99%;" ></asp:TextBox>
                                            <br /><br />
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                    <br />
                </asp:Panel>
                <asp:Panel ID="pnlMyGiftRegistryItems" runat="server" Visible="false">
                    <asp:Table ID="tblGiftRegistryItems" CellSpacing="0" CellPadding="2" Width="100%" runat="server">
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="left" VerticalAlign="top">
                                <aspdnsfc:ShoppingCartControl ID="ctrlMyRegistry" runat="server"
                                    ProductHeaderText='<%$ Tokens:StringResource, shoppingcart.product %>'
                                    QuantityHeaderText='<%$ Tokens:StringResource, shoppingcart.quantity %>'
                                    SubTotalHeaderText='<%$ Tokens:StringResource, shoppingcart.subtotal %>'  
                                    HeaderTabImageURL='<%$ Tokens:SkinImage, giftregistry.gif %>' 
                                    onitemdeleting="ctrlMyRegistry_ItemDeleting" DisplayMode="GiftRegistry" 
                                    OnMoveToShoppingCartInvoked="ctrlMyRegistry_MoveToShoppingCartInvoked" 
                                    EmptyCartTopicName="EmptyGiftRegistryText" >
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
                                        MoveFromGiftRegistryText='<%$ Tokens:StringResourceFormat, shoppingcart.cs.5, AppConfig.CartPrompt %>'
                                      />
                                </aspdnsfc:ShoppingCartControl>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Button ID="btnUpdateGiftRegistry" OnClick="btnUpdateGiftRegistry_click" Text="<%$ Tokens:StringResource,giftregistry.aspx.update %>" runat="server" />
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </asp:Panel>
                <asp:Panel ID="pnlTheirGiftRegistry" runat="server" Visible="false">
                    <br />
                    <asp:Literal ID="ltGiftRegistryQuantityWarning" runat="server" Text='<%$ Tokens:StringResource, giftregistry.aspx.24 %>' />
                    <br />
                    <asp:Table ID="tblTheirGiftRegistryItems" CellSpacing="0" CellPadding="2" Width="100%" runat="server">
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="left" VerticalAlign="top">
                                <aspdnsfc:ShoppingCartControl ID="ctrlTheirRegistry" runat="server"
                                    ProductHeaderText='<%$ Tokens:StringResource, shoppingcart.product %>'
                                    QuantityHeaderText='<%$ Tokens:StringResource, shoppingcart.quantity %>'
                                    SubTotalHeaderText='<%$ Tokens:StringResource, shoppingcart.subtotal %>'  
                                    HeaderTabImageURL='<%$ Tokens:SkinImage, giftregistry5.gif %>' 
                                    DisplayMode="GiftRegistry" AllowEdit="true"
                                    OnMoveToShoppingCartInvoked="ctrlTheirRegistry_MoveToShoppingCartInvoked" 
                                    EmptyCartTopicName="EmptyGiftRegistryText"  >
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
                                        MoveFromGiftRegistryText='<%$ Tokens:StringResource, giftregistry.aspx.14 %>'
                                      />
                                </aspdnsfc:ShoppingCartControl>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                    <asp:Literal ID="giftregistry_aspx_13" runat="server" Mode="PassThrough" Visible="false"></asp:Literal>
                </asp:Panel>
                
    </asp:Panel>
</asp:Content>

