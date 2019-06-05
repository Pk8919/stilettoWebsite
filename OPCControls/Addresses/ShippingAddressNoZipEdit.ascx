<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ShippingAddressNoZipEdit.ascx.cs"
    Inherits="VortxControls_ShippingAddressNoZipEdit" %>
<asp:UpdatePanel runat="server" ID="UpdatePanelShippingAddressWrap" RenderMode="Block"
    UpdateMode="Conditional" ChildrenAsTriggers="false">
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="ButtonSaveAddress" />
    </Triggers>
    <ContentTemplate>
        <table cellspacing="0" cellpadding="0" id="ShipAddressTable" class="shipAddressWrap"
            runat="server">
            <tr>
                <td class="addressLabelCell">
                    <asp:Label runat="server" ID="LabelShipFirstName" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.13") %>' /><span style="color:red">*</span>
                </td>
                <td class="addressInputCell">
                    <asp:TextBox runat="server" ID="ShipFirstName" MaxLength="49" />
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidatorShipFirstName"
                        ControlToValidate="ShipFirstName" ErrorMessage='<%# StringResourceProvider.GetString("smartcheckout.aspx.27") %>' Display="Dynamic"
                        EnableClientScript="true" ValidationGroup="VGShippingAddress" Text="*" Enabled="true" />
                </td>
            </tr>
            <tr>
                <td class="addressLabelCell">
                    <asp:Label runat="server" ID="LabelShipLastName" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.14") %>' /><span style="color:red">*</span>
                </td>
                <td class="addressInputCell">
                    <asp:TextBox runat="server" ID="ShipLastName" MaxLength="49" />
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidatorShipLastName"
                        ControlToValidate="ShipLastName" ErrorMessage='<%# StringResourceProvider.GetString("smartcheckout.aspx.15") %>' Display="Dynamic"
                        EnableClientScript="true" ValidationGroup="VGShippingAddress" Text="*" Enabled="true" />
                </td>
            </tr>
            <tr>
                <td class="addressLabelCell">
                    <asp:Label runat="server" ID="LabelPhone" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.32") %>' /><span style="color:red">*</span>
                </td>
                <td class="addressInputCell">
                    <asp:TextBox runat="server" ID="TextBoxPhone" MaxLength="25" />
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidatorPhone" ControlToValidate="TextBoxPhone"
                        ErrorMessage='<%# StringResourceProvider.GetString("smartcheckout.aspx.33") %>' Display="Dynamic" EnableClientScript="true"
                        ValidationGroup="VGShippingAddress" Text="*" Enabled="true" />
                </td>
            </tr>
            <tr>
                <td class="addressLabelCell">
                    <asp:Label runat="server" ID="LabelShipCompany" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.16") %>' />
                </td>
                <td class="addressInputCell">
                    <asp:TextBox runat="server" ID="Company" MaxLength="99" />
                </td>
            </tr>
            <tr>
                <td class="addressLabelCell">
                    <asp:Label runat="server" ID="LabelShipAddress1" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.17") %>' /><span style="color:red">*</span>
                </td>
                <td class="addressInputCell">
                    <asp:TextBox runat="server" ID="ShipAddress1" MaxLength="99" />
                    <asp:CustomValidator ID="Address1POBoxNotAllowed" EnableClientScript="false" runat="server"
                        Text="*" ErrorMessage='<%# StringResourceProvider.GetString("smartcheckout.aspx.34") %>'
                        Display="Dynamic" ControlToValidate="ShipAddress1" ValidateEmptyText="false"
                        ValidationGroup="VGShippingAddress" Enabled="true" OnServerValidate="Address1POBoxNotAllowed_ServerValidate" />
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidatorShipAddress1"
                        ControlToValidate="ShipAddress1" ErrorMessage='<%# StringResourceProvider.GetString("smartcheckout.aspx.35") %>'
                        Display="Dynamic" EnableClientScript="true" ValidationGroup="VGShippingAddress"
                        Text="*" Enabled="true" />
                </td>
            </tr>
            <tr>
                <td class="addressLabelCell">
                    <asp:Label runat="server" ID="LabelShipAddress2" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.19") %>' />
                </td>
                <td class="addressInputCell">
                    <asp:TextBox runat="server" ID="ShipAddress2" MaxLength="99" />
                    <asp:CustomValidator ID="Address2POBoxNotAllowed" EnableClientScript="false" runat="server"
                        Text="*" ErrorMessage='<%# StringResourceProvider.GetString("smartcheckout.aspx.34") %>'
                        Display="Dynamic" ControlToValidate="ShipAddress2" ValidateEmptyText="false"
                        ValidationGroup="VGShippingAddress" Enabled="true" OnServerValidate="Address1POBoxNotAllowed_ServerValidate" />
                </td>
            </tr>
            <tr>
                <td class="addressLabelCell">
                    <asp:Label runat="server" ID="LabelShipOtherCity" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.28") %>' /><span style="color:red">*</span>
                </td>
                <td class="addressInputCell">
                    <asp:TextBox runat="server" ID="ShipOtherCity" Visible="true"  MaxLength="99" />
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidatorShipOtherCity"
                        ControlToValidate="ShipOtherCity" ErrorMessage='<%# StringResourceProvider.GetString("smartcheckout.aspx.26") %>' Display="Dynamic"
                        EnableClientScript="true" ValidationGroup="VGShippingOtherAddress" Text="*" Enabled="true" />
                </td>
            </tr>
            <tr>
                <td class="addressLabelCell">
                    <asp:Label runat="server" ID="LabelShipOtherCountry" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.24") %>' /><span style="color:red">*</span>
                </td>
                <td class="addressInputCell">
                    <asp:DropDownList runat="server" ID="ShipOtherCountry" Visible="true" AutoPostBack="true"
                        OnSelectedIndexChanged="ShipOtherCountry_OnChanged" OnDataBound="ShipOtherCountry_OnDataBound" />
                </td>
            </tr>
            <tr>
                <td class="addressLabelCell">
                    <asp:Label runat="server" ID="LabelShipOtherState" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.25") %>' /><span style="color:red">*</span>
                </td>
                <td class="addressInputCell">
                    <asp:DropDownList runat="server" ID="ShipOtherState" Visible="true" OnDataBound="ShipOtherState_OnDataBound" MaxLength="99" />
                </td>
            </tr>
            <tr id="PanelZipCityState" runat="server">
                <td class="addressLabelCell">
                    <asp:Label runat="server" ID="LabelShipZip" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.36") %>' /><span style="color:red">*</span>
                </td>
                <td class="addressInputCell">
                    <asp:TextBox runat="server" ID="ShipZip" />
                    <asp:RequiredFieldValidator runat="server" ID="RequiredEmailAddress" ControlToValidate="ShipZip"
                        ErrorMessage='<%# StringResourceProvider.GetString("smartcheckout.aspx.21") %>' Display="Dynamic" EnableClientScript="true"
                        ValidationGroup="VGShippingAddress" Text="*" Enabled="true" MaxLength="10" />
                </td>
            </tr>
            <tr runat="server" id="PanelShipComments">
                <td class="addressLabelCell">
                    <asp:Label runat="server" ID="LabelShipComments" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.37") %>' />
                </td>
                <td>
                    <asp:TextBox runat="server" ID="ShipComments" TextMode="MultiLine" Rows="2" />
                    <br />
                    <span class="OPEmphasize">
                        <asp:Literal runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.38") %>' />
                    </span>
                </td>
            </tr>
            <tr runat="server" id="PanelResidential">
                <td class="addressLabelCell">
                    <asp:Label runat="server" ID="LabelCommercial" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.39") %>' />
                </td>
                <td class="">
                    <asp:CheckBox runat="server" ID="CheckBoxCommercial" Text="" />
                    <asp:Literal runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.40") %>' />
                </td>
            </tr>
        </table>
        <div class="nextStepWrap">
            <asp:Panel ID="PanelError" runat="server" CssClass="ErrorBox" Visible="false">
                <asp:Label runat="server" ID="LabelError" />
            </asp:Panel>
            <asp:ValidationSummary ID="VSShippingAddress" runat="server" CssClass="ErrorBox"
                EnableClientScript="true" DisplayMode="List" ValidationGroup="VGShippingAddress" />
            <asp:ValidationSummary ID="VSShppingOtherAddress" runat="server" CssClass="ErrorBox"
                EnableClientScript="true" DisplayMode="List" ValidationGroup="VGShippingOtherAddress" />
            <asp:Button ID="ButtonSaveAddress" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.118") %>' runat="server" OnClick="SaveAddress_Click"
                CssClass="OPButton" />
            <div style="clear: both;">
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
