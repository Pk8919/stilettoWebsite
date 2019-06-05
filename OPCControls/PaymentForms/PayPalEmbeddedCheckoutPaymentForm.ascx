<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PayPalEmbeddedCheckoutPaymentForm.ascx.cs"
    Inherits="OPCControls_PaymentForms_PayPalEmbeddedCheckoutPaymentForm" %>
<div class="paymentMethodContents">
	<asp:Panel ID="PanelError" runat="server" Visible="false" CssClass="paymentError">
		<asp:Label ID="ErrorMessage" runat="server" CssClass="errorBlock" />
	</asp:Panel>
    <asp:Literal ID="litPayPalEmbeddedCheckoutFrame" runat="server" />
</div>
