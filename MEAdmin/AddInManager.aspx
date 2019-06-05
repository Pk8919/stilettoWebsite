<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddInManager.aspx.cs" Inherits="AspDotNetStorefrontAdmin.AddInManagerPage" 
MasterPageFile="~/App_Templates/Admin_Default/AdminMaster.Master" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="aspdnsf" TagName="AddinList" src="controls/AddinList.ascx" %>

<%@ Import Namespace="System.AddIn.Hosting" %>
<%@ Import Namespace="AspDotNetStorefront.HostView" %>

<asp:Content runat="server" ContentPlaceHolderID="bodyContentPlaceholder">
<asp:Panel ID="pnlContent" runat="server" DefaultButton="btnUploadAddIn">
        <div class="divMain">
            <div>
                <asp:LinkButton ID="btnRebuild" runat="server" OnClick="btnRebuild_Click" ><asp:Label runat="server" Text="<%$Tokens:StringResource, admin.AddInManager.RebuildAddinCache %>" /></asp:LinkButton>
            </div>
            <br />
            
            <aspdnsf:AddinList ID="ctrlAddinList" runat="server"   />
            <br />
            <div class="divUpload">
                <div class="divError">
                    <asp:Label ID="lblError" runat="server" ></asp:Label>
                </div>
                <div class="divUploadInstructions">
                    <p><asp:Label runat="server" Text="<%$Tokens:StringResource, admin.AddInManager.UploadInstructions %>" /></p>
                </div>
                <table border="0" cellspacing="0" cellpadding="0" >
                    <tr>
                        <td valign="top" align="right">
                            <asp:Label runat="server" Text="<%$Tokens:StringResource, admin.AddInManager.SelectAddin %>" />&nbsp;
                        </td>
                        <td valign="top" align="left">
                            <asp:FileUpload ID="flpAddIn" runat="server" />                
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" align="right">
                            <asp:Label runat="server" Text="<%$Tokens:StringResource, admin.AddInManager.AddinConfig %>" />&nbsp;
                        </td>
                        <td valign="top" align="left">
                            <asp:FileUpload ID="flpConfig" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" align="right">
                            <br />
                        </td>
                        <td valign="top" align="left" style="padding-top:5px;">
                            <asp:Button ID="btnUploadAddIn" runat="server" Text="<%$Tokens:StringResource, admin.common.Upload %>" 
                                onclick="btnUploadAddIn_Click" />
                        </td>
                    </tr>
                </table>  
            </div>
        </div>
        </asp:Panel>
</asp:Content>