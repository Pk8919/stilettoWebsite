<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CreditCardEditor.ascx.cs"
    Inherits="CIM_CreditCardEditor" %>
<table>
    <tr>
        <td>
            <asp:Label Text="<%$ Tokens:StringResource, account.aspx.93%>" runat="server" ID="LabelCreditCard" ValidationGroup="CIMCCEditor" />
        </td>
        <td>
            <asp:TextBox ID="TextCreditCard" runat="server" />
            <asp:RequiredFieldValidator ValidationGroup="CIMCCEditor" ID="RFCreditCardNumber"
                runat="server" ControlToValidate="TextCreditCard" Text="*" Display="Dynamic"
                EnableClientScript="false" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label Text="<%$ Tokens:StringResource, account.aspx.94%>" runat="server" ID="LabelExpDate" />
        </td>
        <td>
            <asp:DropDownList ValidationGroup="CIMCCEditor" ID="ExpirationMonth" runat="server">
                <asp:ListItem Text="<%$ Tokens:StringResource, account.aspx.95%>" />
            </asp:DropDownList>
            <asp:RequiredFieldValidator ValidationGroup="CIMCCEditor" ID="RFMonth" runat="server"
                ControlToValidate="ExpirationMonth" InitialValue="--" Text="*" Display="Dynamic"
                EnableClientScript="false" />
            &nbsp;/&nbsp;<asp:DropDownList ID="ExpirationYear" runat="server" />
            <asp:RequiredFieldValidator ValidationGroup="CIMCCEditor" ID="RFYear" runat="server"
                ControlToValidate="ExpirationYear" InitialValue="--" Text="*" Display="Dynamic"
                EnableClientScript="false" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label Text="<%$ Tokens:StringResource, account.aspx.96%>" runat="server" ID="LabelCardSecurityCode" />
        </td>
        <td>
            <asp:TextBox ID="TextCardSecurity" ValidationGroup="CIMCCEditor" runat="server" Width="28px" />
            <asp:RequiredFieldValidator ValidationGroup="CIMCCEditor" ID="RFCCSecurity" runat="server"
                ControlToValidate="TextCardSecurity" Text="*" Display="Dynamic" EnableClientScript="false" />
            <a id="aCardCodeToolTip" href="javascript:void(0);" style="cursor: normal;">
				<asp:Literal runat="server" Text="<%$ Tokens:StringResource, address.cs.50%>" />
			</a>                     
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label Text="<%$ Tokens:StringResource, account.aspx.97%>" runat="server" ID="LabelBillingAddress" />
        </td>
        <td>
            <asp:DropDownList ID="BillingAddresses" runat="server" ValidationGroup="CIMCCEditor"
                AppendDataBoundItems="true">
                <asp:ListItem Text="<%$ Tokens:StringResource, account.aspx.98%>" Value="--" />
            </asp:DropDownList>
        </td>
    </tr>
    <tr style="display: none">
        <td colspan="2">
            <asp:CheckBox runat="server" ValidationGroup="CIMCCEditor" ID="CBMakePrimaryCard"
                Text="<%$ Tokens:StringResource, account.aspx.99%>" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Button runat="server" ValidationGroup="CIMCCEditor" ID="ButtonSave" Text="<%$ Tokens:StringResource, account.aspx.100%>"
                OnClick="ButtonSave_Click" UseSubmitBehavior="false" CssClass="walletButton" />&nbsp;
            <asp:Button runat="server" CausesValidation="false" ID="ButtonCancel" Text="<%$ Tokens:StringResource, account.aspx.101%>"
                OnClick="ButtonCancel_Click" CssClass="walletButton" />
        </td>
    </tr>
</table>
<asp:Panel ID="PanelError" runat="server">
    <asp:Label ID="ErrorMessage" runat="server" />
</asp:Panel>
