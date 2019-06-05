<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BillingAddressUKEdit.ascx.cs"
    Inherits="VortxControls_BillingAddressUKEdit" %>
<asp:UpdatePanel runat="server" ID="UpdatePanelBillingAddressWrap" RenderMode="Block"
    UpdateMode="Conditional" ChildrenAsTriggers="false">
    <Triggers>
    </Triggers>
    <ContentTemplate>
        <table cellspacing="0" cellpadding="0" id="BillAddressTable" class="billAddressWrap" runat="server">
            
            <tr>
                <td class="addressLabelCell">
                    <asp:Label runat="server" ID="LabelBillFirstName" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.13") %>' />
                </td>
                <td>
                    <asp:TextBox runat="server" ID="BillFirstName" />
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidatorBillFirstName"
                        ControlToValidate="BillFirstName" ErrorMessage='<%# StringResourceProvider.GetString("smartcheckout.aspx.27") %>' Display="Dynamic"
                        EnableClientScript="true" ValidationGroup="VGBillingAddress" Text="*" Enabled="true" />
                </td>
            </tr>
            <tr>
                <td class="addressLabelCell">
                    <asp:Label runat="server" ID="LabelBillLastName" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.14") %>' />
                </td>
                <td>
                    <asp:TextBox runat="server" ID="BillLastName" />
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidatorBillLastName"
                        ControlToValidate="BillLastName" ErrorMessage='<%# StringResourceProvider.GetString("smartcheckout.aspx.15") %>' Display="Dynamic"
                        EnableClientScript="true" ValidationGroup="VGBillingAddress" Text="*" Enabled="true" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Label ID="LabelAddressError" Font-Size="Small" runat="server" ForeColor="Red" Text="" />
                </td>
            </tr>    
                <tr>
                    <td class="addressLabelCell">
                        <asp:Label ID="LabelBillAddress1" runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.17") %>' />
                    </td>
                    <td class="addressInputCell">
                        <asp:TextBox ID="BillAddress1" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorBillAddress1" 
                            runat="server" ControlToValidate="BillAddress1" Display="Dynamic" 
                            EnableClientScript="true" Enabled="true" 
                            ErrorMessage='<%# StringResourceProvider.GetString("smartcheckout.aspx.18") %>' Text="*" 
                            ValidationGroup="VGBillpingAddress" />
                    </td>
                </tr>
                <tr>
                    <td class="addressLabelCell">
                        <asp:Label ID="LabelBillAddress2" runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.19") %>' />
                    </td>
                    <td class="addressInputCell">
                        <asp:TextBox ID="BillAddress2" runat="server" />
                    </td>
                </tr>
                <tr id="PanelBillCityState" runat="server">
                    <td class="addressLabelCell">
                        <asp:Label runat="server" ID="LabelBillZip" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.29") %>' />
                    </td>
                    <td class="addressInputCell">
                        <asp:TextBox runat="server" ID="BillZip" />
                        <asp:RequiredFieldValidator runat="server" ID="RequiredEmailAddress" ControlToValidate="BillZip"
                            ErrorMessage='<%# StringResourceProvider.GetString("smartcheckout.aspx.30") %>' Display="Dynamic" EnableClientScript="true"
                            ValidationGroup="VGBillpingAddress" Text="*" Enabled="true" />
                    </td>
                </tr>
                <tr>
                    <td class="addressLabelCell">
                        <asp:Label ID="LabelBillCity" runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.28") %>' />
                    </td>
                    <td class="addressInputCell">
                        <asp:TextBox ID="BillCity" runat="server" />
                    </td>
                </tr>
                 <tr>
                    <td class="addressLabelCell">
                        <asp:Label ID="LabelBillCounty" runat="server" Text='<%# StringResourceProvider.GetString("smartcheckout.aspx.31") %>' />
                    </td>
                    <td class="addressInputCell">
                        <asp:TextBox ID="BillCounty" runat="server" />
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
