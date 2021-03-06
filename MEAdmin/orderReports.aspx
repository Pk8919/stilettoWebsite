<%@ Page Language="C#" AutoEventWireup="true" CodeFile="orderReports.aspx.cs" Inherits="AspDotNetStorefrontAdmin.orderReports" MaintainScrollPositionOnPostback="true" MasterPageFile="~/App_Templates/Admin_Default/AdminMaster.master" %>
<%@ Register TagPrefix="ew" Namespace="eWorld.UI" Assembly="eWorld.UI" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="bodyContentPlaceholder">
<asp:Panel id="pnlOrderReports" runat="server" DefaultButton="btnReport">
    <div id="">
        <div style="margin-bottom: 5px; margin-top: 5px;">
            <asp:Literal ID="ltError" runat="server"></asp:Literal>
        </div>
    </div>
    <div id="container">
        <table border="0" cellpadding="1" cellspacing="0" class="outerTable" width="100%">
            <tr>
                <td>
                    <div class="wrapper">                       
                        <table border="0" cellpadding="0" cellspacing="0" class="innerTable" width="100%">
                            <tr>
                                <td class="titleTable" width="300">
                                    <font class="subTitle"><asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.orderReports.Specifications %>" />:</font>
                                </td>
                                <td style="width: 5px;" />
                                <td style="width: 1px; background-color: #EBEBEB;" />
                                <td style="width: 5px;" />
                                <td class="titleTable">
                                    <font class="subTitle"><asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.rpt_orders.OrderReport %>" />:</font>
                                </td>
                            </tr>
                            <tr>
                                <td class="contentTable" valign="top" width="300">
                                    <div class="wrapperTopBottom">
                                       <!-- Report Controls -->
                                       <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                            <tr>
                                                <td colspan="2" valign="top">
                                                    <div class="wrapperBottom">
                                                        <font class="titleMessage"><asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.common.SelectDates %>" /></font>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="middle">
                                                    <font class="subTitleSmall"><asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.orders.StartDate %>" /></font>
                                                </td>
                                                <td align="left" valign="top">
                                                    <ew:calendarpopup id="dateStart" runat="server" Height="15px" DisableTextboxEntry="False" AllowArbitraryText="False"
								                        padsingledigits="True" nullable="True" calendarwidth="200" Width="80px" showgototoday="True" imageurl="~/App_Themes/Admin_Default/images/calendar.gif"
								                        Font-Size="9px" ButtonStyle-Height="20px">
								                        <weekdaystyle font-size="XX-Small" font-names="Verdana,Helvetica,Tahoma,Arial" forecolor="Black"
									                        backcolor="Gainsboro"></weekdaystyle>
								                        <monthheaderstyle font-size="Small" font-names="Verdana,Helvetica,Tahoma,Arial" font-bold="True" forecolor="White"
									                        backcolor="Gray"></monthheaderstyle>
								                        <offmonthstyle font-size="XX-Small" font-names="Verdana,Helvetica,Tahoma,Arial" forecolor="Gainsboro"
									                        backcolor="Gainsboro"></offmonthstyle>
								                        <gototodaystyle font-size="XX-Small" font-names="Verdana,Helvetica,Tahoma,Arial" forecolor="Black"
									                        backcolor="White"></gototodaystyle>
								                        <todaydaystyle font-size="XX-Small" font-names="Verdana,Helvetica,Tahoma,Arial" forecolor="MediumBlue"
									                        backcolor="Gainsboro"></todaydaystyle>
								                        <dayheaderstyle font-size="XX-Small" font-names="Verdana,Helvetica,Tahoma,Arial" forecolor="Black"
									                        backcolor="Azure"></dayheaderstyle>
								                        <weekendstyle font-size="XX-Small" font-names="Verdana,Helvetica,Tahoma,Arial" forecolor="Red"
									                        backcolor="Gainsboro"></weekendstyle>
								                        <selecteddatestyle borderstyle="Inset" font-size="XX-Small" font-names="Verdana,Helvetica,Tahoma,Arial"
									                        borderwidth="2px" forecolor="MediumBlue" backcolor="Silver"></selecteddatestyle>
								                        <cleardatestyle font-size="XX-Small" font-names="Verdana,Helvetica,Tahoma,Arial" forecolor="Black"
									                        backcolor="White"></cleardatestyle>
							                        </ew:calendarpopup>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="middle">
                                                    <font class="subTitleSmall"><asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.orders.EndDate %>" /></font>
                                                </td>
                                                <td align="left" valign="top">
                                                    <ew:calendarpopup id="dateEnd" runat="server" Height="15px" DisableTextboxEntry="False" AllowArbitraryText="False"
								                        padsingledigits="True" nullable="True"  calendarwidth="200" Width="80px" showgototoday="True" imageurl="~/App_Themes/Admin_Default/images/calendar.gif"
								                        Font-Size="9px" ButtonStyle-Height="20px">
								                        <weekdaystyle font-size="XX-Small" font-names="Verdana,Helvetica,Tahoma,Arial" forecolor="Black"
									                        backcolor="Gainsboro"></weekdaystyle>
								                        <monthheaderstyle font-size="Small" font-names="Verdana,Helvetica,Tahoma,Arial" font-bold="True" forecolor="White"
									                        backcolor="Gray"></monthheaderstyle>
								                        <offmonthstyle font-size="XX-Small" font-names="Verdana,Helvetica,Tahoma,Arial" forecolor="Gainsboro"
									                        backcolor="Gainsboro"></offmonthstyle>
								                        <gototodaystyle font-size="XX-Small" font-names="Verdana,Helvetica,Tahoma,Arial" forecolor="Black"
									                        backcolor="White"></gototodaystyle>
								                        <todaydaystyle font-size="XX-Small" font-names="Verdana,Helvetica,Tahoma,Arial" forecolor="MediumBlue"
									                        backcolor="Gainsboro"></todaydaystyle>
								                        <dayheaderstyle font-size="XX-Small" font-names="Verdana,Helvetica,Tahoma,Arial" forecolor="Black"
									                        backcolor="Azure"></dayheaderstyle>
								                        <weekendstyle font-size="XX-Small" font-names="Verdana,Helvetica,Tahoma,Arial" forecolor="Red"
									                        backcolor="Gainsboro"></weekendstyle>
								                        <selecteddatestyle borderstyle="Inset" font-size="XX-Small" font-names="Verdana,Helvetica,Tahoma,Arial"
									                        borderwidth="2px" forecolor="MediumBlue" backcolor="Silver"></selecteddatestyle>
								                        <cleardatestyle font-size="XX-Small" font-names="Verdana,Helvetica,Tahoma,Arial" forecolor="Black"
									                        backcolor="White"></cleardatestyle>
							                        </ew:calendarpopup>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" valign="top">
                                                    <div class="wrapperTopBottom">
                                                        <font class="titleMessage"><asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.common.SelectRange %>" /></font>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="middle">
                                                    <font class="subTitleSmall">&nbsp;</font>
                                                </td>
                                                <td align="left" valign="top">
                                                    <asp:RadioButtonList runat="server" ID="rblRange" CellPadding="0" CellSpacing="0" RepeatColumns="1">
                                                        <asp:ListItem Value="0" Selected="true" Text="<%$Tokens:StringResource, admin.common.UseDatesAbove %>" />
                                                        <asp:ListItem Value="1" Text="<%$Tokens:StringResource, admin.common.Today %>" />
                                                        <asp:ListItem Value="2" Text="<%$Tokens:StringResource, admin.common.Yesterday %>" />
                                                        <asp:ListItem Value="3" Text="<%$Tokens:StringResource, admin.common.ThisWeek %>" />
                                                        <asp:ListItem Value="4" Text="<%$Tokens:StringResource, admin.common.LastWeek %>" />
                                                        <asp:ListItem Value="5" Text="<%$Tokens:StringResource, admin.common.ThisMonth %>" />
                                                        <asp:ListItem Value="6" Text="<%$Tokens:StringResource, admin.common.LastMonth %>" />
                                                        <asp:ListItem Value="7" Text="<%$Tokens:StringResource, admin.common.ThisYear %>" />
                                                        <asp:ListItem Value="8" Text="<%$Tokens:StringResource, admin.common.LastYear %>" />
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" valign="top">
                                                    <hr noshade="noshade" width="100%" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" valign="top">
                                                    <div class="wrapperBottom">
                                                        <font class="titleMessage"><asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.orderReports.SelectCategory %>" /></font>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="middle">
                                                    <font class="subTitleSmall"><asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.common.Category %>" />:</font>
                                                </td>
                                                <td align="left" valign="top">
                                                    <asp:DropDownList ID="ddCategory" runat="Server"></asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" valign="top">
                                                    <div class="wrapperTopBottom">
                                                        <font class="titleMessage"><asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.orderReports.SelectDepartment %>" /></font>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="middle">
                                                    <font class="subTitleSmall"><asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.common.Section %>" />:</font>
                                                </td>
                                                <td align="left" valign="top">
                                                    <asp:DropDownList ID="ddSection" runat="Server"></asp:DropDownList>
                                                </td>
                                            <tr>
                                                <td colspan="2" valign="top">
                                                    <div class="wrapperTopBottom">
                                                        <font class="titleMessage"><asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.orderReports.SelectManufacturer %>" /></font>
                                                    </div>
                                                </td>
                                            </tr>
                                            </tr>
                                              <tr>
                                                <td align="right" valign="middle">
                                                    <font class="subTitleSmall"><asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.common.Manufacturer %>" /></font>
                                                </td>
                                                <td align="left" valign="top">
                                                    <asp:DropDownList ID="ddManufacturer" runat="Server"></asp:DropDownList>
                                                </td>
                                            </tr>
                                      </table>
                                    </div>
                                    <div class="wrapperTop">
                                        <asp:Button runat="server" ID="btnReport" CssClass="normalButtons" Text="<%$Tokens:StringResource, admin.common.GetReportUC %>" OnClick="btnReport_Click" />                                   
                                    </div>
                                </td>
                                <td style="width: 5px;" />
                                <td style="width: 1px; background-color: #EBEBEB;" />
                                <td style="width: 5px;" />
                                <td class="contentTable" valign="top" width="*">
                                    <div class="wrapperLeft">
                                        <asp:PlaceHolder ID="phMain" runat="server">
                                            <font class="titleMessage">
                                                <asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.orderReports.ReportMatching %>" />:<asp:Literal runat="server" ID="ltMode"></asp:Literal><br />
                                                <asp:Literal runat="server" Text="<%$Tokens:StringResource, admin.orderReports.DollarFigures %>" />  
                                            </font>
                                            <p>
                                                <asp:Literal ID="ltReport" runat="server"></asp:Literal>
                                                <asp:Literal ID="ltScript" runat="server"></asp:Literal>
                                            </p>
                                        </asp:PlaceHolder>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</asp:Panel>
</asp:Content>