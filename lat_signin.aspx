<%@ Page Language="c#" Inherits="AspDotNetStorefront.lat_signin" CodeFile="lat_signin.aspx.cs"
    MasterPageFile="~/App_Templates/skin_1/template.master" MaintainScrollPositionOnPostback="true" %>

<%@ Register TagPrefix="aspdnsf" TagName="Topic" Src="~/Controls/TopicControl.ascx" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PageContent">
    <asp:Panel ID="pnlContent" runat="server">
    
    
        <table id="Table1" runat="server" visible="true" cellspacing="5" cellpadding="5" border="0" width="100%">
                <tr>
                    <td valign="top" align="left">
                        <table cellspacing="0" cellpadding="0" width="171" border="0">
                            <tr>
                                <td class="AffiliateHeaderTd" height="18">&nbsp;Learn More</td>
                            </tr>
                            <tr valign="middle" align="center">
                                <td class="AffiliateTextCell">
                                    <table cellspacing="0" cellpadding="4" width="100%" border="0">
                                        <tr>
                                            <td class="AffiliateLinks" valign="top" align="left" width="100%">Join our rapidly growing network of <asp:Literal ID="AppConfig_AffiliateProgramName" runat="server" Mode="PassThrough"></asp:Literal>'s -- it's simple and it works! <asp:HyperLink runat="server" NavigateUrl="<%$ Tokens:TopicLink, affiliate %>" Text="Read more" />.</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>

                        <p>&nbsp;</p>

                        <table cellspacing="0" cellpadding="0" width="171" border="0">
                            <tr>
                                <td class="AffiliateHeaderTd" height="18">&nbsp;Need Help?</td>
                            </tr>
                            <tr valign="middle" align="center">
                                <td class="AffiliateTextCell">
                                    <table cellspacing="0" cellpadding="4" width="100%" border="0">
                                        <tr>
                                            <td valign="top" align="left" width="100%" class="AffiliateLinks">
                                                &bull; <asp:HyperLink ID="AskAQuestion" runat="server" Text="Ask A Question"></asp:HyperLink><br />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>

                    <td align="left" valign="top">
                        
                        <table cellpadding="0" cellspacing="0" align="center" width="400">
                            <tr><td><asp:Image id="affiliateheader_small_gif" runat="server" /><br /><br /></td></tr>
                            <tr>
                                <td>
                                    <center><asp:Label ID="lblErrMsg" runat="server" Font-Bold="true" ForeColor="red"></asp:Label></center>
                                    <center><asp:Label ID="lblNote" runat="server" Font-Bold="true" ForeColor="blue"></asp:Label></center>
                                    <center><asp:Label ID="lblReqPwdErr" runat="server" Font-Bold="true" ForeColor="red" Visible="true"></asp:Label></center>
                                </td>
                            </tr>
                            <tr><td><b><asp:Literal ID="AppConfig_AffiliateProgramName2" runat="server" Mode="PassThrough"></asp:Literal> MEMBERS LOGIN BELOW <br/><br/>(NEW MEMBERS CAN SIGNUP <a href="lat_signup.aspx">HERE</a>)</b><br /><br /></td></tr>
                            <tr>
                                <td>
                                        <asp:TextBox ID="ReturnURL" runat="server" TextMode="SingleLine" Visible="false"></asp:TextBox>

                                        <table cellspacing="0" cellpadding="0" width="400" border="0">
                                            <tr valign="top">
                                                <td align="left" class="AffiliateHeaderTd">
                                                    &nbsp;Login Information:
                                                </td>
                                            </tr>

                                            <tr valign="top">
                                                <td align="left" width="400" class="AffiliateTextCell">
                                                    <table cellspacing="5" cellpadding="0" width="400" border="0">
                                                        <tr valign="baseline">
                                                            <td class="AffiliateLinks" colspan="2">Enter your <asp:Literal ID="AppConfig_AffiliateProgramName3" runat="server" Mode="PassThrough"></asp:Literal> e-mail address and password below:</td>
                                                        </tr>

                                                        <tr valign="baseline">
                                                            <td align="right" class="AffiliateLinks">
                                                                My e-mail address is:
                                                            </td>

                                                            <td>
                                                                <asp:TextBox ID="EMail" Columns="30" runat="server" MaxLength="100" ValidationGroup="sigin" CausesValidation="true"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="ReqValEmail" runat="server" ValidationGroup="signin" Display="none" ControlToValidate="EMail" EnableClientScript="true" ErrorMessage="Please enter your e-mail address"></asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator id="RegExValEmail" runat="server" ValidationGroup="signin" Display="none" ControlToValidate="EMail" EnableClientScript="true" ErrorMessage="E-Mail address is invalid, please enter a valid e-mail address" ValidationExpression="^[a-zA-Z0-9][-\w\.\+]*@([a-zA-Z0-9][\w\-]*\.)+[a-zA-Z]{2,4}$"></asp:RegularExpressionValidator>
                                                            </td>
                                                        </tr>
                                                        <tr valign="baseline">
                                                            <td align="right" class="AffiliateLinks">My password is:</td>

                                                            <td>
                                                                <asp:TextBox ID="Password" runat="server" TextMode="Password" Columns="30" ValidationGroup="sigin" CausesValidation="true"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="signin" Display="none" ControlToValidate="Password" EnableClientScript="true" ErrorMessage="Please enter your password"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr valign="baseline">
                                                            <td align="center" colspan="2" class="AffiliateLinks">Remember Password:<asp:CheckBox  ID="PersistLogin" Checked="true" runat="server" /></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>

                                            <tr valign="top">
                                                <td align="left" width="400" colspan="2"><img height="2" alt="" src="images/spacer.gif" width="2" border="0" /></td>
                                            </tr>
                                            <tr valign="top">
                                                <td align="left" width="400" colspan="2"><img height="4" alt="" src="images/spacer.gif" width="2" border="0" /></td>
                                            </tr>
                                            <tr valign="top">
                                                <td align="right" width="400">
                                                    <asp:Button ID="btnSignIn" runat="server" OnClientClick="Page_ValidationActive=true;"  Text="Sign in" CausesValidation="true" ValidationGroup="signin" OnClick="btnSignIn_Click" />
                                                    <asp:ValidationSummary DisplayMode="BulletList" ID="ValSummary" ShowMessageBox="true" runat="server" ShowSummary="false" ValidationGroup="signin" EnableClientScript="true"  />
                                                </td>
                                            </tr>
                                        </table>
                                </td>
                            </tr>
                        </table>
                        

                        <table cellpadding="0" cellspacing="0" align="center" width="400">
                            <tr>
                                <td class="AffiliateForgotPasswordText">
                                    <br />
                                    <span>FORGOT YOUR PASSWORD?</span><br />
                                    If you can provide us with some additional information, we can e-mail your password to the e-mail address 
                                    specified in your account. If you are having problems, or if you can't remember any of the information, 
                                    you will need to <asp:HyperLink ID="lnkSupportEmail" runat="server" Text="contact"></asp:HyperLink>  our support staff<br />
                                    <br />                            
                                </td>
                            </tr>
                            <tr>
                                <td>
                                        <table cellspacing="0" cellpadding="0" width="400" border="0">
                                            <tr valign="top">
                                                <td align="left" width="400" class="AffiliateHeaderTd">&nbsp;User Verification:</td>
                                            </tr>

                                            <tr valign="top">
                                                <td align="left" width="481" class="AffiliateTextCell">
                                                    <table cellspacing="5" cellpadding="0" width="400" border="0">
                                                        <tr valign="baseline">
                                                            <td align="right" class="AffiliateLinks">My e-mail address is:</font></td>

                                                            <td><asp:TextBox ID="ResetPwdEMail" runat="server" Columns="35"></asp:TextBox></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>

                                            <tr valign="top">
                                                <td align="left" width="400" colspan="2"><img height="2" src="images/spacer.gif" width="2" border="0" /></td>
                                            </tr>
                                            <tr valign="top">
                                                <td align="left" width="400" colspan="2"><img height="4" alt="" src="images/spacer.gif" width="2" border="0" /></td>
                                            </tr>
                                            <tr valign="top">
                                                <td align="left" width="400" colspan="2">
                                                    <p align="right"><asp:Button ID="btnLostPassword" runat="server" Text="Request Password" OnClick="btnLostPassword_Click" /></p>
                                                </td>
                                            </tr>
                                        </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            
            
        <asp:Panel ID="pnlSigninSuccess" runat="server" Visible="false" style="margin-top:100px;" HorizontalAlign="Center">
            <asp:Label ID="lblSigninSuccess" runat="server" Font-Bold="true"></asp:Label>
        </asp:Panel>
    </asp:Panel>
</asp:Content>

