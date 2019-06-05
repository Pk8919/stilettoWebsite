<%@ Page language="c#" Inherits="AspDotNetStorefrontAdmin.galleryimages" CodeFile="galleryimages.aspx.cs" 
MaintainScrollPositionOnPostback="true" MasterPageFile="~/App_Templates/Admin_Default/AdminMaster.master" %>
<%@ OutputCache  Duration="1"  Location="none" %>
<asp:Content runat="server" ContentPlaceHolderID="bodyContentPlaceholder">
    <asp:Literal ID="ltScript" runat="server"></asp:Literal> 
    <asp:Literal ID="ltValid" runat="server"></asp:Literal>
            <div style="margin-bottom: 5px; margin-top: 5px;">
            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
            </div>
    <div id="container">    
    <asp:Panel ID="pnlUpload" runat="server" DefaultButton="btnUpload">
        <table border="0" cellpadding="1" cellspacing="0" class="outerTable">
            <tr>
                <td>
                    <div class="wrapper">
                        <table border="0" cellpadding="0" cellspacing="0" class="innerTable">
                            <tr>
                                <td class="titleTable">
                                    <font class="subTitle"><asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.galleryimages.Format %>:" /></font>                                
                                    <asp:FileUpload ID="fuMain" runat="Server" CssClass="fileUpload"  />
                                </td>
                                <td class="contentTable" style="padding-left:20px;">
                                    <asp:Button ID="btnUpload" runat="server" Text="<%$Tokens:StringResource, admin.common.Submit %>" OnClick="btnUpload_Click" CssClass="normalButtons" />
                                </td>                            
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
        </asp:Panel>
        <div style="margin-top: 5px; margin-bottom: 5px;"></div>
    </div>
    
   <div id="container">
        <table border="0" cellpadding="1" cellspacing="0" class="outerTable" width="100%">
            <tr>
                <td>
                    <div class="wrapper">                 
                        <table border="0" cellpadding="0" cellspacing="0" class="innerTable" width="100%">
                            <tr>
                                <td class="titleTable">
                                    <font class="subTitle"><asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.title.galleryimages %>:" /></font>
                                </td>
                            </tr>
                            <tr>
                                <td class="contentTable" valign="top" width="100%">
                                    <div class="wrapperTop">
                                        <asp:Literal ID="ltContent" runat="server"></asp:Literal>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <asp:Literal ID="ltScript2" runat="server"></asp:Literal>
</asp:Content>