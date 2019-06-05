<%@ Control Language="C#" AutoEventWireup="true" CodeFile="OnePageCheckout.ascx.cs"
    Inherits="Vortx.OnePageCheckout.OPCControls_OnePageCheckout" %>
<%@ Register Src="MiniCartControl.ascx" TagName="MiniCartControl" TagPrefix="opc" %>
<%@ Register Src="CartSummary.ascx" TagName="CartSummary" TagPrefix="opc" %>
<%@ Register Src="LoginPanel.ascx" TagName="LoginPanel" TagPrefix="opc" %>
<%@ Register Src="Addresses/ShippingAddressStatic.ascx" TagName="ShippingAddressStatic"
    TagPrefix="opc" %>
<%@ Register Src="Addresses/ShippingAddressEdit.ascx" TagName="ShippingAddressEdit"
    TagPrefix="opc" %>
<%@ Register Src="Addresses/ShippingAddressUKEdit.ascx" TagName="ShippingAddressUKEdit"
    TagPrefix="opc" %>
<%@ Register Src="Addresses/ShippingAddressNoZipEdit.ascx" TagName="ShippingAddressNoZipEdit"
    TagPrefix="opc" %>
<%@ Register Src="Addresses/BillingAddressEdit.ascx" TagName="BillingAddressEdit"
    TagPrefix="opc" %>
<%@ Register Src="Addresses/BillingAddressStatic.ascx" TagName="BillingAddressStatic"
    TagPrefix="opc" %>
<%@ Register Src="Addresses/AddressBook.ascx" TagName="AddressBook" TagPrefix="opc" %>
<%@ Register Src="ShippingMethodSelector.ascx" TagName="ShippingMethodSelector" TagPrefix="opc" %>
<%@ Register Src="PaymentMethodSelector.ascx" TagName="PaymentMethodSelector" TagPrefix="opc" %>
<%@ Register Src="CreateAccount.ascx" TagName="CreateAccount" TagPrefix="opc" %>
<%@ Register Src="CustomerService.ascx" TagName="CustomerService" TagPrefix="opc" %>
<%@ Register Src="Content/ContentPanel.ascx" TagName="ContentPanel" TagPrefix="opc" %>
<%@ Register Assembly="Vortx.OnePageCheckout" Namespace="Vortx.OnePageCheckout.WebUtility"
    TagPrefix="opc" %>
<%@ Register TagPrefix="aspdnsf" TagName="BuySafeKicker" Src="~/controls/BuySafeKicker.ascx" %>

<opc:OPCScriptManagerProxy ID="OPCScriptManagerProxy1" runat="server">
    <Scripts>
        <asp:ScriptReference Path="~/OPCControls/scripts/dropDownControl.js" />
        <asp:ScriptReference Path="~/OPCControls/scripts/Address.js" />
        <asp:ScriptReference Path="~/OPCControls/scripts/creditCardTypeSelector.js" />
        <asp:ScriptReference Path="~/OPCControls/scripts/simpleLightBox.js" />
        <asp:ScriptReference Path="~/OPCControls/scripts/focus.js" />
    </Scripts>
</opc:OPCScriptManagerProxy>
<asp:Literal ID="StylesheetLiteral" runat="server"></asp:Literal>
<asp:UpdateProgress ID="OPCUpdateProgress" runat="server">
    <ProgressTemplate>
        <div id="updateProgressBackground">
        </div>
        <div id="updateProgress">
        </div>
    </ProgressTemplate>
</asp:UpdateProgress>
<asp:UpdatePanel runat="server" UpdateMode="Conditional" ID="UpdatePanelOnePageCheckoutMain"
    RenderMode="Block" ChildrenAsTriggers="false">
    <ContentTemplate>
        <div id="OnePageCheckoutWrap">
            <div id="OPHeader">
                <asp:Literal Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.1") %>' runat="server" />
                <img src="OPCControls/images/SecureLock.gif" alt="" />
                <asp:Literal Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.2") %>' runat="server" />
            </div>
            <div id="OPLeftCol">
                <div class="onePageContents">                       
				
                    <asp:Panel runat="server" ID="PanelAccount" CssClass="checkoutBlock">
                        <opc:LoginPanel ID="LoginView" runat="server" />
                    </asp:Panel>
                    <asp:Panel ID="PanelShippingAddressWrap" runat="server" CssClass="checkoutBlock">
                        <asp:Panel runat="server" ID="PanelAddressBook" CssClass="modalAddressBookWindow">
                            <div id="ShippingAddressBookBox">
                                <opc:AddressBook ID="AddressBookView" runat="server" />
                                <br />
                                <asp:Button Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.134") %>' ID="ButtonAddressBookClose" runat="server" OnClientClick="return hideForm('ShippingAddressBookBox');" />
                            </div>
                        </asp:Panel>
                        <asp:Panel runat="server" ID="PanelShippingAddressHeader">
                            <asp:Label runat="server" ID="ShipAddressHeader" CssClass="checkoutHeader">
                                <asp:Literal runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.132") %>' />
                            </asp:Label>
                            <asp:LinkButton ID="HyperLinkShippingAddressBook" runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.102") %>'
                                Visible="false" OnClientClick="return showForm('ShippingAddressBookBox','modalAddressBookBackground');" />
                        </asp:Panel>
                        <asp:Panel runat="server" ID="PanelShippingAddress" CssClass="subSection">
                            <opc:ShippingAddressEdit ID="ShippingAddressEditView" runat="server" />
                            <opc:ShippingAddressUKEdit ID="ShippingAddressEditUKView" runat="server" />
                            <opc:ShippingAddressNoZipEdit ID="ShippingAddressNoZipEditView" runat="server" />
                            <opc:ShippingAddressStatic ID="ShippingAddressStaticView" runat="server" />
                        </asp:Panel>
                    </asp:Panel>
                    <asp:Panel ID="PanelCheckOutByAmazonShipping" runat="server" CssClass="checkoutBlock" Visible="false">
                        <table>
                            <tr>
                                <td>
                                    <asp:Literal ID="LitCheckOutByAmazoneShipping" runat="server" />
									<div style="visibility:hidden;">
										<asp:Button id="btnRefreshCBAAddress" CssClass="btnRefreshCBAAddress" runat="server" OnClick="btnRefreshCBAAddress_Click" />
									</div>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel ID="PanelShippingMethod" runat="server" CssClass="checkoutBlock">
                        <div>
                            <asp:Label runat="server" ID="lblShipMethodHeader" CssClass="checkoutHeader">
                                <asp:Literal Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.3") %>' runat="server" />
                            </asp:Label>
                            <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.135") %>' NavigateUrl="t-shipping.aspx"
                                Target="_blank" Visible="false" />
                        </div>
                        <div id="ShipMethodWrap">
                            <asp:Panel runat="server" ID="PanelShipMethods">
                                <opc:ShippingMethodSelector ID="ShipMethodView" runat="server" />
                            </asp:Panel>
                        </div>
                    </asp:Panel>
					<asp:Panel ID="PanelCheckboxOver13" runat="server" Visible="false" CssClass="checkoutBlock">
						<table>
							<tr>
								<td>
									<asp:CheckBox runat="server" id="Over13Checkbox" AutoPostBack="true" OnCheckedChanged="Over13Checkbox_CheckedChanged" />
								</td>
								<td>
									<asp:Literal ID="Literal1" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.9") %>' runat="server" />
								</td>
							</tr>
						</table>
					</asp:Panel>
					<asp:Panel runat="server" ID="PanelTerms" Visible="false" CssClass="checkoutBlock">
                        <table>
                            <tr>
                                <td>
									<asp:CheckBox runat="server" ID="TermsCheckbox" AutoPostBack="true" OnCheckedChanged="TermsCheckbox_CheckedChanged" />
                                </td>
                                <td>
                                    <asp:Literal ID="Literal3" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.10") %>' runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    <opc:ContentPanel ID="ContentPanelTerms" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="PanelPaymentAndBilling" CssClass="checkoutBlock">
                        <opc:PaymentMethodSelector ID="PaymentView" runat="server" />
						<asp:Literal ID="LitAmazonPaymentWidget" runat="server" />
					</asp:Panel>
                    <asp:Panel runat="server" ID="PanelEmailOptIn" CssClass="checkoutBlock">
                        <asp:Panel runat="server" ID="EmailOptInHeader" CssClass="checkoutHeader">
                            <asp:Literal runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.115") %>' />   
                        </asp:Panel>
                        <asp:RadioButton GroupName="EmailOptIn" ID="EmailOptInYes" runat="server" Text=""
                            AutoPostBack="true" OnCheckedChanged="EmailOptInYes_CheckedChanged" />
							<asp:Literal ID="litEmailPrefYes" runat="server" />
                        <br />
                        <asp:RadioButton GroupName="EmailOptIn" ID="EmailOptInNo" runat="server" Text=""
                            AutoPostBack="true" OnCheckedChanged="EmailOptInNo_CheckedChanged" />
                            <asp:Literal ID="litEmailPrefNo" runat="server" />
                    </asp:Panel>
                    <asp:Panel runat="server" ID="PanelCreateAccount" CssClass="checkoutBlock">
                        <opc:CreateAccount ID="CreateAccountView" runat="server" />
                    </asp:Panel>
                    <asp:Panel runat="server" ID="PanelSubmit" CssClass="checkoutBlock">
                        <asp:Panel runat="server" ID="PanelCompleteCheckout" CssClass="checkoutHeader">
                            <asp:Literal Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.6") %>' runat="server" />
                        </asp:Panel>
						<asp:Panel runat="server" ID="PanelCompleteMoneybookersQuickCheckout" Visible="false">
                            <asp:Literal ID="Literal2" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.145") %>' runat="server" />
						</asp:Panel>
                        <center>
                            <asp:Button ID="SubmitOrder" runat="server" CssClass="PlaceOrderButton" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.133") %>'
                                OnClick="SubmitOrder_OnClick" /></center>
                    </asp:Panel>
                </div>
            </div>
            <div id="OPRightCol">
                <div class="onePageContents">
                    <div id="OPC_CustomerServiceWrap">
                        <opc:CustomerService ID="CustomerServicePanel" runat="server" />
                    </div>
                    <div id="OPC_BuySafeWrap" class="OPC_BuySafeWrap" runat="server">
                        <aspdnsf:BuySafeKicker ID="buySAFEKicker" WrapperClass="shoppingCartKicker" runat="server" />
                    </div>
                    <div class="checkoutHeader">
                        <asp:Literal Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.11") %>' runat="server" />
                    </div>
                    <div id="OPC_MiniCartWrap">
                        <asp:Panel runat="Server" ID="PanelMiniCart" CssClass="miniCart">
                            <opc:MiniCartControl ID="MiniCartView" runat="server" />
                        </asp:Panel>
                        <asp:Panel runat="Server" ID="PanelMiniCartSummary" CssClass="MiniCartSummary">
                            <opc:CartSummary ID="MiniCartCartSummary" runat="server" />
                        </asp:Panel>
                    </div>
                </div>
            </div>
            <div style="clear: both;">
            </div>
        </div>
        <script language="javascript" type="text/javascript">
        	Sys.Application.add_load(function ()
        	{
        		if (typeof (cbaAddressWidget) != "undefined")
        			cbaAddressWidget.render('CBAAddressWidgetContainer');

        		if (typeof (cbaWalletWidget) != "undefined")
        			cbaWalletWidget.render('CBAWalletWidgetContainer');

        		if (typeof (setTextBoxFocus) == "undefined")
        			return;

        		if (setTextBoxFocus == null)
        			return;

        		setTextBoxFocus();
        	});
        </script>
    </ContentTemplate>
</asp:UpdatePanel>
