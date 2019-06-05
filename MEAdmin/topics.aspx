<%@ Page Language="C#" AutoEventWireup="true" CodeFile="topics.aspx.cs" Inherits="AspDotNetStorefrontAdmin.topics" MaintainScrollPositionOnPostback="false" MasterPageFile="~/App_Templates/Admin_Default/AdminMaster.master" %>
<%@ Register TagPrefix="aspdnsf" TagName="TopicEditor" Src="controls/TopicEditor.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="bodyContentPlaceholder" runat="server">
    <div id="titlediv" runat="server">
        <div style="margin-bottom: 5px; margin-top: 5px;">
            <asp:Literal ID="ltError" runat="server"></asp:Literal>
        </div>
    </div>
    <div id="container">
            <table border="0" cellpadding="1" cellspacing="0" class="outerTable" width="100%">
                <tr>
                    <td>
                        <div class="wrapper" id="divwrapper" runat="server">                       
                            <table border="0" cellpadding="0" cellspacing="0" class="innerTable" width="100%">
                                <tr>
                                    <td class="titleTable" width="150">
                                        <font class="subTitle"><asp:Literal ID="Literal5" runat="server" Text='<%$ Tokens:StringResource, admin.topic.list %>' /></font>
                                    </td>
                                    <td style="width: 5px;" />
                                    <td style="width: 1px; background-color: #EBEBEB;" />
                                    <td style="width: 5px;" />
                                    <td class="titleTable">
                                        <font class="subTitle"><asp:Literal ID="Literal6" runat="server" Text='<%$ Tokens:StringResource, admin.topic.details %>' /></font>                                  
                                    </td>
                                </tr>
                                <tr>
                                    <td class="contentTable" valign="top" width="150" style="height: 271px">
                                        <div class="wrapperTop">
                                            <asp:Button runat="server" ID="btnAdd" CssClass="normalButtons" Text='<%$ Tokens:StringResource, admin.topic.addnew %>' OnClick="btnAdd_Click" />                                   
                                        </div>
                                        <br />
                                        <div class="wrapperBottom">
                                                <asp:TreeView ID="treeMain" runat="server" OnSelectedNodeChanged="treeMain_SelectedNodeChanged">
                                                </asp:TreeView>
                                        </div>
                                    </td>
                                    <td style="width: 5px; height: 271px;" />
                                    <td style="width: 1px; background-color: #EBEBEB; height: 271px;" />
                                    <td style="width: 5px; height: 271px;" />
                                    <td class="contentTable" valign="top" width="*" style="height: 271px">
                                        <div class="wrapperLeft">
                                            <div style="width: 100%" runat ="server" id="divPageLocale" class="titleMessage">
                                                &nbsp;&nbsp;<asp:Literal ID="Literal9" runat="server" Text='<%$ Tokens:StringResource, admin.common.SelectLocale %>' />&nbsp;
                                                <asp:DropDownList ID="ddlPageLocales" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPageLocales_SelectedIndexChanged"></asp:DropDownList>
                                            </div>
                                            <aspdnsf:TopicEditor runat="server" Visible="false" ID="TopicEditor" 
                                                OnTopicCopiedToStore="TopicEditor_TopicCopiedToStore" 
                                                OnTopicAdded="TopicEditor_TopicAdded"
                                                OnTopicSaved="TopicEditor_TopicSaved"
                                                OnTopicDeleted="TopicEditor_TopicDeleted"
                                                OnTopicNuked="TopicEditor_TopicNuked"
                                                ShowSkinIDField="false"
                                            />
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </asp:Content>