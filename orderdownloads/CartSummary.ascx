<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CartSummary.ascx.cs" Inherits="OPCControls_CartSummary" %>
<asp:UpdatePanel ID="UpdatePanelCartSummary" runat="server" UpdateMode="Conditional"
    RenderMode="Block" ChildrenAsTriggers="false">
    <ContentTemplate>
        <div id="shipMethodAmounts">
            <table cellspacing="0" cellpadding="0" class="shipMethodAmountsTable">
                <tr>
                    <td class="miniCartSummaryLabel">
                        <asp:Label runat="server" ID="LabelSubTotal" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.60") %>' />
                    </td>
                    <td class="alignRight">
                        <asp:Label runat="server" ID="SubTotal" CssClass="shipMethodAmount" />
                    </td>
                </tr>

                <tr id="LineItemDiscountRow" runat="server" class="miniCartSummaryLabel">
                    <td class="miniCartSummaryLabel">
                        <asp:Label ID="LineItemDiscountLabel" runat="server" />
                    </td>
                    <td class="alignRight">
                        <asp:Label ID="LineItemDiscount" runat="server" CssClass="shipMethodAmount" />
                    </td>
                </tr>

                <asp:TableRow ID="QuantityDiscountRow" runat="server">
                    <asp:TableCell CssClass="miniCartSummaryLabel">
                        <asp:Label runat="server" ID="LabelQuantityDiscount" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.62") %>' />
                    </asp:TableCell>
                    <asp:TableCell CssClass="alignRight">
                        <asp:Label runat="server" ID="LabelQuantityDiscountAmount" CssClass="shipMethodAmount" />
                    </asp:TableCell>
                </asp:TableRow>    
				
                <tr>
                    <td class="miniCartSummaryLabel">
                        <asp:Label runat="server" ID="LabelShipMethodAmounts" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.63") %>' />
                    </td>
                    <td class="alignRight">
                        <asp:Label runat="server" ID="ShipMethodAmount" CssClass="shipMethodAmount" />
                    </td>
                </tr>
                <tr id="trTaxAmounts" runat="server">
                    <td class="miniCartSummaryLabel">
                        <asp:Label runat="server" ID="LabelTaxAmounts" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.64") %>' />
                    </td>
                    <td class="alignRight">
                        <asp:Label runat="server" ID="TaxAmount" CssClass="shipMethodAmount" />
                    </td>
                </tr>

                <tr id="OrderItemDiscountRow" runat="server" class="miniCartSummaryLabel">
                    <td class="miniCartSummaryLabel">
                        <asp:Label ID="OrderItemDiscountLabel" runat="server" />
                    </td>
                    <td class="alignRight">
                        <asp:Label ID="OrderItemDiscount" runat="server" CssClass="shipMethodAmount" />
                    </td>
                </tr>

                <tr class="orderTotalRow">
                    <td class="miniCartSummaryLabel">
                        <asp:Label runat="server" ID="LabelTotal" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.65") %>' />
                    </td>
                    <td class="alignRight">
                        <asp:Label runat="server" ID="Total" CssClass="shipMethodAmount" />
                    </td>
                </tr>
                
            </table>
        </div>
        <%--commented out the following div with display:none cuz of the code behide references--%>
        <div style="display: none;">
            <div>
                <asp:Literal runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.66") %>' />
            </div>
            <div>
                <asp:Literal runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.67") %>' />
                <asp:Label runat="server" ID="ShippingMethod" Text="" />
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
