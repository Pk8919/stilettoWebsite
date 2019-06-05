<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Signin.ascx.cs" Inherits="AspDotNetStorefront.Signin" %>

<asp:Panel ID="pnlLogin" runat="server">
    <asp:Panel ID="ErrorPanel" runat="server" Visible="False" HorizontalAlign="Left">
        <asp:Label CssClass="errorLg" ID="ErrorMsgLabel" runat="server"></asp:Label>
    </asp:Panel>
    <asp:Panel ID="CheckoutPanel" runat="server">
        <div id="CheckoutSequence" align="center">
            <asp:ImageMap ID="CheckoutMap" runat="server" ImageUrl="(!~/App_Themes/skin_(!SKINID!)/images/step_2.gif!)">
                <asp:RectangleHotSpot Bottom="54" HotSpotMode="Navigate" NavigateUrl="~/shoppingcart.aspx?resetlinkback=1&amp;checkout=true"
                    Right="87" />
            </asp:ImageMap>
        </div>
    </asp:Panel>
    <asp:Login ID="ctrlLogin" runat="server" OnLoggingIn="ctrlLogin_LoggingIn" EnableViewState="true">
        <LayoutTemplate>
            <div align="center">
                <asp:Panel ID="FormPanel" runat="server" Width="100%">
                    <div align="center" style="text-align: center">
                    <asp:Literal ID="ltlSigninHeader" runat="server" Text="<%$ Tokens:Topic, SigninPageHeader %>" />
                        <p align="left">
                            <b>
                                <asp:Label ID="Label11" runat="server" Text='<%$ Tokens:StringResource,signin.aspx.6 %>'></asp:Label>&nbsp;&nbsp;(<asp:HyperLink
                                    ID="SignUpLink" runat="server" Text='<%$ Tokens:StringResource,signin.aspx.7 %>'></asp:HyperLink>)</b></p>
                        <table width="100%">
                            <tbody>
                                <tr valign="top">
                                    <td class="MediumCell" align="left" width="90%">
                                        &nbsp;<b><asp:Label ID="Label5" runat="server" Text='<%$ Tokens:StringResource,signin.aspx.8 %>'></asp:Label></b>
                                    </td>
                                </tr>
                                <tr class="MediumCell" valign="top">
                                    <td class="LightCell" align="left" width="90%">
                                        <table cellspacing="5" cellpadding="0" width="100%" border="0">
                                            <tbody>
                                                <tr valign="baseline">
                                                    <td colspan="2">
                                                        <b><font class="LightCellText">
                                                            <asp:Label ID="Label4" runat="server" Text='<%$ Tokens:StringResource,signin.aspx.9 %>'></asp:Label>
                                                        </font></b>
                                                    </td>
                                                </tr>
                                                <tr valign="baseline">
                                                    <td valign="middle" align="right">
                                                        <font class="LightCellText">
                                                            <asp:Label ID="Label3" runat="server" Text='<%$ Tokens:StringResource,signin.aspx.10 %>'></asp:Label></font>
                                                    </td>
                                                    <td valign="middle" align="left">
                                                        <asp:TextBox ID="UserName" runat="server" ValidationGroup="Group1" Columns="30" MaxLength="100"
                                                            CausesValidation="True" AutoCompleteType="Email"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="Group1"
                                                            ErrorMessage='<%$ Tokens:StringResource,signin.aspx.3 %>' ControlToValidate="UserName"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="middle" align="right">
                                                        <font class="LightCellText">
                                                            <asp:Label ID="Label2" runat="server" Text='<%$ Tokens:StringResource,signin.aspx.12 %>'></asp:Label></font>
                                                    </td>
                                                    <td valign="middle" align="left">
                                                        <asp:TextBox ID="Password" runat="server" ValidationGroup="Group1" Columns="30" MaxLength="50"
                                                            CausesValidation="True" TextMode="Password"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="Group1"
                                                            ErrorMessage='<%$ Tokens:StringResource,signin.aspx.4 %>' ControlToValidate="Password"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr valign="baseline">
                                                    <td valign="middle" align="right">
                                                        <font class="LightCellText">
                                                            <asp:Label ID="Label1" runat="server" Text='<%$ Tokens:StringResource,signin.aspx.21 %>'
                                                                Visible="False"></asp:Label></font>
                                                    </td>
                                                    <td valign="middle" align="left">
                                                        <asp:TextBox ID="SecurityCode" runat="server" Visible="False" ValidationGroup="Group1"
                                                            CausesValidation="True" Width="73px" EnableViewState="False"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="SecurityCode"
                                                            ErrorMessage='<%$ Tokens:StringResource,signin.aspx.20 %>' ValidationGroup="Group1"
                                                            Enabled="False"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr valign="baseline">
                                                    <td valign="middle" align="center" colspan="2">
                                                        <asp:Image ID="SecurityImage" runat="server" Visible="False"></asp:Image>
                                                    </td>
                                                </tr>
                                                <tr valign="baseline">
                                                    <td valign="middle" align="right">
                                                        <font class="LightCellText">
                                                            <asp:Label ID="Label7" runat="server" Text='<%$ Tokens:StringResource,signin.aspx.13 %>'></asp:Label></font>
                                                    </td>
                                                    <td valign="middle" align="left">
                                                        <asp:CheckBox ID="RememberMe" runat="server"></asp:CheckBox>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr valign="top">
                                    <td align="left" width="90%">
                                        <p align="right">
                                            <asp:Button ID="LoginButton" CommandName="Login" runat="server" Text='<%$ Tokens:StringResource,signin.aspx.19 %>'
                                                ValidationGroup="Group1"></asp:Button>
                                        </p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </asp:Panel>
                <asp:CheckBox ID="DoingCheckout" runat="server" Visible="False" />
                <asp:Label ID="ReturnURL" runat="server" Text="default.aspx" Visible="False" />
                <asp:Panel ID="pnlChangePwd" runat="server" Visible="false" DefaultButton="btnChgPwd">
                    <table width="100%">
                        <tbody>
                            <tr valign="top">
                                <td align="left" width="90%" style="height: 59px">
                                    <font class="LightCellText">
                                        <asp:Label ID="Label10" runat="server" Text='<%$ Tokens:StringResource,signin.aspx.22 %>'
                                            Font-Bold="true" ForeColor="red"></asp:Label></font><br />
                                    <br />
                                    <asp:Label ID="lblPwdChgErr" runat="server" Font-Bold="true" ForeColor="red" Visible="false"></asp:Label>
                                </td>
                            </tr>
                            <tr valign="top">
                                <td class="MediumCell" align="left" width="90%">
                                    &nbsp;<b><asp:Label ID="Label19" runat="server" Text='<%$ Tokens:StringResource,signin.aspx.8 %>'></asp:Label></b>
                                </td>
                            </tr>
                            <tr class="MediumCell" valign="top">
                                <td class="LightCell" align="left" width="90%">
                                    <table cellspacing="5" cellpadding="0" width="100%" border="0">
                                        <tbody>
                                            <tr valign="baseline">
                                                <td colspan="2">
                                                    <b><font class="LightCellText">
                                                        <asp:Label ID="Label13" runat="server" Text='<%$ Tokens:StringResource,signin.aspx.23 %>'></asp:Label>
                                                    </font></b>
                                                </td>
                                            </tr>
                                            <tr valign="baseline">
                                                <td valign="middle" align="right">
                                                    <font class="LightCellText">
                                                        <asp:Label ID="Label14" runat="server" Text='<%$ Tokens:StringResource,signin.aspx.10 %>'></asp:Label></font>
                                                </td>
                                                <td valign="middle" align="left">
                                                    <asp:TextBox ID="CustomerEmail" runat="server" ValidationGroup="Group3" Columns="30"
                                                        MaxLength="100" CausesValidation="True" AutoCompleteType="Email"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="Group3"
                                                        ErrorMessage='<%$ Tokens:StringResource,signin.aspx.3 %>' ControlToValidate="CustomerEmail"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="middle" align="right">
                                                    <font class="LightCellText">
                                                        <asp:Label ID="Label15" runat="server" Text='<%$ Tokens:StringResource,signin.aspx.33 %>'></asp:Label></font>
                                                </td>
                                                <td valign="middle" align="left">
                                                    <asp:TextBox ID="OldPassword" runat="server" ValidationGroup="Group3" Columns="30"
                                                        MaxLength="50" CausesValidation="True" TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="Group3"
                                                        ErrorMessage='<%$ Tokens:StringResource,signin.aspx.4 %>' ControlToValidate="OldPassword"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="middle" align="right">
                                                    <font class="LightCellText">
                                                        <asp:Label ID="Label16" runat="server" Text='<%$ Tokens:StringResource,signin.aspx.34 %>'></asp:Label></font>
                                                </td>
                                                <td valign="middle" align="left">
                                                    <asp:TextBox ID="NewPassword" runat="server" ValidationGroup="Group3" Columns="30"
                                                        MaxLength="50" CausesValidation="True" TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="Group3"
                                                        ErrorMessage='<%$ Tokens:StringResource,signin.aspx.4 %>' ControlToValidate="NewPassword"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="middle" align="right">
                                                    <font class="LightCellText">
                                                        <asp:Label ID="Label17" runat="server" Text='<%$ Tokens:StringResource,signin.aspx.35 %>'></asp:Label></font>
                                                </td>
                                                <td valign="middle" align="left">
                                                    <asp:TextBox ID="NewPassword2" runat="server" ValidationGroup="Group3" Columns="30"
                                                        MaxLength="50" CausesValidation="True" TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="Group3"
                                                        ErrorMessage='<%$ Tokens:StringResource,signin.aspx.4 %>' ControlToValidate="NewPassword2"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr valign="baseline">
                                                <td valign="middle" align="right">
                                                    <font class="LightCellText">
                                                        <asp:Label ID="Label18" runat="server" Text='<%$ Tokens:StringResource,signin.aspx.21 %>'
                                                            Visible="False"></asp:Label></font>
                                                </td>
                                                <td valign="middle" align="left">
                                                    <asp:TextBox ID="SecurityCode2" runat="server" Visible="False" ValidationGroup="Group3"
                                                        CausesValidation="True" Width="73px" EnableViewState="False"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="SecurityCode2"
                                                        ErrorMessage='<%$ Tokens:StringResource,signin.aspx.20 %>' ValidationGroup="Group3"
                                                        Enabled="False"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr valign="baseline">
                                                <td valign="middle" align="center" colspan="2">
                                                    <asp:Image ID="Image1" runat="server" Visible="False"></asp:Image>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr valign="top">
                                <td align="left" width="90%">
                                    <p align="right">
                                        <asp:Button ID="btnChgPwd" OnClick="btnChgPwd_Click" runat="server" Text='<%$ Tokens:StringResource,signin.aspx.36 %>'
                                            ValidationGroup="Group3"></asp:Button>
                                    </p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </asp:Panel>
            </div>
        </LayoutTemplate>
    </asp:Login>
    <asp:Panel ID="ExecutePanel" runat="server" Width="100%">
        <div align="center">
            <img src="images/spacer.gif" alt="" width="100%" height="40" />
            <b>
                <asp:Literal ID="SignInExecuteLabel" runat="server"></asp:Literal></b></div>
    </asp:Panel>
    <asp:PasswordRecovery ID="ctrlRecoverPassword" runat="server" OnVerifyingUser="ctrlRecoverPassword_VerifyingUser">
        <UserNameTemplate>
            <p align="left">
                <b>
                    <asp:Label ID="Label6" runat="server" Text='<%$ Tokens:StringResource,signin.aspx.15 %>'></asp:Label>
                </b>&nbsp;</p>
            <p align="left">
                <asp:Label ID="Label8" runat="server" Text='<%$ Tokens:StringResource,signin.aspx.16 %>'></asp:Label>
            </p>
            <table width="100%">
                <tbody>
                    <tr class="MediumCell" valign="top">
                        <td align="left" width="100%">
                            &nbsp;<font class="MediumCellText"><b><asp:Label ID="Label9" runat="server" Text='<%$ Tokens:StringResource,signin.aspx.17 %>'></asp:Label></b></font>
                        </td>
                    </tr>
                    <tr class="MediumCell" valign="top">
                        <td class="LightCell" align="left" width="100%">
                            <table width="100%" cellspacing="5" cellpadding="0" border="0">
                                <tbody>
                                    <tr valign="baseline">
                                        <td align="right" style="height: 24px">
                                            <font class="LightCellText">&nbsp;<asp:Label ID="Label12" runat="server" Text='<%$ Tokens:StringResource,signin.aspx.10 %>'></asp:Label></font>
                                        </td>
                                        <td style="height: 24px">
                                            <%--<asp:TextBox ID="ForgotEMail" runat="server" ValidationGroup="Group2" CausesValidation="True"
                                                Columns="30"></asp:TextBox>--%>
                                            <asp:TextBox ID="UserName" runat="server" ValidationGroup="Group2" CausesValidation="True"
                                                Columns="30"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName"
                                                ErrorMessage='<%$ Tokens:StringResource,signin.aspx.3 %>' ValidationGroup="Group2"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td align="left" width="100%">
                            <p align="right">
                                <asp:Button ID="btnRequestNewPassword" CommandName="Submit" runat="server" Text='<%$ Tokens:StringResource,signin.aspx.18 %>'
                                    ValidationGroup="Group2"></asp:Button></p>
                        </td>
                    </tr>
                </tbody>
            </table>
        </UserNameTemplate>
    </asp:PasswordRecovery> 
</asp:Panel>