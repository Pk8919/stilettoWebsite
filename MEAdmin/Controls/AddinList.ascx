<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddinList.ascx.cs" Inherits="AspDotNetStorefrontAdmin.Controls.AddinListControl" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Import Namespace="System.AddIn.Hosting" %>
<%@ Import Namespace="AspDotNetStorefront.HostView" %>


<telerik:RadGrid ID="grdAddIns" runat="server" AllowPaging="True" PagerStyle-Position="Bottom" 
    AllowSorting="True"
    GridLines="None" PageSize="30"
    OnDetailTableDataBind="grdAddIns_DetailTableDataBind" >
    
    <ClientSettings>
        <Resizing AllowColumnResize="true" EnableRealTimeResize="true" ResizeGridOnColumnResize="true" ClipCellContentOnResize="false" />
    </ClientSettings>
                    
    <HeaderContextMenu>
        <CollapseAnimation Type="OutQuint" Duration="200"></CollapseAnimation>
    </HeaderContextMenu>
    <PagerStyle HorizontalAlign="Left" Mode="NextPrevNumericAndAdvanced" Position="TopAndBottom"
        AlwaysVisible="True" />
        
        
    <MasterTableView AutoGenerateColumns="False" 
        HierarchyLoadMode="Client" 
        Name="MasterTable" >
        
        <NoRecordsTemplate>
            <p>No addins currently registered</p>
        </NoRecordsTemplate>
        
        <Columns>
            <telerik:GridTemplateColumn HeaderText="Type" UniqueName="TemplateColumn2" ItemStyle-Width="250px" >
                <ItemTemplate>
                    <asp:Label ID="lblDescription" runat="server" 
                        Text='<%# DataItemAs<AddInRegistry>(Container).ViewType.Name %>'></asp:Label>
                </ItemTemplate>
            </telerik:GridTemplateColumn>
            
        </Columns>
        
        <DetailTables>
            <telerik:GridTableView AllowMultiColumnSorting="false"
                runat="server" 
                AutoGenerateColumns="false" 
                Width="100%" 
                PagerStyle-Visible="False" 
                Name="DetailTable" >
                <Columns>
                    <telerik:GridTemplateColumn HeaderText="Name" UniqueName="TemplateColumn2" ItemStyle-Width="250px" >
                        <ItemTemplate>
                            <asp:Label ID="lblName" runat="server" 
                                Text='<%# DataItemAs<AddInToken>(Container).Name %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Description" UniqueName="TemplateColumn2" ItemStyle-Width="250px" >
                        <ItemTemplate>
                            <asp:Label ID="lblDescription" runat="server" 
                                Text='<%# DataItemAs<AddInToken>(Container).Description %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Version" UniqueName="TemplateColumn2" ItemStyle-Width="250px" >
                        <ItemTemplate>
                            <asp:Label ID="lblDescription" runat="server" 
                                Text='<%# DataItemAs<AddInToken>(Container).Version %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Publisher" UniqueName="TemplateColumn2" ItemStyle-Width="250px" >
                        <ItemTemplate>
                            <asp:Label ID="lblPublisher" runat="server" 
                                Text='<%# DataItemAs<AddInToken>(Container).Publisher %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                </Columns>
            </telerik:GridTableView>
        </DetailTables>
        
    </MasterTableView>
    <FilterMenu>
        <CollapseAnimation Type="OutQuint" Duration="200"></CollapseAnimation>
    </FilterMenu>
    
</telerik:RadGrid>