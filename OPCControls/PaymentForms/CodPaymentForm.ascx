<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CodPaymentForm.ascx.cs"
	Inherits="OPCControls_CodPaymentForm" %>
<div class="paymentMethodContents">
	<asp:Label runat="server" ID="CheckPaymentMessage" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.42") %>' />
	<asp:Panel ID="PanelError" runat="server" Visible="false">
		<asp:Label ID="ErrorMessage" runat="server" CssClass="paymentError" />
	</asp:Panel>
</div>
