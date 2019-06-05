<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PurchaseOrderPaymentForm.ascx.cs"
    Inherits="OPCControls_PurchaseOrderPaymentForm" %>
<div class="paymentMethodContents">
    <div id="poInstructions">
            <asp:Literal runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.56") %>' />
    </div>
        <br />
            <asp:Literal runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.57") %>' />
    
    <asp:TextBox runat="server" ID="TextBoxPONumber" MaxLength="50" />
    <asp:RequiredFieldValidator runat="server" ID="RequiredTextBoxPONumber" ControlToValidate="TextBoxPONumber"
        ErrorMessage='<%# StringResourceProvider.GetString("smartcheckout.aspx.58") %>' Display="Dynamic" EnableClientScript="true"
        ValidationGroup="VGPOPayment" Text="*" Enabled="true" />
    <asp:ValidationSummary CssClass="errorBlock" ID="VSPOPayment" runat="server" EnableClientScript="true"
        DisplayMode="List" ValidationGroup="VGPOPayment" />
    <asp:Panel ID="PanelError" runat="server" Visible="false">
        <asp:Label ID="ErrorMessage" runat="server" CssClass="paymentError" />
    </asp:Panel>
    <asp:Button CssClass="OPButton" ID="ButtonPONext" runat="server" Visible="true" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.121") %>'
        OnClick="ButtonPONext_Click" />
</div>
