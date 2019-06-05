<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MoneybookersQuickCheckoutPaymentForm.ascx.cs" Inherits="OPCControls_MoneybookersQuickCheckoutPaymentForm" %>
<div class="paymentMethodContents">
	<p runat="server" id="Instructions" class="moneybookersQuickCheckoutInstructions">
		<%# StringResourceProvider.GetString("smartcheckout.aspx.142") %>
	</p>
	<asp:Panel ID="PanelError" runat="server" Visible="false">
		<asp:Label ID="ErrorMessage" runat="server" CssClass="paymentError" />
	</asp:Panel>
	<iframe runat="server" id="ExternalPaymentMethodFrame" style="height: 500px; width: 100%;" class="moneybookersQuickCheckoutFrame" />
</div>
