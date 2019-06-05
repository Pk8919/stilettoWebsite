<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ShippingAddressUKEdit.ascx.cs"
    Inherits="VortxControls_ShippingAddressUKEdit" %>
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
                    <asp:Label runat="server" ID="LabelShipFirstName" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.13") %>' />
                </td>
                <td class="addressInputCell">
                    <asp:TextBox runat="server" ID="ShipFirstName" />
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidatorShipFirstName"
                        ControlToValidate="ShipFirstName" ErrorMessage='<%# StringResourceProvider.GetString("smartcheckout.aspx.27") %>' Display="Dynamic"
                        EnableClientScript="true" ValidationGroup="VGShippingAddress" Text="*" Enabled="true" />
                </td>
            </tr>
            <tr>
                <td class="addressLabelCell">
                    <asp:Label runat="server" ID="LabelShipLastName" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.14") %>' />
                </td>
                <td class="addressInputCell">
                    <asp:TextBox runat="server" ID="ShipLastName" />
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidatorShipLastName"
                        ControlToValidate="ShipLastName" ErrorMessage='<%# StringResourceProvider.GetString("smartcheckout.aspx.15") %>' Display="Dynamic"
                        EnableClientScript="true" ValidationGroup="VGShippingAddress" Text="*" Enabled="true" />
                </td>
            </tr>
                <tr>
                    <td class="addressLabelCell">
                        <asp:Label ID="LabelPhone" runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.32") %>' />
                    </td>
                    <td class="addressInputCell">
                        <asp:TextBox ID="TextBoxPhone" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPhone" runat="server" 
                            ControlToValidate="TextBoxPhone" Display="Dynamic" EnableClientScript="true" 
                            Enabled="true" ErrorMessage='<%# StringResourceProvider.GetString("smartcheckout.aspx.33") %>' Text="*" 
                            ValidationGroup="VGShippingAddress" />
                    </td>
                </tr>
           
                <tr>
                    <td class="addressLabelCell">
                        <asp:Label ID="LabelShipAddress1" runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.17") %>' />
                    </td>
                    <td class="addressInputCell">
                        <asp:TextBox ID="ShipAddress1" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorShipAddress1" 
                            runat="server" ControlToValidate="ShipAddress1" Display="Dynamic" 
                            EnableClientScript="true" Enabled="true" 
                            ErrorMessage='<%# StringResourceProvider.GetString("smartcheckout.aspx.35") %>' Text="*" 
                            ValidationGroup="VGShippingAddress" />
                    </td>
                </tr>
                <tr>
                    <td class="addressLabelCell">
                        <asp:Label ID="LabelShipAddress2" runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.19") %>' />
                    </td>
                    <td class="addressInputCell">
                        <asp:TextBox ID="ShipAddress2" runat="server" />
                    </td>
                </tr>
                <tr id="PanelZipCityState" runat="server">
                    <td class="addressLabelCell">
                        <asp:Label runat="server" ID="LabelShipZip" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.29") %>' />
                    </td>
                    <td class="addressInputCell">
                        <asp:TextBox runat="server" ID="ShipZip" />
                        <asp:RequiredFieldValidator runat="server" ID="RequiredEmailAddress" ControlToValidate="ShipZip"
                            ErrorMessage='<%# StringResourceProvider.GetString("smartcheckout.aspx.21") %>' Display="Dynamic" EnableClientScript="true"
                            ValidationGroup="VGShippingAddress" Text="*" Enabled="true" />
                    </td>
                </tr>
                <tr>
                    <td class="addressLabelCell">
                        <asp:Label ID="LabelShipCity" runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.28") %>' />
                    </td>
                    <td class="addressInputCell">
                        <asp:TextBox ID="ShipCity" runat="server" />
                    </td>
                </tr>
                 <tr>
                    <td class="addressLabelCell">
                        <asp:Label ID="LabelShipCounty" runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.31") %>' />
                    </td>
                    <td class="addressInputCell">
                        <asp:TextBox ID="ShipCounty" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="addressLabelCell">
                        <asp:Label ID="LabelShipComments" runat="server" 
                            Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.37") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ShipComments" runat="server" Rows="2" TextMode="MultiLine" />
                        <br />
                        <span class="OPEmphasize">
                            <asp:Literal runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.38") %>' />
                        </span>
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
            <asp:Button ID="ButtonSaveAddress" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.119") %>' runat="server" OnClick="SaveAddress_Click"
                CssClass="OPButton" />
            <div style="clear: both;">
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
