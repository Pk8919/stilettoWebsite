<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BillingAddressNoZipEdit.ascx.cs"
    Inherits="VortxControls_BillingAddressNoZipEdit" %>
<asp:UpdatePanel runat="server" ID="UpdatePanelBillingAddressWrap" RenderMode="Block"
    UpdateMode="Conditional" ChildrenAsTriggers="false">
    <ContentTemplate>
        <table cellspacing="0" cellpadding="0" id="BillAddressTable" class="billAddressWrap" runat="server">
            
            <tr>
                <td class="addressLabelCell">
                    <asp:Label runat="server" ID="LabelBillFirstName" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.13") %>' /><span style="color:red">*</span>
                </td>
                <td>
                    <asp:TextBox runat="server" ID="BillFirstName" MaxLength="49" />
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidatorBillFirstName"
                        ControlToValidate="BillFirstName" ErrorMessage='<%# StringResourceProvider.GetString("smartcheckout.aspx.27") %>' Display="Dynamic"
                        EnableClientScript="true" ValidationGroup="VGBillingAddress" Text="*" Enabled="true" />
                </td>
            </tr>
            <tr>
                <td class="addressLabelCell">
                    <asp:Label runat="server" ID="LabelBillLastName" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.14") %>' /><span style="color:red">*</span>
                </td>
                <td>
                    <asp:TextBox runat="server" ID="BillLastName" MaxLength="49" />
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidatorBillLastName"
                        ControlToValidate="BillLastName" ErrorMessage='<%# StringResourceProvider.GetString("smartcheckout.aspx.15") %>' Display="Dynamic"
                        EnableClientScript="true" ValidationGroup="VGBillingAddress" Text="*" Enabled="true" />
                </td>
            </tr>
             <tr>
                <td class="addressLabelCell">
                    <asp:Label runat="server" ID="LabelCompany" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.16") %>' />
                </td>
                <td>
                    <asp:TextBox runat="server" ID="BillCompany" MaxLength="99" />
                </td>
            </tr>
            <tr>
                <td class="addressLabelCell">
                    <asp:Label runat="server" ID="LabelBillAddress1" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.17") %>' /><span style="color:red">*</span>
                </td>
                <td>
                    <asp:TextBox runat="server" ID="BillAddress1" MaxLength="99" />
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidatorBillAddress1"
                        ControlToValidate="BillAddress1" ErrorMessage='<%# StringResourceProvider.GetString("smartcheckout.aspx.18") %>' Display="Dynamic"
                        EnableClientScript="true" ValidationGroup="VGBillingAddress" Text="*" Enabled="true" />
                </td>
            </tr>
            <tr>
                <td class="addressLabelCell">
                    <asp:Label runat="server" ID="LabelBillAddress2" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.19") %>' />
                </td>
                <td>
                    <asp:TextBox runat="server" ID="BillAddress2" MaxLength="99" />
                </td>
            </tr>
            <tr>
                <td class="addressLabelCell">
                    <asp:Label runat="server" ID="LabelBillOtherCity" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.28") %>' /><span style="color:red">*</span>
                </td>
                <td>
                    <asp:TextBox runat="server" ID="BillOtherCity" Visible="true" MaxLength="99" />
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidatorBillOtherCity"
                        ControlToValidate="BillOtherCity" ErrorMessage='<%# StringResourceProvider.GetString("smartcheckout.aspx.26") %>' Display="Dynamic"
                        EnableClientScript="true" ValidationGroup="VGBillingOtherAddress" Text="*" Enabled="true" />
                </td>
            </tr>
            <tr>
                <td class="addressLabelCell">
                    <asp:Label runat="server" ID="LabelBillOtherCountry" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.24") %>' /><span style="color:red">*</span>
                </td>
                <td>
                    <asp:DropDownList runat="server" ID="BillOtherCountry" Visible="true" AutoPostBack="true"
                        OnSelectedIndexChanged="BillOtherCountry_OnChanged" OnDataBound="BillOtherCountry_OnDataBound" />
                </td>
            </tr>
            <tr>
                <td class="addressLabelCell">
                    <asp:Label runat="server" ID="LabelBillOtherState" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.25") %>' /><span style="color:red">*</span>
                </td>
                <td>
                    <asp:DropDownList runat="server" ID="BillOtherState" Visible="true" OnDataBound="BillOtherState_OnDataBound" />
                </td>
            </tr>
            <tr id="PanelZipCityState" runat="server">
                <td class="addressLabelCell">
                    <asp:Label runat="server" ID="LabelBillZip" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.20") %>' /><span style="color:red">*</span>
                </td>
                <td>
                    <asp:TextBox runat="server" ID="BillZip" OnTextChanged="BillZip_OnTextChanged" MaxLength="10" />
                    <asp:RequiredFieldValidator runat="server" ID="RequiredBillZip" ControlToValidate="BillZip"
                        ErrorMessage='<%# StringResourceProvider.GetString("smartcheckout.aspx.21") %>' Display="Dynamic" EnableClientScript="true"
                        ValidationGroup="VGBillingAddress" Text="*" Enabled="true" />
                </td>
            </tr>
            
        </table>
        <asp:ValidationSummary ID="VSBillingAddress" runat="server" EnableClientScript="true" CssClass="errorBlock" 
            DisplayMode="List" ValidationGroup="VGBillingAddress" />
        <asp:ValidationSummary ID="VSBillingOtherAddress" runat="server" EnableClientScript="true" CssClass="errorBlock" 
            DisplayMode="List" ValidationGroup="VGBillingOtherAddress" />
        <asp:Panel ID="PanelError" CssClass="errorBlock" runat="server" Visible="false">
            <asp:Label ID="LabelError" runat="server" CssClass="paymentError" />
        </asp:Panel>
    </ContentTemplate>
</asp:UpdatePanel>
