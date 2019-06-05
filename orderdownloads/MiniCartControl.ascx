<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MiniCartControl.ascx.cs"
    Inherits="MiniCartControl" %>
<%@ Import Namespace="Vortx.OnePageCheckout.Models" %>
<asp:UpdatePanel ID="UpdatePanelMiniCartControl" runat="server" UpdateMode="Conditional"
    ChildrenAsTriggers="false">
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="RepeaterCartItems" />
    </Triggers>
    <ContentTemplate>
        <asp:Repeater ID="RepeaterCartItems" runat="server" Visible="true" OnItemCommand="RepeaterCartItems_OnItemCommand"
            OnItemDataBound="RepeaterCartItems_OnItemDataBound">
            <ItemTemplate>
                <div class="miniCartItemRow">
                    <div class="cartItemImageWrap">
                        <asp:Image runat="server" ID="ProductImage" />
                    </div>
                    <div class="cartItemName">
                        <asp:HyperLink runat="server" ID="ItemLink" NavigateUrl='<%# ((IShoppingCartItem) Container.DataItem).ProductUrl %>'>
                            <asp:Label ID="ItemName" runat="server" Text='<%# ((IShoppingCartItem) Container.DataItem).Name %>' />
                        </asp:HyperLink>
                    </div>
                    <div class="cartItemNumber">
                        <asp:Literal runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.97") %>' />
                        <asp:Label ID="LabelSKU" runat="server" Text='<%# ((IShoppingCartItem) Container.DataItem).Sku %>' />
                        <asp:Panel ID="PanelSize" runat="server" Visible="false">
                            <asp:Label ID="ProductSizeLabel" runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.95") %>'></asp:Label>
                            <asp:Label ID="ProductSize" runat="server" Text='<%# ((Vortx.OnePageCheckout.Models.IShoppingCartItem)Container.DataItem).Size%>'></asp:Label>
                        </asp:Panel>
                        <asp:Panel ID="PanelColor" runat="server" Visible="false">
                            <asp:Label ID="ProductColorLabel" runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.96") %>'></asp:Label>
                            <asp:Label ID="ProductColor" runat="server" Text='<%# ((Vortx.OnePageCheckout.Models.IShoppingCartItem)Container.DataItem).Color%>'></asp:Label>
                        </asp:Panel>
                    </div>
                    <div class="cartItemDetails">
                        <div class="cartItemQuantityPriceWrap">
                            <table class="cartItemQuantityPriceTable" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label ID="CartItemPriceLabel" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.94") %>' runat="server" />
                                        <asp:Label ID="CartItemPriceValue" Text='<%# ((IShoppingCartItem) Container.DataItem).Price.ToString("C") %>'
                                            runat="server" />
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="CartItemQuantityLabel" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.98") %>' runat="server" />
                                        <asp:DropDownList ID="CartItemRestrictedQuantity" runat="server" Visible="false"></asp:DropDownList>
                                        <asp:TextBox ID="CartItemQuantityValue" CssClass="MiniCartQuantity" Columns="2" runat="server"
                                            Text='<%# ((IShoppingCartItem) Container.DataItem).Quantity %>' />
                                    </td>
                                    <td>
                                        <asp:Button runat="server" ID="ButtonCartItemUpdate" CssClass="ButtonCartItemUpdate"
                                            Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.112") %>' CommandName="Update" CommandArgument='<%# ((IShoppingCartItem) Container.DataItem).ItemCartId %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        <asp:Button runat="server" ID="ButtonCartItemRemove" CssClass="ButtonCartItemRemove"
                                            Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.113") %>' CommandName="Remove" CommandArgument='<%# ((IShoppingCartItem) Container.DataItem).ItemCartId %>' />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div style="clear: both;">
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <asp:Repeater ID="RepeaterOrderOptions" runat="server" OnItemCommand="RepeaterOrderOptions_OnItemCommand">
            <HeaderTemplate>
                <table width="95%" cellpadding="0" cellspacing="0" border="0" style="margin: 3px;">
                    <tbody>
                        <tr>
                            <td align="left" width="50%">
                                <span class="OrderOptionsTitle">
                                    <asp:Literal runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.99") %>' />
                                </span>
                            </td>
                            <td align="center" width="25%">
                                <span class="OrderOptionsRowHeader">
                                    <asp:Literal runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.100") %>' /></span>
                            </td>
                            <td align="center">
                                <span class="OrderOptionsRowHeader">
                                    <asp:Literal runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.101") %>' /></span>
                            </td>
                        </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td align="left">
                        <img src="images/OrderOption/icon/<%# ((IOrderOptionItem)Container.DataItem).OrderOptionID %>.jpg"
                            class="MiniCart_OrderOptionImage" border="0" align="absmiddle">&nbsp; <span class="OrderOptionsName">
                                <%# ((IOrderOptionItem)Container.DataItem).Name %>&nbsp;</span>
                    </td>
                    <td align="center">
                        <span class="OrderOptionsPrice">
                            <%# ((IOrderOptionItem)Container.DataItem).Cost.ToString("C") %></span>
                    </td>
                    <td width="200px" align="center">
                        <asp:Image ID="OrderOptionSelectedImage" runat="server" ImageUrl="images/Selected.gif" />
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </tbody> </table>
                <br />
            </FooterTemplate>
        </asp:Repeater>
    </ContentTemplate>
</asp:UpdatePanel>
