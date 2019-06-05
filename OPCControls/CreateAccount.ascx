<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CreateAccount.ascx.cs" Inherits="VortxControls_CreateAccount" %>
<asp:UpdatePanel ID="UpdatePanelCreateAccount" runat="server" UpdateMode="Conditional"
    ChildrenAsTriggers="false">
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="RadioCreateAccountYes" />
        <asp:AsyncPostBackTrigger ControlID="RadioCreateAccountNo" />
        <asp:AsyncPostBackTrigger ControlID="CreateAccountPasswordConfirm" />
    </Triggers>
    <ContentTemplate>
        <asp:Label ID="CreateAccountHeader" CssClass="checkoutHeader" runat="server">
            <asp:Literal runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.68") %>' />
        </asp:Label>
        <asp:Label ID="LabelOptional" runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.69") %>' />   
        <div>
            <asp:RadioButton runat="server" ID="RadioCreateAccountYes" GroupName="RadioCreateAccount"
                OnCheckedChanged="RadioCreateAccount_CheckedChanged" AutoPostBack="true" ValidationGroup="VGCreateAccount" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.70") %>' />
        </div>
        <div>
            <asp:RadioButton runat="server" ID="RadioCreateAccountNo" GroupName="RadioCreateAccount"
                OnCheckedChanged="RadioCreateAccount_CheckedChanged" AutoPostBack="true" ValidationGroup="VGCreateAccount" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.71") %>' />
            <asp:CustomValidator OnServerValidate="CustomValidatorCreateAccount_ServerValidate"
                ID="CustomValidatorCreateAccount" runat="server" ErrorMessage='<%# StringResourceProvider.GetString("smartcheckout.aspx.72") %>'
                Text="*" ValidateEmptyText="true"
                Display="Dynamic" EnableClientScript="false" ValidationGroup="VGCreateAccount" />
        </div>
        <asp:Panel runat="server" ID="PanelCreateAccount" CssClass="subSection">
            <table cellpadding="0" cellspacing="0" id="createAccountTable">
                <tr>
                    <td class="fieldLabel">
                        <asp:Label runat="server" ID="LabelCreateAccountPasswordPrompt" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.73") %>' />
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="CreateAccountPassword" TextMode="Password" />
                        <asp:RequiredFieldValidator runat="server" ID="RequiredCreateAccountPassword" ControlToValidate="CreateAccountPassword"
                            ErrorMessage='<%# StringResourceProvider.GetString("smartcheckout.aspx.74") %>' Display="Dynamic" EnableClientScript="true"
                            ValidationGroup="VGCreateAccount" Text="*" Enabled="true" />
                        <asp:RegularExpressionValidator ID="valPasswordMinLength" runat="server" ControlToValidate="CreateAccountPassword"
                            Display="Dynamic" EnableClientScript="true" Text="*" ValidationGroup="VGCreateAccount"
                            ErrorMessage='<%# StringResourceProvider.GetString("smartcheckout.aspx.75") %>' ValidationExpression=".{5}.*" />
                    </td>
                    <td>
                        <asp:Label runat="server" ID="LabelCreateAccountRequirements" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.76") %>'
                            CssClass="OPEmphasize" />
                    </td>
                </tr>
                <tr>
                    <td class="fieldLabel">
                        <asp:Label runat="server" ID="LabelCreateAccountConfirmPrompt" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.77") %>'
                            TextMode="Password" />
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="CreateAccountPasswordConfirm" TextMode="Password" OnTextChanged="CreateAccountPasswordConfirm_OnTextChanged" />
                        <asp:RequiredFieldValidator runat="server" ID="RFVCreateAccountPasswordConfirm" ControlToValidate="CreateAccountPasswordConfirm"
                            ErrorMessage='<%# StringResourceProvider.GetString("smartcheckout.aspx.78") %>' Display="Dynamic" EnableClientScript="true"
                            ValidationGroup="VGCreateAccount" Text="*" Enabled="true" SetFocusOnError="true" />
                        <asp:CompareValidator ID="CompareValidatorCreateAccountPassword" runat="server" ErrorMessage='<%# StringResourceProvider.GetString("smartcheckout.aspx.79") %>'
                            Text="*" ControlToValidate="CreateAccountPasswordConfirm" ControlToCompare="CreateAccountPassword"
                            Display="Dynamic" EnableClientScript="true" ValidationGroup="VGCreateAccount" SetFocusOnError="true"></asp:CompareValidator>
                    </td>
                </tr>
              
            </table>
            <asp:ValidationSummary ID="VSCreateAccount" runat="server" EnableClientScript="true"
                DisplayMode="List" ValidationGroup="VGCreateAccount" />
            <asp:Panel ID="PanelError" runat="server">
                <asp:Label runat="server" ID="LabelError" />
            </asp:Panel>
         
			<asp:Panel runat="server" id="CreateAccountPanel" Visible="false" CssClass="createAccountPanel">
				<asp:Button runat="server" ID="CreateAccountButton" OnClick="CreateAccountButton_Click" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.146") %>' />
			</asp:Panel>
        </asp:Panel>
    </ContentTemplate>
</asp:UpdatePanel>
