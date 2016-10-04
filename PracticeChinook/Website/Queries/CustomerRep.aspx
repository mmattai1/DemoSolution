<%@ Page Title="Customer of Rep" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CustomerRep.aspx.cs" Inherits="Queries_CustomerRep" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>Customer of Representative</h1>
    <asp:Label ID="RepresentativeLabel" runat="server" Text="Select a representative" />&nbsp&nbsp
    <asp:DropDownList ID="RepresentativeDropDown" runat="server" DataSourceID="RepresentativeODS" DataTextField="Name" DataValueField="EmployeeId" /><br />
    <asp:Button ID="Fetch" runat="server" Text="Fetch" /><br />
    <asp:GridView ID="CustomerRepList" runat="server" AutoGenerateColumns="False" DataSourceID="CustomerRepODS">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City"></asp:BoundField>
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State"></asp:BoundField>
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone"></asp:BoundField>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="CustomerRepODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="RepresentativeCustomers_Get" TypeName="ChinookSystem.BLL.CustomerController">
        <SelectParameters>
            <asp:ControlParameter ControlID="RepresentativeDropDown" PropertyName="SelectedValue" Name="employeeID" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="RepresentativeODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="EmployeeNames_Get" TypeName="ChinookSystem.BLL.EmployeeController"></asp:ObjectDataSource>
</asp:Content>
