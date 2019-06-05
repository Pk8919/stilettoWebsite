<%@ Control ClassName="OrderOptionControl" Language="C#" AutoEventWireup="true" CodeFile="OrderOption.ascx.cs" Inherits="AspDotNetStorefront.OrderOptionControl" %>
<%@ Register TagPrefix="aspdnsfc" Namespace="AspDotNetStorefrontControls" Assembly="AspDotNetStorefrontControls" %>

<%@ Import Namespace="AspDotNetStorefrontCore" %>
<%@ Import Namespace="System.Linq" %>


<table width="100%" cellpadding="2" cellspacing="0" border="0" style="border-style: solid;
    border-width: 0px; border-color: #444444">
    <tr>
        <td align="left" valign="top">
            <asp:Image ID="ShoppingCartorderoptions_gif" runat="server" 
                ImageUrl='<%$ Tokens:SkinImage, ShoppingCartorderoptions.gif %>' />
            <br />                    
            <table width="100%" cellpadding="4" cellspacing="0" border="0" style="border-style: solid;
                border-width: 1px; border-color: #444444;">
                <tr>
                    <td align="left" valign="top">
                        <div style="text-align: center; width: 100%;">
                            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td align="left">
                                        <asp:Label ID="lblNameHeader" CssClass="OrderOptionsRowHeader" Text="<%$ Tokens:StringResource,shoppingcart.cs.27 %>"
                                            runat="server"></asp:Label></td>
                                    <td align="center">
                                        <asp:Label ID="lblCostHeader" CssClass="OrderOptionsRowHeader" Text="<%$ Tokens:StringResource,shoppingcart.cs.28 %>"
                                            runat="server"></asp:Label></td>
                                    <td width="200px" align="center">
                                        <asp:Label ID="lblSelectedHeader" CssClass="OrderOptionsRowHeader" Text="<%$ Tokens:StringResource,shoppingcart.cs.29 %>"
                                            runat="server"></asp:Label></td>
                                </tr>
                                <asp:Repeater ID="rptOrderOptions" runat="server" 
                                    OnItemDataBound="rptOrderOptions_ItemDataBound">
                                    <ItemTemplate>
                                        <tr>
                                            <td align="left">
                                                <asp:Image ID="imgOption" runat="server" Visible="false" />
                                                <asp:Label ID="OrderOptionName" CssClass="OrderOptionsName" runat="server" Text='<%# Container.DataItemAs<OrderOption>().Name %>'></asp:Label>
                                                <asp:Image ID="helpcircle_gif" runat="server" AlternateText='<%# AspDotNetStorefrontCore.AppLogic.GetString("shoppingcart.cs.30",ThisCustomer.SkinID,ThisCustomer.LocaleSetting) %>' Style="cursor: hand; cursor: pointer;" ImageUrl='<%$ Tokens:SkinImage, helpcircle.gif %>' />
                                            </td>
                                            <td align="center">
                                                <asp:Label ID="OrderOptionPrice" CssClass="OrderOptionsPrice" runat="server" Text='<%# DisplayCost(Container.DataItemAs<OrderOption>()) %>' ></asp:Label>
                                            </td>                                                
                                            <td align="center">
                                            
                                                <%--shown as check image on checkout pages other than the shoppingcart--%>
                                                <asp:Image ID="imgSelected" runat="server"
                                                    ImageUrl='<%$ Tokens:SkinImage, selected.gif %>'
                                                    Visible="<%# EditMode == false %>" />
                                                
                                                <aspdnsfc:DataCheckBox ID="chkSelected" runat="server" 
                                                    Data='<%# Container.DataItemAs<OrderOption>().UniqueID %>' 
                                                    Checked="<%# DetermineSelected(Container.DataItemAs<OrderOption>()) %>" 
                                                    Visible="<%# EditMode == true  %>" />
                                                </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>                            
                        </div>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

