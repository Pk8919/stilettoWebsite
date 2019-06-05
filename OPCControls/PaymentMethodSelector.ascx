<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PaymentMethodSelector.ascx.cs" Inherits="VortxControls_PaymentMethodSelector" %>
<%@ Register Src="PaymentForms/PayPalPaymentForm.ascx" TagName="PayPalPaymentForm" TagPrefix="uc1" %>
<%@ Register Src="PaymentForms/CreditCardAndBillingAddress.ascx" TagName="CreditCardAndBillingAddress" TagPrefix="uc1" %>
<%@ Register Src="PaymentForms/CheckPaymentForm.ascx" TagName="CheckPaymentForm" TagPrefix="uc1" %>
<%@ Register Src="PaymentForms/PurchaseOrderPaymentForm.ascx" TagName="PurchaseOrderPaymentForm" TagPrefix="uc1" %>
<%@ Register Src="PaymentForms/PayPalExpressOPCPaymentForm.ascx" TagName="PayPalExpressOPCPaymentForm" TagPrefix="uc1" %>
<%@ Register Src="PaymentForms/RequestAQuotePaymentForm.ascx" TagName="RequestAQuoteForm" TagPrefix="uc1" %>
<%@ Register Src="PaymentForms/MicroPayPaymentForm.ascx" TagName="MicroPayPaymentForm" TagPrefix="uc1" %>
<%@ Register Src="PaymentForms/CodPaymentForm.ascx" TagName="CodPaymentForm" TagPrefix="uc1" %>
<%@ Register Src="PaymentForms/CheckOutByAmazonPaymentForm.ascx" TagName="CheckOutByAmazonPaymentForm" TagPrefix="uc1" %>
<%@ Register Src="PaymentForms/PayPalEmbeddedCheckoutPaymentForm.ascx" TagName="PayPalEmbeddedCheckoutForm" TagPrefix="uc1" %>
<%@ Register Src="PaymentForms/MoneybookersQuickCheckoutPaymentForm.ascx" TagName="MoneybookersQuickCheckoutPaymentForm" TagPrefix="uc1" %>
<%@ Register Src="PaymentForms/SecureNetPaymentForm.ascx" TagName="SecureNetPaymentForm" TagPrefix="uc1" %>

<asp:UpdatePanel runat="server" ID="UpdatePanelPaymentInfo" UpdateMode="Conditional" ChildrenAsTriggers="false">
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="RadioCreditCard" />
        <asp:AsyncPostBackTrigger ControlID="RadioPayPal" />
        <asp:AsyncPostBackTrigger ControlID="RadioCheckByMail" />
        <asp:AsyncPostBackTrigger ControlID="RadioPayPalExpress" />
        <asp:AsyncPostBackTrigger ControlID="RadioPurchaseOrder" />
        <asp:AsyncPostBackTrigger ControlID="RadioRequestQuote" />
        <asp:AsyncPostBackTrigger ControlID="RadioMicroPay" />
        <asp:AsyncPostBackTrigger ControlID="RadioCod" />
        <asp:AsyncPostBackTrigger ControlID="RadioCheckoutByAmazon" />
        <asp:AsyncPostBackTrigger ControlID="RadioPayPalEmbeddedCheckout" />
    </Triggers>
    <ContentTemplate>
        <asp:Panel ID="PanelError" runat="server" Visible="false" CssClass="errorBlock">
            <asp:Label ID="ErrorMessage" runat="server" CssClass="paymentError" />
        </asp:Panel>
        <div>
            <div>
                <asp:Label runat="server" ID="PaymentInfoHeader" CssClass="checkoutHeader">
                    <asp:Literal runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.114") %>' />
                </asp:Label>
            </div>
            <asp:Panel runat="server" ID="PanelPaymentMethods">
                <asp:Panel runat="server" ID="PanelCreditCardMethod" CssClass="PaymentMethod">
                    <asp:RadioButton runat="server" GroupName="PaymentMethod" ID="RadioCreditCard" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.103") %>'
                        OnCheckedChanged="RadioCreditCard_CheckedChanged" AutoPostBack="true" />
                    <span>
                        <asp:Image AlternateText="Visa" ImageUrl="~/OPCControls/images/VisaIcon.gif" ID="ImageCardTypeVisa"
                            runat="server" />
                        <asp:Image AlternateText="MasterCard" ImageUrl="~/OPCControls/images/MasterCardIcon.gif"
                            ID="ImageCardTypeMastercard" runat="server" />
                        <asp:Image AlternateText="Amex" ImageUrl="~/OPCControls/images/AmexIcon.gif" ID="ImageCardTypeAmex"
                            runat="server" />
                        <asp:Image AlternateText="Discover" ImageUrl="~/OPCControls/images/DiscoverIcon.gif"
                            ID="ImageCardTypeDiscover" runat="server" />
                        <asp:Image AlternateText="Solo" ImageUrl="~/OPCControls/images/SoloIcon.gif" ID="ImageCardTypeSolo"
                            runat="server" />
                        <asp:Image AlternateText="Maestro" ImageUrl="~/OPCControls/images/MaestroIcon.gif"
                            ID="ImageCardTypeMaestro" runat="server" />
                    </span>
					<uc1:SecureNetPaymentForm ID="SecureNetPaymentView" runat="server" Visible="false" />
                    <uc1:CreditCardAndBillingAddress ID="CreditCardPaymentViewForm" runat="server" Visible="false" />
                </asp:Panel>
                <asp:Panel runat="server" ID="PanelPayPalMethod" CssClass="PaymentMethod">
                    <asp:RadioButton runat="server" GroupName="PaymentMethod" ID="RadioPayPal" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.111") %>'
                        OnCheckedChanged="RadioPayPal_CheckedChanged" AutoPostBack="true" />
                    <img src="OPCControls/images/PayPalIcon.gif" alt="PayPal" />
                    <%--paypal panel goes here--%>
                    <uc1:PayPalPaymentForm ID="PayPalPaymentView" runat="server" Visible="false" />
                </asp:Panel>
                <asp:Panel runat="server" ID="PanelCheckMoneyOrderMethod" CssClass="PaymentMethod">
                    <asp:RadioButton runat="server" GroupName="PaymentMethod" ID="RadioCheckByMail" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.104") %>'
                        OnCheckedChanged="RadioCheckByMail_CheckedChanged" AutoPostBack="true" />
                    <%--check panel goes here--%>
                    <uc1:CheckPaymentForm ID="CheckPaymentView" runat="server" Visible="false" />
                </asp:Panel>
                <asp:Panel runat="server" ID="PanelPurchaseOrderMethod" CssClass="PaymentMethod">
                    <asp:RadioButton runat="server" GroupName="PaymentMethod" ID="RadioPurchaseOrder"
                        Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.105") %>' OnCheckedChanged="RadioPurchaseOrder_CheckedChanged" AutoPostBack="true" />
                    <uc1:PurchaseOrderPaymentForm ID="PurchaseOrderPaymentView" runat="server" Visible="false" />
                </asp:Panel>
                <asp:Panel runat="server" ID="PanelRequestQuote" CssClass="PaymentMethod">
                    <asp:RadioButton runat="server" GroupName="PaymentMethod" ID="RadioRequestQuote"
                        Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.106") %>' OnCheckedChanged="RadioRequestQuote_CheckedChanged" AutoPostBack="true" />
                    <%--quote panel goes here--%>
                    <uc1:RequestAQuoteForm ID="RequestQuoteView" runat="server" Visible="false" />
                </asp:Panel>
                <asp:Panel runat="server" ID="PanelPaypalExpressMethod" CssClass="PaymentMethod">
                    <asp:RadioButton runat="server" GroupName="PaymentMethod" ID="RadioPayPalExpress"
                        Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.107") %>' OnCheckedChanged="RadioPayPalExpress_CheckedChanged" AutoPostBack="true" />
                    <img src="OPCControls/images/PayPalIcon.gif" alt="PayPal" />
                    <%--paypal express panel --%>
                    <uc1:PayPalExpressOPCPaymentForm ID="PayPalExpressView" runat="server" Visible="false" />
                </asp:Panel>
                <asp:Panel runat="server" ID="PanelMicroPayMethod" CssClass="PaymentMethod">
                    <asp:RadioButton runat="server" GroupName="PaymentMethod" ID="RadioMicroPay" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.108") %>'
                        OnCheckedChanged="RadioMicroPay_CheckedChanged" AutoPostBack="true" />
                    <uc1:MicroPayPaymentForm ID="MicroPayPaymentView" runat="server" Visible="false" />
                </asp:Panel>
                <asp:Panel runat="server" ID="PanelCodMethod" CssClass="PaymentMethod">
                    <asp:RadioButton runat="server" GroupName="PaymentMethod" ID="RadioCod" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.109") %>'
                        OnCheckedChanged="RadioCod_CheckedChanged" AutoPostBack="true" />
                    <uc1:CodPaymentForm ID="CodPaymentView" runat="server" Visible="false" />
                </asp:Panel>
                 <asp:Panel runat="server" ID="PanelCheckoutByAmazon" CssClass="PaymentMethod">
                    <asp:RadioButton runat="server" GroupName="PaymentMethod" ID="RadioCheckoutByAmazon" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.110") %>'
                        OnCheckedChanged="RadioCheckOutByAmazon_CheckedChanged" AutoPostBack="true" />
                    <uc1:CheckOutByAmazonPaymentForm ID="CheckOutByAmazonPaymentView" runat="server" Visible="false" />
                </asp:Panel>
                 <asp:Panel runat="server" ID="PanelPayPalEmbeddedCheckout" CssClass="PaymentMethod">
                    <asp:RadioButton runat="server" GroupName="PaymentMethod" ID="RadioPayPalEmbeddedCheckout" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.152") %>'
                        OnCheckedChanged="RadioPayPalEmbeddedCheckout_CheckedChanged" AutoPostBack="true" />
                    <uc1:PayPalEmbeddedCheckoutForm ID="PayPalEmbeddedCheckoutPaymentView" runat="server" Visible="false" />
                </asp:Panel>
				<asp:Panel runat="server" ID="PanelMoneybookersQuickCheckout" CssClass="PaymentMethod">
					<asp:RadioButton runat="server" GroupName="PaymentMethod" ID="RadioMoneybookersQuickCheckout" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.141") %>' 
						OnCheckedChanged="RadioMoneybookersQuickCheckout_CheckedChanged" AutoPostBack="true" />
						<uc1:MoneybookersQuickCheckoutPaymentForm ID="MoneybookersQuickCheckoutPaymentView" runat="server" Visible="false" />
				</asp:Panel>
            </asp:Panel>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
