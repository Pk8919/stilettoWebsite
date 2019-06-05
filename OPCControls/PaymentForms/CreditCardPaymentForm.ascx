<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CreditCardPaymentForm.ascx.cs" Inherits="OPCControls_CreditCardPaymentForm" %>
<asp:UpdatePanel UpdateMode="Conditional" ChildrenAsTriggers="false" ID="UpdatePanelCreditCard"
    runat="server">
    <ContentTemplate>       
        <asp:ValidationSummary CssClass="errorBlock" ID="VSCreditCardPayment" runat="server" EnableClientScript="true" DisplayMode="List" ValidationGroup="VGCreditCardPayment" />
        <asp:Panel ID="PanelError" CssClass="errorBlock" runat="server" Visible="false">
            <asp:Label ID="ErrorMessage" runat="server" CssClass="paymentError" />
        </asp:Panel> 
        <asp:Panel ID="PanelCreditDetails" runat="server" DefaultButton="ButtonSaveCreditCardPaymentForm">
	        <table id="CCDetailsTable" cellspacing="0" cellpadding="0">
	            <tr>
	                <td class="paymentFormLabel">
	                    <asp:Label runat="server" ID="LabelCCNameOnCardLabel" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.44") %>' />
	                </td>
	                <td>
	                    <asp:TextBox runat="server" ID="CCNameOnCard" CssClass="CCWideTextBox" MaxLength="100" />
	                    <asp:RequiredFieldValidator runat="server" ID="RequiredCCNameOnCard" ControlToValidate="CCNameOnCard"
	                        ErrorMessage='<%# StringResourceProvider.GetString("smartcheckout.aspx.45") %>' Display="Dynamic" EnableClientScript="true"
	                        ValidationGroup="VGCreditCardPayment" Text="*" Enabled="true" />
	                </td>
	            </tr>
	            <tr>
	                <td class="paymentFormLabel">
	                    <asp:Label runat="server" ID="LabelCCNumber" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.46") %>' />
	                </td>
	                <td>
	                    <asp:TextBox runat="server" ID="CCNumber" CssClass="CCWideTextBox" MaxLength="16" />
	                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidatorCCNumber" ControlToValidate="CCNumber"
	                        ErrorMessage='<%# StringResourceProvider.GetString("smartcheckout.aspx.47") %>' Display="Dynamic" EnableClientScript="true"
	                        ValidationGroup="VGCreditCardPayment" Text="*" Enabled="true" />
	                    <asp:HiddenField runat="server" ID="HFCreditCardType" />
	                    <span id="CreditCardIconsWrap">
	                            <asp:Image AlternateText="Visa" ImageUrl="~/OPCControls/images/VisaIcon.gif" ID="ImageCardTypeVisa" runat="server" />
	                            <asp:Image AlternateText="MasterCard" ImageUrl="~/OPCControls/images/MasterCardIcon.gif" ID="ImageCardTypeMastercard" runat="server" />
	                            <asp:Image AlternateText="Amex" ImageUrl="~/OPCControls/images/AmexIcon.gif" ID="ImageCardTypeAmex" runat="server" />
	                            <asp:Image AlternateText="Discover" ImageUrl="~/OPCControls/images/DiscoverIcon.gif" ID="ImageCardTypeDiscover" runat="server" />
	                            <asp:Image AlternateText="Solo" ImageUrl="~/OPCControls/images/SoloIcon.gif" ID="ImageCardTypeSolo" runat="server" />
	                            <asp:Image AlternateText="Maestro" ImageUrl="~/OPCControls/images/MaestroIcon.gif" ID="ImageCardTypeMaestro" runat="server" />
	                    </span>
	                </td>
	            </tr>
	            <tr>
	                <td class="paymentFormLabel">
	                    <asp:Label runat="server" ID="LabelCCExpiresLabel" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.48") %>' />
	                </td>
	                <td>
	                    <asp:DropDownList runat="server" ID="CCExpiresMonth">
	                    </asp:DropDownList>
	                    <asp:DropDownList runat="server" ID="CCExpiresYear">
	                    </asp:DropDownList>
	                </td>
	            </tr>
	            <tr runat="server" id="CCIssueNumberRow">
	                <td class="paymentFormLabel">
	                    <asp:Label runat="server" ID="LabelCCIssueNumber" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.49") %>' />
	                    <br />
	                        <asp:Label CssClass="LabelCCIssueNumberApplicable" runat="server" ID="LabelCCIssueNumberApplicable" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.50") %>' />
	                </td>
	                <td>
	                        <asp:TextBox runat="server" Columns="4" ID="CCIssueNumber" />
	                </td>
	            </tr>
	            <tr>
	                <td class="paymentFormLabel">
	                    <asp:Label runat="server" ID="LabelCCSecurityCode" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.51") %>' />
	                </td>
	                <td>
	                    <asp:TextBox runat="server" Columns="4" ID="CCSecurityCode" MaxLength="4" />
	                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidatorCCSecurityCode"
	                        ControlToValidate="CCSecurityCode" ErrorMessage='<%# StringResourceProvider.GetString("smartcheckout.aspx.52") %>'
	                        ValidationGroup="VGCreditCardPayment" Text="*" />
	                </td>
	            </tr>
	            <tr runat="server" id="RowSaveToWallet">
	                <td class="paymentFormLabel">
	                    <asp:Label runat="server" ID="LabelSaveToWallet" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.151") %>' />
	                </td>
	                <td>
	                    <asp:CheckBox runat="server" ID="CBSaveToAccount" ValidationGroup="VGCreditCardPayment" TextAlign="Right" />
	                </td>
	            </tr>
	        </table>
	        <div class="OPButtonWrap">
	                <asp:Button ID="ButtonSaveCreditCardPaymentForm" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.120") %>' runat="server" OnClick="SaveCreditCardPaymentForm_Click" CssClass="OPButton" />
	                <br style="clear: both;" />
	        </div>
        </asp:Panel>
    </ContentTemplate>
</asp:UpdatePanel>
