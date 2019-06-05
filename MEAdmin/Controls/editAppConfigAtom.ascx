<%@ Control Language="C#" AutoEventWireup="true" CodeFile="editAppConfigAtom.ascx.cs" Inherits="AspDotNetStorefrontAdmin.Controls.EditAppConfigAtom" %>
<%@ Register TagPrefix="aspdnsf" TagName="GeneralInfo" Src="GeneralInfo.ascx" %>
<%@ Register TagPrefix="aspdnsf" TagName="EditAppConfigInput" Src="EditAppConfigInput.ascx" %>

<% if (!this.HideTableNode) {%>
<table  class='<%# this.CssClass %>'>
<% } %>
    <tr class='tr<%# this.CssClass %>'>
        <td class="expandingLabel" style="white-space:nowrap;text-align:right;">
            <aspdnsf:GeneralInfo id="AppConfigInfo" runat="server" /> 
            <span class="configTitle">
                <b><asp:Label ID="lblTitle" runat="server" />:&nbsp;</b>          
            </span>    
            <div style="clear:both;"></div>        
        </td>
        <td valign="middle">
            <asp:Panel ID="pnlWrapper" runat="server">
                <table width="100%" class="storeAppConfigTable alternaterows">
                    <asp:Repeater ID="repVisibleStoreValues" runat="server" OnItemDataBound="StoreValues_ItemDataBound">
                        <ItemTemplate>
                            <tr class="storeVisibleRow" id="storeVisibleRow">
                                <td style="text-align:right;" class="storeExpandingLabel" >
                                    <asp:Literal ID="litStoreName" runat="server" />:
                                </td>
                                <td colspan="2" valign="middle">
                                    <aspdnsf:EditAppConfigInput runat="server" ID="acStoreValue" />
                                    <asp:HiddenField ID="hfStoreId" runat="server" Value='<%# Eval("StoreID") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                    <tr>
                        <td style="text-align:right;" class="storeExpandingLabel">
                            <b>Default:</b>
                        </td>
                        <td style="width:100%;" valign="middle">
                            <aspdnsf:EditAppConfigInput runat="server" ID="acDefault" />
                            <asp:HiddenField ID="hfAppConfigName" runat="server" />
                        </td>
                        <td class="storeExpandingLabel">
                            <a href="javascript:void(0);" onclick="try{ToggleAppConfigStores($(this).closest('.storeAppConfigTable'));}catch(err){}">
                                <asp:Image ImageUrl="~/App_Themes/Admin_Default/images/Application_double.png" runat="server" ID="imgToggleAllStores" title="Edit inheriting store-specific values" />
                            </a>
                        </td>
                    </tr>
                    <asp:Repeater ID="repHiddenStoreValues" runat="server" OnItemDataBound="StoreValues_ItemDataBound">
                        <ItemTemplate>
                            <tr class="storeToggleRow" style="display:none;" id="storeToggleRow">
                                <td style="text-align:right;" class="storeExpandingLabel" >
                                    <asp:Literal ID="litStoreName" runat="server" />:
                                </td>
                                <td colspan="2" valign="middle">
                                    <aspdnsf:EditAppConfigInput runat="server" ID="acStoreValue" />
                                    <asp:HiddenField ID="hfStoreId" runat="server" Value='<%# Eval("StoreID") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </asp:Panel>
        </td>
    </tr>
    <%if (this.ShowSaveButton){ %>
        <tr>
            <td colspan="2" style="text-align:center;" valign="middle">
                <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" />
            </td>
        </tr>
    <% } %>
<% if (!this.HideTableNode) { %>
</table>
<% } %>
