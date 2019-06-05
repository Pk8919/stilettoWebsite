<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RequestAQuotePaymentForm.ascx.cs"
    Inherits="OPCControls_RequestAQuotePaymentForm" %>
<div class="paymentMethodContents">
	<asp:Label runat="server" ID="CheckPaymentMessage" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.59") %>' />
	<asp:Panel ID="PanelError" runat="server" Visible="false">
		<asp:Label ID="ErrorMessage" runat="server" CssClass="paymentError" />
	</asp:Panel>
</div>
