<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MicroPayPaymentForm.ascx.cs"
    Inherits="OPCControls_MicroPayPaymentForm" %>
<div class="paymentMethodContents">
	<asp:Label runat="server" ID="PaymentMessage" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.53") %>' />
	<asp:Panel ID="PanelError" runat="server" Visible="false">
		<asp:Label ID="ErrorMessage" runat="server" CssClass="paymentError" />
	</asp:Panel>
</div>
