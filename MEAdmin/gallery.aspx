<%@ Page language="c#" Inherits="AspDotNetStorefrontAdmin.gallery" CodeFile="gallery.aspx.cs" 
 MaintainScrollPositionOnPostback="true" MasterPageFile="~/App_Templates/Admin_Default/AdminMaster.master"%>
<%@ OutputCache  Duration="1"  Location="none" %>
<asp:Content runat="server" ContentPlaceHolderID="bodyContentPlaceholder">
        <div class="breadCrumb3">
    <asp:Literal ID="ltScript" runat="server"></asp:Literal><asp:Literal ID="ltValid" runat="server"></asp:Literal></div>
        <div style="margin-bottom: 5px; margin-top: 5px;" class="breadCrumb3">
            <asp:Literal ID="ltError" runat="server"></asp:Literal>
            <asp:Literal ID="ltURL" runat="server" />
        </div>
    <div id="container">
        <table border="0" cellpadding="1" cellspacing="0" class="" width="100%">
            <tr>
                <td>
                    <div class="">                       
                        <table border="0" cellpadding="0" cellspacing="0" class="" width="100%">
                            <tr>
                                <td class="titleTable">
                                    <font class="subTitle"><asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.title.galleries %>:" /></font>
                                </td>
                            </tr>
                            <tr>
                                <td class="" valign="top" width="100%">
                                    <div>
                                        <asp:Panel runat="server" id="pnlGrid">
                                        <asp:Button runat="server" ID="btnInsert" CssClass="normalButtons" Text="<%$Tokens:StringResource, admin.common.AddNewUC %>" OnClick="btnInsert_Click" />
                                        &nbsp;
                                        <asp:Button runat="server" ID="btnOrder" CssClass="normalButtons" Text="<%$Tokens:StringResource, admin.common.UpdateOrder %>" OnClick="btnOrder_Click" /><br />
                                            <br />
                                        <asp:GridView Width="100%" ID="gMain" runat="server" PagerStyle-HorizontalAlign="left" PagerSettings-Position="TopAndBottom" AutoGenerateColumns="False" AllowPaging="True" PageSize="15" AllowSorting="True" HorizontalAlign="Left" OnRowCancelingEdit="gMain_RowCancelingEdit" OnRowCommand="gMain_RowCommand" OnRowDataBound="gMain_RowDataBound" OnSorting="gMain_Sorting" OnPageIndexChanging="gMain_PageIndexChanging" OnRowUpdating="gMain_RowUpdating" OnRowEditing="gMain_RowEditing" CellPadding="0" GridLines="None" ShowFooter="True">
                                            <Columns>
                                                <asp:CommandField ButtonType="Image" CancelImageUrl="~/App_Themes/Admin_Default/images/cancel.gif" EditImageUrl="~/App_Themes/Admin_Default/images/edit.gif" ShowEditButton="True" UpdateImageUrl="~/App_Themes/Admin_Default/images/update.gif" >
                                                    <ItemStyle Width="60px" />
                                                </asp:CommandField>
                                                <asp:BoundField DataField="GalleryID" HeaderText="<%$Tokens:StringResource, admin.common.ID %>" ReadOnly="True" SortExpression="GalleryID" >
                                                    <ItemStyle CssClass="lighterData" />
                                                </asp:BoundField>
                                                
                                                <asp:TemplateField HeaderText="<%$Tokens:StringResource, admin.gallery.Image %>">
                                                    <ItemTemplate>
                                                        <asp:Literal runat="server" ID="ltImage"></asp:Literal>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:FileUpload CssClass="fileUpload" ID="fuMain" runat="server" />
                                                    </EditItemTemplate>
                                                    <ItemStyle CssClass="normalData" />
                                                </asp:TemplateField> 
                                                
                                                <asp:TemplateField HeaderText="<%$Tokens:StringResource, admin.common.Name %>" SortExpression="Name">
                                                    <ItemTemplate>
                                                        <asp:Literal runat="server" ID="ltName" Text='<%# DataBinder.Eval(Container.DataItem, "Name") %>'></asp:Literal>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <%# DataBinder.Eval(Container.DataItem, "EditName") %>
                                                    </EditItemTemplate>
                                                    <ItemStyle CssClass="normalData" />
                                                </asp:TemplateField>   
                                                 
                                                <asp:TemplateField HeaderText="<%$Tokens:StringResource, admin.common.Description %>">
                                                    <ItemTemplate>
                                                        <asp:Literal runat="server" ID="ltDescription" Text='<%# DataBinder.Eval(Container.DataItem, "Description") %>'></asp:Literal>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <%# DataBinder.Eval(Container.DataItem, "EditDescription") %>
                                                    </EditItemTemplate>
                                                    <ItemStyle CssClass="normalData" />
                                                </asp:TemplateField> 
                                                
                                                <asp:TemplateField HeaderText="<%$Tokens:StringResource, admin.common.ManageImages %>">
                                                    <ItemTemplate>
                                                        <a href='galleryImages.aspx?GalleryID=<%# Eval("GalleryID") %>'>Manage Images</a>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="normalData" />
                                                </asp:TemplateField>  
                                                
                                                <asp:TemplateField HeaderText="<%$Tokens:StringResource, admin.common.URL %>">
                                                    <ItemTemplate>
                                                        <asp:Literal ID="ltURL" runat="server"></asp:Literal>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:Literal ID="ltURL" runat="server"></asp:Literal>
                                                    </EditItemTemplate>
                                                    <ItemStyle CssClass="normalData" />
                                                </asp:TemplateField>  
                                                
                                                <asp:TemplateField HeaderText="<%$Tokens:StringResource, admin.common.DisplayOrder %>">
                                                    <ItemTemplate>
                                                        <input size="2" type="text" name='DisplayOrder_<%# Eval("GalleryID") %>' value='<%# Eval("DisplayOrder") %>' >                                                
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <input size="2" type="text" name='DisplayOrder_<%# Eval("GalleryID") %>' value='<%# Eval("DisplayOrder") %>' >                                                
                                                    </EditItemTemplate>
                                                    <ItemStyle CssClass="lightData" />
                                                </asp:TemplateField>  
                                                                                                 
                                                <asp:TemplateField HeaderText="<%$Tokens:StringResource, admin.gallery.Directory %>">
                                                    <ItemTemplate>
                                                        <asp:Literal ID="ltDirectory" runat="server" Text='<%# Eval("DirName") %>'></asp:Literal>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox CssClass="singleNormal" ID="txtDirectory" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvDirectory" runat="server" ErrorMessage="<%$Tokens:StringResource, admin.common.ValidatorMessage %>" ControlToValidate="txtDirectory"></asp:RequiredFieldValidator>
                                                        <asp:Literal ID="ltDirectory" runat="server"></asp:Literal>
                                                    </EditItemTemplate>
                                                    <ItemStyle CssClass="lightData" />
                                                </asp:TemplateField>  
                                                                                        
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="imgDelete" CommandName="DeleteItem" CommandArgument='<%# Eval("GalleryID") %>' runat="Server" AlternateText="<%$Tokens:StringResource, admin.common.Delete %>" ImageUrl="~/App_Themes/Admin_Default/images/delete2.gif" />                                                        
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="selectData" Width="25px" />
                                                </asp:TemplateField>
                                                <asp:BoundField Visible="False" DataField="EditName" ReadOnly="True" />
                                                <asp:BoundField Visible="False" DataField="EditDescription" ReadOnly="True" />
                                            </Columns>
                                            <PagerSettings FirstPageText="<%$Tokens:StringResource, admin.common.FirstPage %>" LastPageText="<%$Tokens:StringResource, admin.common.LastPage %>"
                                                Mode="NumericFirstLast" PageButtonCount="15" Position="TopAndBottom" />
                                            <FooterStyle CssClass="gridFooter" />
                                            <RowStyle CssClass="gridRow" />
                                            <EditRowStyle CssClass="gridEdit2" />
                                            <PagerStyle CssClass="gridPager" HorizontalAlign="Left" />
                                            <HeaderStyle CssClass="gridHeader" />
                                            <AlternatingRowStyle CssClass="gridAlternatingRow" />
                                        </asp:GridView>
                                        </asp:Panel>
                                        <asp:Panel ID="pnlAdd" runat="Server" DefaultButton="btnSubmit">
                                        <div style="margin-top: 5px; margin-bottom: 15px;">
                                            <asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.common.RequiredFieldsPrompt %>" />
                                        </div>
                                        <table width="100%" cellpadding="1" cellspacing="0" border="0">
                                            <tr>
                                                <td align="right" valign="middle">
                                                    <font class="subTitleSmall">*<asp:Literal runat="server" Text="*<%$Tokens:StringResource, admin.common.Name %>:" /></font>
                                                </td>
                                                <td align="left" valign="middle">
                                                    <asp:Literal ID="ltName" runat="Server"></asp:Literal>
                                                </td>
                                            </tr>  
                                            <tr>
                                                <td align="right" valign="middle">
                                                    <font class="subTitleSmall"><asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.common.Description %>:" /></font>
                                                </td>
                                                <td align="left" valign="middle">
                                                    <asp:Literal ID="ltDescription" runat="Server"></asp:Literal>
                                                </td>
                                            </tr>  
                                            <tr>
                                                <td align="right" valign="middle">
                                                    <font class="subTitleSmall"><asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.gallery.Image %>:" /></font>
                                                </td>
                                                <td align="left" valign="middle">
                                                    <asp:FileUpload CssClass="fileUpload" ID="fuMain" runat="server" />
                                                </td>
                                            </tr>  
                                            <tr>
                                                <td align="right" valign="middle">
                                                    <font class="subTitleSmall"><asp:Literal runat="server" Text="*<%$Tokens:StringResource, admin.gallery.Directory %>:" /></font>
                                                </td>
                                                <td align="left" valign="middle">
                                                    <asp:TextBox ID="txtDirectory" runat="server" CssClass="singleNormal" ValidationGroup="gAdd"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ErrorMessage="<%$Tokens:StringResource, admin.gallery.EnterDirectory %>" ControlToValidate="txtDirectory" ID="RequiredFieldValidator2" ValidationGroup="gAdd" SetFocusOnError="true" runat="server"></asp:RequiredFieldValidator> 
                                                    <asp:Image ID="imgDirectory" ImageUrl="~/App_Themes/Admin_Default/images/info.gif" ToolTip="<%$Tokens:StringResource,admin.gallery.tooltip.imgDirectory %>" runat="server" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="middle">
                                                    <font class="subTitleSmall"><asp:Literal runat="server" Text="*<%$Tokens:StringResource, admin.common.DisplayOrder %>:" /></font>
                                                </td>
                                                <td align="left" valign="middle">
                                                     <asp:TextBox ID="txtOrder" runat="Server" CssClass="single3chars" ValidationGroup="gAdd" Text="<%$Tokens:StringResource, admin.gallery.DisplayOrderValue %>"></asp:TextBox>
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="<%$Tokens:StringResource, admin.gallery.EnterDisplayOrder %>" ValidationGroup="gAdd" ControlToValidate="txtOrder"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>                                      
                                            <tr>
                                                <td colspan="2">
                                                    <asp:ValidationSummary ValidationGroup="gAdd" ID="validationSummary" runat="server" EnableClientScript="true" ShowMessageBox="true" ShowSummary="false" Enabled="true" />
                                                </td>
                                            </tr>
                                        </table>
                                        <div style="width: 100%; text-align: center;">
                                            &nbsp;&nbsp;<asp:Button ValidationGroup="gAdd" ID="btnSubmit" runat="server" CssClass="normalButtons" OnClick="btnSubmit_Click" Text="<%$Tokens:StringResource, admin.common.Submit %>" />
                                            &nbsp;&nbsp;<asp:Button ID="btnCancel" runat="server" CssClass="normalButtons" Text="<%$Tokens:StringResource, admin.common.Cancel %>" OnClick="btnCancel_Click" />
                                        </div>
                                    </asp:Panel>
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