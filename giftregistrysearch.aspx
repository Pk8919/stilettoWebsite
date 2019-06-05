<%@ Page language="c#" Inherits="AspDotNetStorefront.giftregistrysearch" CodeFile="giftregistrysearch.aspx.cs" MasterPageFile="~/App_Templates/Skin_1/template.master" %>
<%@ Register TagPrefix="aspdnsfc" Namespace="AspDotNetStorefrontControls" Assembly="AspDotNetStorefrontControls" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PageContent">
    <asp:Panel ID="pnlContent" runat="server" >
    
        <asp:Table ID="tblGiftRegistrySearch" CellSpacing="0" CellPadding="2" Width="100%" runat="server">
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="left" VerticalAlign="top">
                        <asp:Image ID="giftregistry3_gif" runat="server" /><br/>

                        <asp:Table ID="tblGiftRegistrySearchBox" CellSpacing="0" CellPadding="3" Width="100%" runat="server">
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="left" VerticalAlign="top">
                                    <asp:Literal ID="giftregistrysearch_aspx_2" runat="server" Mode="PassThrough"></asp:Literal>
                                    
                                    <table width="100%">
                                        <tr>
                                            <td width="33%" align="center" valign="top">
                                                <asp:Literal ID="giftregistrysearch_aspx_3" runat="server" Mode="PassThrough"></asp:Literal><br />
                                            </td>
                                            <td width="33%" align="center" valign="top">
                                                <asp:Literal ID="giftregistrysearch_aspx_4" runat="server" Mode="PassThrough"></asp:Literal><br />
                                            </td>
                                            <td width="33%" align="center" valign="top">
                                                <asp:Literal ID="giftregistrysearch_aspx_5" runat="server" Mode="PassThrough"></asp:Literal><br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="33%" align="center" valign="top">
                                                <asp:TextBox ID="txtSearchForName"   MaxLength="100" runat="server" TabIndex="1"></asp:TextBox><br />
                                            </td>
                                            <td width="33%" align="center" valign="top">
                                                <asp:TextBox ID="txtSearchForNickName" MaxLength="100" runat="server" TabIndex="3"></asp:TextBox><br />
                                            </td>
                                            <td width="33%" align="center" valign="top">
                                                <asp:TextBox ID="txtSearchForEMail" MaxLength="100" runat="server" TabIndex="5"></asp:TextBox><br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="33%" align="center" valign="top">
                                                <asp:Button ID="btnSearchForName" TabIndex="2" CssClass="GiftRegistrySearchButton" runat="server" OnClick="btnSearchForName_Click" />
                                            </td>
                                            <td width="33%" align="center" valign="top">
                                                <asp:Button ID="btnSearchForNickName" TabIndex="4" CssClass="GiftRegistrySearchButton" runat="server" OnClick="btnSearchForNickName_Click" />
                                            </td>
                                            <td width="33%" align="center" valign="top">
                                                <asp:Button ID="btnSearchForEMail" TabIndex="6" CssClass="GiftRegistrySearchButton" runat="server" OnClick="btnSearchForEMail_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <asp:Literal ID="SearchResults" runat="server" Mode="PassThrough" Visible="true"></asp:Literal>
            <asp:Panel ID="pnlSearchResults" runat="server" Visible="false">
                <br />
                <p align="left">
                    <asp:Literal ID="giftregistry_aspx_16" runat="server" Mode="PassThrough" ></asp:Literal>
                    <asp:Button ID="btnSaveButton" runat="server" CssClass="GiftRegistrySaveButton" Visible="false" OnClick="btnSaveButton_Click" />
                </p>
                <asp:Literal ID="ltGiftRegistryQuantityWarning" runat="server" Text='<%$ Tokens:StringResource, giftregistry.aspx.24 %>' />
                <br /><br />
                <asp:Table ID="tblSearchResults" CellSpacing="0" CellPadding="2" Width="100%" runat="server">
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="left" VerticalAlign="top">
                            <aspdnsfc:ShoppingCartControl ID="ctrlTheirRegistry" runat="server"
                                ProductHeaderText='<%$ Tokens:StringResource, shoppingcart.product %>'
                                QuantityHeaderText='<%$ Tokens:StringResource, shoppingcart.quantity %>'
                                SubTotalHeaderText='<%$ Tokens:StringResource, shoppingcart.subtotal %>'  
                                    HeaderTabImageURL='<%$ Tokens:SkinImage, giftregistry5.gif %>' 
                                    DisplayMode="GiftRegistry" AllowEdit="false" 
                                    OnMoveToShoppingCartInvoked="ctrlTheirRegistry_MoveToShoppingCartInvoked" 
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
                                        MoveFromGiftRegistryText='<%$ Tokens:StringResource, giftregistry.aspx.14 %>'
                                      />
                                </aspdnsfc:ShoppingCartControl>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:Panel>
        
    </asp:Panel>
</asp:Content>
