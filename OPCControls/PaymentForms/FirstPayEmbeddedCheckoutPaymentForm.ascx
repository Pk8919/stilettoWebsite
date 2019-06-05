<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FirstPayEmbeddedCheckoutPaymentForm.ascx.cs" Inherits="OPCControls_PaymentForms_FirstPayEmbeddedCheckoutPaymentForm" %>
<div class="paymentMethodContents">
	<asp:Panel ID="PanelError" runat="server" Visible="false"  CssClass="paymentError">
		<asp:Label ID="ErrorMessage" runat="server" CssClass="paymentError errorBlock" />
	</asp:Panel>
    <asp:Literal ID="litFirstPayEmbeddedCheckoutFrame" runat="server" />
</div>
