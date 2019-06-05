<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LoginPanel.ascx.cs" Inherits="LoginPanel" %>
<asp:UpdatePanel runat="server" ID="UpdatePanelLogin" RenderMode="Block" UpdateMode="Conditional"
    ChildrenAsTriggers="true">
    <Triggers>
        <asp:PostBackTrigger ControlID="btnPasswordSubmit" />
    </Triggers>
    <ContentTemplate>
        <asp:Panel runat="server" ID="PanelLoginWrap">
            <asp:Panel ID="PanelUsername" runat="server">
                <table class="LoginLayoutTable" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="LoginHeaderCell" cellpadding="0" cellspacing="0">
                            <asp:Label runat="server" ID="lblEmailAddressHeader" CssClass="checkoutHeader">
                            <asp:Literal runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.80") %>' />
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtEmailAddress" CssClass="OPLoginTextBox" ValidationGroup="VGAccount" TabIndex="1" />
                            <asp:RequiredFieldValidator runat="server" ID="RFVEmailAddress" ControlToValidate="txtEmailAddress"
                                ErrorMessage='<%# StringResourceProvider.GetString("smartcheckout.aspx.81") %>' Display="Dynamic"
                                EnableClientScript="true" ValidationGroup="VGAccount" Text="*" Enabled="true" />
                            <asp:RegularExpressionValidator runat="server" ID="REEmailAddress" ControlToValidate="txtEmailAddress"
                                ErrorMessage='<%# StringResourceProvider.GetString("smartcheckout.aspx.82") %>' Display="Dynamic"
                                EnableClientScript="true" ValidationGroup="VGAccount" Text="*" Enabled="true"
                                ValidationExpression="^[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$" />
                             <br /><asp:LinkButton runat="server" ID="linkSwitchUser" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.84") %>' OnClick="linkSwitchUser_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <asp:Label ID="EmailHelperText" runat="server" CssClass="OPEmphasize">
                                <asp:Literal runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.83") %>' />
                            </asp:Label>
                        </td>
                    </tr>
                </table>
                <div class="nextStepWrap">
                    <asp:Button runat="server" ID="btnEmailSubmit" CssClass="OPButton" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.85") %>' OnClick="btnEmailSubmit_Click"
                        ValidationGroup="VGAccount" TabIndex="2" />
                </div>
            </asp:Panel>
            <asp:Panel ID="PanelPassword" runat="server">
                <table class="LoginLayoutTable" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="LoginHeaderCell">
                            <asp:Label CssClass="checkoutHeader" ID="lblPassword" runat="server">
                			<asp:Literal runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.86") %>' />
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="OPLoginTextBox"
                                ValidationGroup="VGAccount" TabIndex="2" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <asp:LinkButton ID="ButtonForgotPassword" runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.87") %>'
                                OnClick="ButtonForgotPassword_Click" />
                        </td>
                    </tr>
                </table>
                <div class="nextStepWrap">
                    <asp:Panel CssClass="ErrorBox" ID="LostPasswordResults" runat="server" Visible="false">
                        <asp:Label ID="LabelForgotPasswordResults" runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.88") %>' Visible="false" />
                    </asp:Panel>
                    <asp:Button runat="server" ID="btnPasswordSubmit" CssClass="OPButton" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.138") %>' OnClick="btnPasswordSubmit_Click"
                        ValidationGroup="VGAccount" TabIndex="3" />
                    <div style="clear: both;">
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="PanelCreateNewPassword" runat="server" Visible="false">
                <table class="LoginLayoutTable" cellpadding="4" cellspacing="0">
                    <tr>
                        <td colspan="2" class="checkoutHeader">
                            <div style="font-weight: bold; font-size: 0.8em;"><asp:Label ID="LabelCreateNewPasswordFirstName" runat="server" />
                                <asp:Literal runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.89") %>' />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">                            
                			<asp:Literal runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.90") %>' />
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="TextBoxNewPassword1" TextMode="Password" CssClass="OPLoginTextBox"
                                ValidationGroup="VGCreateNewPassword" />
                            <asp:RequiredFieldValidator runat="server" ID="RFVCreateNewPassword" ControlToValidate="TextBoxNewPassword1"
                                ErrorMessage='<%# StringResourceProvider.GetString("smartcheckout.aspx.74") %>' Display="Dynamic" EnableClientScript="true"
                                ValidationGroup="VGCreateNewPassword" Text="*" Enabled="true" />
                            <asp:RegularExpressionValidator ID="valPasswordMinLength" runat="server" ControlToValidate="TextBoxNewPassword1"
                                Display="Dynamic" EnableClientScript="true" Text="*" ValidationGroup="VGCreateNewPassword"
                                ErrorMessage='<%# StringResourceProvider.GetString("smartcheckout.aspx.75") %>' ValidationExpression=".{5}.*" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                			Re-enter Password:
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="TextBoxNewPassword2" TextMode="Password" CssClass="OPLoginTextBox"
                                ValidationGroup="VGCreateNewPassword" />
                            <asp:RequiredFieldValidator runat="server" ID="RFVCreateNewPasswordConfirm" ControlToValidate="TextBoxNewPassword2"
                                ErrorMessage='<%# StringResourceProvider.GetString("smartcheckout.aspx.78") %>' Display="Dynamic" EnableClientScript="true"
                                ValidationGroup="VGCreateNewPassword" Text="*" Enabled="true" />
                            <asp:CompareValidator ID="CompareValidatorCreateAccountPassword" runat="server" ErrorMessage='<%# StringResourceProvider.GetString("smartcheckout.aspx.79") %>'
                                Text="*" ControlToValidate="TextBoxNewPassword2" ControlToCompare="TextBoxNewPassword1"
                                Display="Dynamic" EnableClientScript="true" ValidationGroup="VGCreateNewPassword"></asp:CompareValidator>
                        </td>
                    </tr>
                </table>
                <div class="nextStepWrap">
                    <asp:ValidationSummary ID="ValidationSummaryCreateNewPassword" runat="server" EnableClientScript="true"
                        DisplayMode="List" ValidationGroup="VGCreateNewPassword" CssClass="ErrorBox" />
                    <asp:Panel CssClass="ErrorBox" ID="PanelCreateNewPasswordResults" runat="server" Visible="false">
                        <asp:Label ID="LabelCreateNewPasswordResults" runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.91") %>' Visible="false" />
                    </asp:Panel>
                    <asp:Button runat="server" ID="ButtonCreateNewPassword" CssClass="OPButton" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.92") %>'
                        OnClick="ButtonCreateNewPassword_Click" ValidationGroup="VGCreateNewPassword" />
                    <div style="clear: both;">
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="PanelError" runat="server" CssClass="ErrorBox" Visible="true">
                <asp:Label runat="server" ID="lblError" />
            </asp:Panel>
            <asp:Panel ID="PanelNoAccount" runat="server" CssClass="NoAccountMessage" Visible="false">
                <asp:Label runat="server" ID="lblNoAccount" CssClass="OPEmphasize">
                    <asp:Literal runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.93") %>' />
                </asp:Label>
            </asp:Panel>
            <asp:ValidationSummary ID="VSAccount" runat="server" EnableClientScript="true" DisplayMode="List"
                ValidationGroup="VGAccount" CssClass="ErrorBox" />
            <div style="clear: both;">
            </div>
        </asp:Panel>
    </ContentTemplate>
</asp:UpdatePanel>
