<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Contact.ascx.cs" Inherits="AspDotNetStorefront.Contact" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="AjaxToolkit" %>

<asp:Literal ID='litContentTopic' runat="server" Text='<%$ Tokens:Topic, contact %>' />
    <style type="text/css">
        td.First
        {
        	width:102px;
        	text-align:right;
        	vertical-align:top;
        }
        td.Second
        {
        	width:348px;
        	text-align:left;
        	vertical-align:top;
        }
        
    </style>
    <div style="text-align: left;">
    <asp:Literal ID="ltError" runat="server" />
    <asp:Panel ID="pnlContactForm" runat="server">
    <table cellspacing="0" cellpadding="0" border="0">
        <tbody>
            <tr>
                <td class='First'>
                    <asp:Label ID="Label1" runat="server" Text='<%$ Tokens:StringResource, ContactUs.Name %>' EnableViewState="false" />
                    <br /><asp:Label runat="server" ID="lblNameError" ForeColor="Red" />
                </td>
                <td class='Second'>
                    <asp:TextBox ID='txtName' runat="server" MaxLength="50" Width="100%" />
                    <AjaxToolkit:TextBoxWatermarkExtender ID="tbweName" runat="server"
                        TargetControlID="txtName"
                        WatermarkText='<%$ Tokens:StringResource, ContactUs.YourName %>'
                        WatermarkCssClass="watermarked" />
                </td>
            </tr>
            <tr>
                <td class='First'>
                    <asp:Label ID="Label2" runat="server" Text='<%$ Tokens:StringResource, ContactUs.PhoneNumber %>' EnableViewState="false" />
                    <br /><asp:Label runat="server" ID="lblPhoneError" ForeColor="Red" />
                </td>
                <td class='Second'>
                    <asp:TextBox ID='txtPhone' runat="server" MaxLength="27" Width="100%" />
                    <AjaxToolkit:TextBoxWatermarkExtender ID="tbwePhone" runat="server"
                        TargetControlID="txtPhone"
                        WatermarkText='<%$ Tokens:StringResource, ContactUs.YourPhoneNumber %>'
                        WatermarkCssClass="watermarked" />
                </td>
            </tr>
            <tr>
                <td class='First'>
                    <asp:Label ID="Label3" runat="server" Text='<%$ Tokens:StringResource, ContactUs.EmailAddress %>' EnableViewState="false" />
                    <br /><asp:Label runat="server" ID="lblEmailError" ForeColor="Red" />
                </td>
                <td class='Second'>
                    <asp:TextBox ID='txtEmailAddress' runat="server" MaxLength="50" Width="100%" />
                    <AjaxToolkit:TextBoxWatermarkExtender ID="tbweEmail" runat="server"
                        TargetControlID="txtEmailAddress"
                        WatermarkText='<%$ Tokens:StringResource, ContactUs.YourEmailAddress %>'
                        WatermarkCssClass="watermarked" />
                </td>
            </tr>
            <tr>
                <td class='First'>
                    <asp:Label ID="Label4" runat="server" Text='<%$ Tokens:StringResource, ContactUs.Subject %>' EnableViewState="false" />
                </td>
                <td class='Second'>
                    <asp:TextBox ID='txtSubject' runat="server" MaxLength="50" Width="100%" />
                    <AjaxToolkit:TextBoxWatermarkExtender ID="tbweSubject" runat="server"
                        TargetControlID="txtSubject"
                        WatermarkText='<%$ Tokens:StringResource, ContactUs.YourSubject %>'
                        WatermarkCssClass="watermarked" />
                </td>
            </tr>
            <tr>
                <td class='First'>
                    <asp:Label ID="Label5" runat="server" Text='<%$ Tokens:StringResource, ContactUs.Message %>' EnableViewState="false" />
                    <br /><asp:Label runat="server" ID="lblMessageError" ForeColor="Red" />
                </td>
                <td class='Second'>
                    <asp:TextBox runat="server" ID='txtMessage' Rows='11' TextMode="MultiLine" Width="100%" />    
                    <AjaxToolkit:TextBoxWatermarkExtender ID="tbweMessage" runat="server"
                        TargetControlID="txtMessage"
                        WatermarkText='<%$ Tokens:StringResource, ContactUs.YourMessage %>'
                        WatermarkCssClass="watermarked" />               
                </td>
            </tr>
            <asp:PlaceHolder ID="phCaptchaPane" runat="server">
                <tr>
                    <td class="first" rowspan='2'>
                    <asp:Label runat="server" ID='lblCaptchaError' ForeColor="Red" />
                    </td>
                    <td><asp:Image ImageUrl="../Captcha.ashx?id=1" height='50px' width='175px' runat="server" /></td>
                </tr>
                <tr>
                    <td class='Second'><asp:TextBox runat="server" ID="txtCaptchaText" Width="100%" MaxLength="6" />
                        <AjaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server"
                            TargetControlID="txtCaptchaText"
                            WatermarkText='<%$ Tokens:StringResource, Global.CaptchaText %>'
                            WatermarkCssClass="watermarked" />
                    </td>
                </tr>
            </asp:PlaceHolder>
            <tr>
                <td />
                <td>
                    <asp:Button ID='cmdSubmit' runat="server" Text="Submit" OnClick="cmdSubmit_Click" />
                </td>
            </tr>
        </tbody>
    </table>
    </asp:Panel>
    </div>