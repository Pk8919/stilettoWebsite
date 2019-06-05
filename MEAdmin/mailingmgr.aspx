<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mailingmgr.aspx.cs" Inherits="AspDotNetStorefrontAdmin.mailingmgr"
    MaintainScrollPositionOnPostback="true" MasterPageFile="~/App_Templates/Admin_Default/AdminMaster.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content runat="server" ContentPlaceHolderID="head">

    <script type="text/javascript">
        function EnableButtons() {
            setTimeout("document.getElementById('<%=btnSend.ClientID%>').disabled=false;", 60000);
            setTimeout("document.getElementById('<%=btnRemoveEmail.ClientID%>').disabled=false;", 60000);
        }
    </script>

</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="bodyContentPlaceholder">
    <cc1:ConfirmButtonExtender ID="cbxSendMail" runat="server" TargetControlID="btnSend"
        ConfirmText="<%$ Tokens:StringResource, admin.mailingmgr.Warning %>" />
    <div runat="server" id="divStatus" style="margin-bottom: 5px; margin-top: 5px; margin-left: 5px;
        margin-right: 5px;" align="center">
        <iframe runat="server" id="ifrStatus" width="95%" height="50px" frameborder="1" scrolling="no"
            visible="false" />
            <br />
        <asp:Literal ID="ltError" runat="server"></asp:Literal>
    </div>
    <asp:Panel ID="pnlSendMail" DefaultButton="btnSend" runat="server">
        <div id="co">
            <table border="0" cellpadding="0" cellspacing="0" class="outerTable" width="100%">
                <tr>
                    <td>
                        <p>
                            <asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.mailingmgr.Info %>" />
                        </p>
                    </td>
                </tr>
            </table>
            <table border="0" cellpadding="0" cellspacing="0" class="innerTable" width="100%">
                <tr>
                    <td width="260" align="right" valign="top">
                        <font class="subTitleSmall">*<asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.mailingmgr.Subject %>" />:</font>
                    </td>
                    <td align="left" valign="middle" class="style1">
                        <asp:TextBox runat="server" ID="txtSubject" Width="294px"></asp:TextBox>
                    </td>
                </tr>
                <tr id="trTestOnly" runat="server">
                    <td align="right" valign="middle">
                        <font class="subTitleSmall">*<asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.mailingmgr.TestOnly %>" />:</font>
                    </td>
                    <td align="left" valign="middle" class="style1">
                        <asp:RadioButtonList ID="rbTestOnly" runat="server" RepeatDirection="horizontal">
                            <asp:ListItem Value="1" Selected="true" Text="<%$Tokens:StringResource, admin.common.Yes %>" />
                            <asp:ListItem Value="0" Text="<%$Tokens:StringResource, admin.common.No %>" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td align="left" valign="middle" class="style1">
                        <asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.mailingmgr.IfTesting %>" />
                    </td>
                </tr>
                <tr id="trCustomersWithOrder" runat="server">
                    <td align="right" valign="middle">
                        <font class="subTitleSmall">
                            <asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.mailingmgr.CustomersWithOrders %>" />:</font>
                    </td>
                    <td align="left" valign="middle" class="style1">
                        <asp:RadioButtonList ID="rbCustomersWithOrder" runat="server" RepeatDirection="horizontal">
                            <asp:ListItem Value="1" Selected="true" Text="<%$Tokens:StringResource, admin.common.Yes %>" />
                            <asp:ListItem Value="0" Text="<%$Tokens:StringResource, admin.common.No %>" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr id="trListCustomers" runat="server">
                    <td align="right" valign="middle">
                        <font class="subTitleSmall">*<asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.mailingmgr.ListCustomers %>" />:</font>
                    </td>
                    <td align="left" valign="middle" class="style1">
                        <asp:RadioButtonList ID="rbListCustomers" runat="server" RepeatDirection="horizontal">
                            <asp:ListItem Value="1" Selected="true" Text="<%$Tokens:StringResource, admin.common.Yes %>" />
                            <asp:ListItem Value="0" Text="<%$Tokens:StringResource, admin.common.No %>" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td align="left" valign="middle" class="style1">
                        <asp:Literal ID="Literal2" runat="server" Text="<%$Tokens:StringResource, admin.mailingmgr.IfList %>" />
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="middle">
                        <font class="subTitleSmall">
                            <asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.mailingmgr.Newsletter %>" /></font>
                    </td>
                    <td align="left" valign="middle" class="style1">
                        <asp:RadioButtonList ID="rbNewsletter" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value='1' Text="<%$Tokens:StringResource, admin.common.Yes %>" />
                            <asp:ListItem Value='0' Selected="true" Text="<%$Tokens:StringResource, admin.common.No %>" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr id="trMessageBox" runat="server">
                    <td align="right" valign="top">
                        <font class="subTitleSmall">
                            <asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.systemlog.Message %>" /></font>
                    </td>
                    <td align="left" valign="top" class="style1">
                        <asp:Literal ID="ltMessage" runat="server"></asp:Literal>
                        <div>
                            <telerik:RadEditor runat="server" ID="radDescription">
                                <ImageManager UploadPaths="~/Images" ViewPaths="~/Images" DeletePaths="~/Images" />
                                <DocumentManager UploadPaths="~/Images" ViewPaths="~/Images" DeletePaths="~/Images" />
                                <FlashManager UploadPaths="~/Images" ViewPaths="~/Images" DeletePaths="~/Images" />
                                <MediaManager UploadPaths="~/Images" ViewPaths="~/Images" DeletePaths="~/Images" />
                                <SilverlightManager UploadPaths="~/Images" ViewPaths="~/Images" DeletePaths="~/Images" />
                                <TemplateManager UploadPaths="~/Images" ViewPaths="~/Images" DeletePaths="~/Images" />
                            </telerik:RadEditor>
                        </div>
                    </td>
                </tr>
                <tr id="trMessageFooter" runat="server">
                    <td align="right" valign="top">
                        <font class="subTitleSmall">
                            <asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.mailingmgr.MessageFooter %>" /></font>
                    </td>
                    <td align="left" valign="middle" class="style1">
                        <asp:Literal ID="Literal1" runat="server" Text="<%$Tokens:Topic, MailFooter %>" />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td class="style1">
                        <asp:Label ID="lblFooter" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        <asp:Button ID="btnSend" runat="server" CssClass="normalButtons" Text="<%$Tokens:StringResource, admin.mailingmgr.SendEMail %>"
                            OnClick="btnSend_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>
    <br />
    <hr />
    <asp:Panel ID="pnlRemove" DefaultButton="btnRemoveEmail" runat="server">
        <table class="style2">
            <tr>
                <td>
                    <b>
                        <asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.mailingmgr.UseForm %>" /></b>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="style2">
                        <tr>
                            <td class="style3">
                                <asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.mailingmgr.RemoveCustomerEmail %>" />:
                            </td>
                            <td class="style4">
                                <asp:TextBox ID="txtRemoveEmail" runat="server" Width="400px"></asp:TextBox>
                            </td>
                            <td class="style5">
                                <asp:Button ID="btnRemoveEmail" runat="server" CssClass="normalButtons" Text="<%$Tokens:StringResource, admin.mailingmgr.RemoveEmail %>"
                                    OnClick="btnRemoveEmail_Click" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </asp:Panel>

    <script type="text/javascript">
        EnableButtons();
    </script>

</asp:Content>
