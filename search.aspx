<%@ Page language="c#" Inherits="AspDotNetStorefront.search" CodeFile="search.aspx.cs" MasterPageFile="~/App_Templates/Skin_1/template.master"  %>
<%@ Register TagPrefix="aspdnsf" TagName="XmlPackage" Src="~/Controls/XmlPackageControl.ascx" %>
<%@ Register assembly="AspDotNetStorefrontControls" namespace="AspDotNetStorefrontControls" tagprefix="aspdnsf" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PageContent">
    <asp:Panel ID="pnlContent" runat="server" >
    
        <aspdnsf:Search ID="ctrlPageSearch" runat="server" CssClass="search" 
                SearchButtonCaption="Go" 
                SearchCaption="<%$ Tokens: StringResource, common.cs.82 %>" 
                SearchTextMinLength="<%$ Tokens:AppConfigUSInt, MinSearchStringLength %>" 
                SearchTextMinLengthInvalidErrorMessage="<%$ Tokens: StringResource, search.aspx.2 %>"
                ValidateInputLength="true" 
                />
    
     
        <br />
        
        
        <asp:Literal ID="litSearch" runat="server"></asp:Literal>       
        
    </asp:Panel>
</asp:Content>
