<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ModalConfigurationAtom.ascx.cs" Inherits="AspDotNetStorefrontAdmin.Controls.ModalConfigurationAtom" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ Register TagPrefix="aspdnsf" TagName="ConfigurationAtom" Src="ConfigurationAtom.ascx" %>

        <asp:UpdatePanel ID="upExtender" runat="server" UpdateMode="Always">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="Click" />
            </Triggers>
            <ContentTemplate>
                <asp:LinkButton ID="btnConfigureAtomConfig" runat="server" Text="configure" />
                <ajax:ModalPopupExtender 
                    ID="mpConfigurationAtom" runat="server" 
                    PopupControlID="pnlConfigurationAtom"
                    TargetControlID="btnConfigureAtomConfig" 
                    BackgroundCssClass="modal_popup_background" 
                    CancelControlID="btnCancelConfiguration"
                    >
                </ajax:ModalPopupExtender>
            </ContentTemplate>
        </asp:UpdatePanel>

        <div style="display: none;">
            
            <asp:Panel ID="pnlConfigurationAtom" runat="server" CssClass="modal_popup atom_modal_popup" Width="825px" ScrollBars="None" DefaultButton="defaultButton">
                <asp:UpdatePanel ID="upModalAtom" UpdateMode="Always" ChildrenAsTriggers="true" runat="server">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                    </Triggers>
                    <ContentTemplate>
                        <div class="modalHolder">
                            <div class="atomfixedheader" id="modaldiv" runat="server">
                                <asp:ImageButton ID="btnCancelConfiguration" CssClass="atomModalClose" OnClick="btnCancelConfiguration_Click" runat="server" src="../App_Themes/Admin_Default/images/delete.png" />
                                <asp:Literal ID="litTitle" runat="server" />
                            </div>
                            <asp:Panel ID="pnlConfigAtomContainer" runat="server" CssClass="pnlOverAtomFixedButtons">
                                <div style="background:white;width:780px;padding:5px 10px;">
                                    <aspdnsf:ConfigurationAtom runat="server" ID="ConfigurationAtom" ShowSaveButton="false" LoadAdvancedConfigs="true" />
                                </div>
                            </asp:Panel>
                            <div class="atomfixedbuttons">
                                <asp:LinkButton ID="btnToggleAdvanced" runat="server" style="float:right;color:White;margin-right:10px;" OnClientClick="$(this).closest('.modalHolder').find('.trConfigAtomAdvanced').toggle();return false;" Text="Toggle Advanced" />
                                <asp:Button ID="btnSave" Text="Save and Close" runat="server" OnClick="btnSave_Click" />
                                <asp:Button ID="btnCancel" Text="Cancel" runat="server" />                            
                                <div style="clear:both;"></div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:Button runat="server" ID="defaultButton" OnClientClick="return false;" style="display:none;" />
            </asp:Panel>
        </div>


        
