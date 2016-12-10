<%@ Page Title="Track CRUD" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="TrackCRUD.aspx.cs" Inherits="Admin_EntityMaintenance_TrackCRUD" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="my" TagName="MessageUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="jumbotron">
        <h3>Wired CRUD Maintenance</h3>
    </div>
    <%-- The follow is the user control to handle messgaes
         To install the user control, drag from Website onto form --%>
    <my:MessageUserControl runat="server" ID="MessageUserControl" />

    <%--Make sure to add the DataKeyNames property to allow deletes--%>
    <asp:ListView ID="TrackList" runat="server" DataSourceID="TrackListODS" InsertItemPosition="LastItem" DataKeyNames="TrackId">
        <AlternatingItemTemplate>
            <tr style="background-color: #FFF8DC;">
                <td>
                    <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                    <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                </td>
                <%-- Eval is one way, output, display only --%>
                <td>
                    <asp:Label Text='<%# Eval("TrackId") %>' runat="server" ID="TrackIdLabel" Width="75px" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Name") %>' runat="server" ID="NameLabel" /></td>
                <td>
                    <%--<asp:Label Text='<%# Eval("AlbumId") %>' runat="server" ID="AlbumIdLabel" />--%>
                    <asp:DropDownList ID="AlbumList" runat="server" DataSourceID="AlbumODS" DataTextField="DisplayText" DataValueField="PFKeyIdentifier" SelectedValue='<%# Eval("AlbumId") %>'></asp:DropDownList></td>
                <td>
                    <%--<asp:Label Text='<%# Eval("MediaTypeId") %>' runat="server" ID="MediaTypeIdLabel" />--%>
                    <asp:DropDownList ID="MediaTypeList" runat="server" DataSourceID="MediaTypeODS" DataTextField="DisplayText" DataValueField="PFKeyIdentifier" SelectedValue='<%# Eval("MediaTypeId") %>'></asp:DropDownList></td>
                <td>
                    <%--<asp:Label Text='<%# Eval("GenreId") %>' runat="server" ID="GenreIdLabel" />--%>
                    <asp:DropDownList ID="GenreList" runat="server" DataSourceID="GenreODS" DataTextField="DisplayText" DataValueField="PFKeyIdentifier" SelectedValue='<%# Eval("GenreId") %>'></asp:DropDownList></td>
                <td>
                    <asp:Label Text='<%# Eval("Composer") %>' runat="server" ID="ComposerLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Milliseconds") %>' runat="server" ID="MillisecondsLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Bytes") %>' runat="server" ID="BytesLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("UnitPrice") %>' runat="server" ID="UnitPriceLabel" /></td>
                    <!-- Remove the navigation properties from the entity -->
                <%--<td>
                    <asp:Label Text='<%# Eval("MediaType") %>' runat="server" ID="MediaTypeLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Album") %>' runat="server" ID="AlbumLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Genre") %>' runat="server" ID="GenreLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("InvoiceLines") %>' runat="server" ID="InvoiceLinesLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("PlayLists") %>' runat="server" ID="PlayListsLabel" /></td>--%>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color: #008A8C; color: #000000;">
                <td>
                    <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" />
                    <asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" />
                </td>
                <!-- Bind is two way, allows data going out, allows data coming in -->
                <td>
                    <asp:TextBox Text='<%# Bind("TrackId") %>' runat="server" ID="TrackIdTextBox" Width="75px" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Name") %>' runat="server" ID="NameTextBox" /></td>
                <td>
                    <%--<asp:TextBox Text='<%# Bind("AlbumId") %>' runat="server" ID="AlbumIdTextBox" />--%>
                    <asp:DropDownList ID="AlbumList" runat="server" DataSourceID="AlbumODS" DataTextField="DisplayText" DataValueField="PFKeyIdentifier" SelectedValue='<%# Bind("AlbumId") %>'></asp:DropDownList></td>
                <td>
                    <%--<asp:TextBox Text='<%# Bind("MediaTypeId") %>' runat="server" ID="MediaTypeIdTextBox" />--%>
                    <asp:DropDownList ID="MediaTypeList" runat="server" DataSourceID="MediaTypeODS" DataTextField="DisplayText" DataValueField="PFKeyIdentifier" SelectedValue='<%# Bind("MediaTypeId") %>'></asp:DropDownList></td>
                <td>
                    <%--<asp:TextBox Text='<%# Bind("GenreId") %>' runat="server" ID="GenreIdTextBox" />--%>
                    <asp:DropDownList ID="GenreList" runat="server" DataSourceID="GenreODS" DataTextField="DisplayText" DataValueField="PFKeyIdentifier" SelectedValue='<%# Bind("GenreId") %>'></asp:DropDownList></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Composer") %>' runat="server" ID="ComposerTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Milliseconds") %>' runat="server" ID="MillisecondsTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Bytes") %>' runat="server" ID="BytesTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("UnitPrice") %>' runat="server" ID="UnitPriceTextBox" /></td>
                    <%-- Remove the navigation properties from the entity -->
                <td>
                    <asp:TextBox Text='<%# Bind("MediaType") %>' runat="server" ID="MediaTypeTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Album") %>' runat="server" ID="AlbumTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Genre") %>' runat="server" ID="GenreTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("InvoiceLines") %>' runat="server" ID="InvoiceLinesTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("PlayLists") %>' runat="server" ID="PlayListsTextBox" /></td>--%>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" />
                    <asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" />
                </td>
                <td>
                    <asp:TextBox Text='<%# Bind("TrackId") %>' runat="server" ID="TrackIdTextBox" Width="75px" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Name") %>' runat="server" ID="NameTextBox" /></td>
                <td>
                    <%--<asp:TextBox Text='<%# Bind("AlbumId") %>' runat="server" ID="AlbumIdTextBox" />--%>
                    <asp:DropDownList ID="AlbumList" runat="server" DataSourceID="AlbumODS" DataTextField="DisplayText" DataValueField="PFKeyIdentifier" SelectedValue='<%# Bind("AlbumId") %>'></asp:DropDownList></td>
                <td>
                    <%--<asp:TextBox Text='<%# Bind("MediaTypeId") %>' runat="server" ID="MediaTypeIdTextBox" />--%>
                    <asp:DropDownList ID="MediaTypeList" runat="server" DataSourceID="MediaTypeODS" DataTextField="DisplayText" DataValueField="PFKeyIdentifier" SelectedValue='<%# Bind("MediaTypeId") %>'></asp:DropDownList></td>
                <td>
                    <%--<asp:TextBox Text='<%# Bind("GenreId") %>' runat="server" ID="GenreIdTextBox" />--%>
                    <asp:DropDownList ID="GenreList" runat="server" DataSourceID="GenreODS" DataTextField="DisplayText" DataValueField="PFKeyIdentifier" SelectedValue='<%# Bind("GenreId") %>'></asp:DropDownList></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Composer") %>' runat="server" ID="ComposerTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Milliseconds") %>' runat="server" ID="MillisecondsTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Bytes") %>' runat="server" ID="BytesTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("UnitPrice") %>' runat="server" ID="UnitPriceTextBox" /></td>
                    <%-- Remove the navigation properties from the entity -->
                <td>
                    <asp:TextBox Text='<%# Bind("MediaType") %>' runat="server" ID="MediaTypeTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Album") %>' runat="server" ID="AlbumTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Genre") %>' runat="server" ID="GenreTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("InvoiceLines") %>' runat="server" ID="InvoiceLinesTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("PlayLists") %>' runat="server" ID="PlayListsTextBox" /></td>--%>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color: #DCDCDC; color: #000000;">
                <td>
                    <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                    <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                </td>
                <td>
                    <asp:Label Text='<%# Eval("TrackId") %>' runat="server" ID="TrackIdLabel" Width="75px" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Name") %>' runat="server" ID="NameLabel" /></td>
                <td>
                    <%--<asp:Label Text='<%# Eval("AlbumId") %>' runat="server" ID="AlbumIdLabel" />--%>
                    <asp:DropDownList ID="AlbumList" runat="server" DataSourceID="AlbumODS" DataTextField="DisplayText" DataValueField="PFKeyIdentifier" SelectedValue='<%# Eval("AlbumId") %>'></asp:DropDownList></td>
                <td>
                    <%--<asp:Label Text='<%# Eval("MediaTypeId") %>' runat="server" ID="MediaTypeIdLabel" />--%>
                    <asp:DropDownList ID="MediaTypeList" runat="server" DataSourceID="MediaTypeODS" DataTextField="DisplayText" DataValueField="PFKeyIdentifier" SelectedValue='<%# Eval("MediaTypeId") %>'></asp:DropDownList></td>
                <td>
                    <%--<asp:Label Text='<%# Eval("GenreId") %>' runat="server" ID="GenreIdLabel" />--%>
                    <asp:DropDownList ID="GenreList" runat="server" DataSourceID="GenreODS" DataTextField="DisplayText" DataValueField="PFKeyIdentifier" SelectedValue='<%# Eval("GenreId") %>'></asp:DropDownList></td>
                <td>
                    <asp:Label Text='<%# Eval("Composer") %>' runat="server" ID="ComposerLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Milliseconds") %>' runat="server" ID="MillisecondsLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Bytes") %>' runat="server" ID="BytesLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("UnitPrice") %>' runat="server" ID="UnitPriceLabel" /></td>
                    <%-- Remove the navigation properties from the entity -->
                <td>
                    <asp:Label Text='<%# Eval("MediaType") %>' runat="server" ID="MediaTypeLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Album") %>' runat="server" ID="AlbumLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Genre") %>' runat="server" ID="GenreLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("InvoiceLines") %>' runat="server" ID="InvoiceLinesLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("PlayLists") %>' runat="server" ID="PlayListsLabel" /></td>--%>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table runat="server" id="itemPlaceholderContainer" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;" border="1">
                            <tr runat="server" style="background-color: #DCDCDC; color: #000000;">
                                <th runat="server"></th>
                                <th runat="server">ID</th>
                                <th runat="server">Title</th>
                                <th runat="server">Album</th>
                                <th runat="server">Media</th>
                                <th runat="server">Genre</th>
                                <th runat="server">Composer</th>
                                <th runat="server">MSecs</th>
                                <th runat="server">Bytes</th>
                                <th runat="server">$</th>
                                <%-- Remove the navigation properties from the entity
                                <th runat="server">MediaType</th>
                                <th runat="server">Album</th>
                                <th runat="server">Genre</th>
                                <th runat="server">InvoiceLines</th>
                                <th runat="server">PlayLists</th>--%>
                            </tr>
                            <tr runat="server" id="itemPlaceholder"></tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;">
                        <asp:DataPager runat="server" ID="DataPager1">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"></asp:NextPreviousPagerField>
                                <asp:NumericPagerField></asp:NumericPagerField>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"></asp:NextPreviousPagerField>
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color: #ff6a00; font-weight: bold; color: #FFFFFF;">
                <td>
                    <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                    <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                </td>
                <td>
                    <asp:Label Text='<%# Eval("TrackId") %>' runat="server" ID="TrackIdLabel" Width="75px" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Name") %>' runat="server" ID="NameLabel" /></td>
                <td>
                    <%--<asp:Label Text='<%# Eval("AlbumId") %>' runat="server" ID="AlbumIdLabel" />--%>
                    <asp:DropDownList ID="AlbumList" runat="server" DataSourceID="AlbumODS" DataTextField="DisplayText" DataValueField="PFKeyIdentifier" SelectedValue='<%# Eval("AlbumId") %>'></asp:DropDownList></td>
                <td>
                    <%--<asp:Label Text='<%# Eval("MediaTypeId") %>' runat="server" ID="MediaTypeIdLabel" />--%>
                    <asp:DropDownList ID="MediaTypeList" runat="server" DataSourceID="MediaTypeODS" DataTextField="DisplayText" DataValueField="PFKeyIdentifier" SelectedValue='<%# Eval("MediaTypeId") %>'></asp:DropDownList></td>
                <td>
                    <%--<asp:Label Text='<%# Eval("GenreId") %>' runat="server" ID="GenreIdLabel" />--%>
                    <asp:DropDownList ID="GenreList" runat="server" DataSourceID="GenreODS" DataTextField="DisplayText" DataValueField="PFKeyIdentifier" SelectedValue='<%# Eval("GenreId") %>'></asp:DropDownList></td>
                <td>
                    <asp:Label Text='<%# Eval("Composer") %>' runat="server" ID="ComposerLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Milliseconds") %>' runat="server" ID="MillisecondsLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Bytes") %>' runat="server" ID="BytesLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("UnitPrice") %>' runat="server" ID="UnitPriceLabel" /></td>
                    <!-- Remove the navigation properties from the entity -->
                <%--<td>
                    <asp:Label Text='<%# Eval("MediaType") %>' runat="server" ID="MediaTypeLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Album") %>' runat="server" ID="AlbumLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Genre") %>' runat="server" ID="GenreLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("InvoiceLines") %>' runat="server" ID="InvoiceLinesLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("PlayLists") %>' runat="server" ID="PlayListsLabel" /></td>--%>
            </tr>
        </SelectedItemTemplate> 
    </asp:ListView>
    <asp:ObjectDataSource ID="TrackListODS" runat="server" DataObjectTypeName="ChinookSystem.Data.Entities.Track"
        DeleteMethod="DeleteTrack"
        InsertMethod="AddTrack" OldValuesParameterFormatString="original_{0}"
        SelectMethod="ListTracks" TypeName="ChinookSystem.BLL.TrackController"
        UpdateMethod="UpdateTrack" OnDeleted="CheckForException" OnInserted="CheckForException" OnUpdated="CheckForException"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="AlbumODS" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="AlbumList" TypeName="ChinookSystem.BLL.AlbumController"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="MediaTypeODS" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="MediaTypeList" TypeName="ChinookSystem.BLL.MediaTypeController"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="GenreODS" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GenreList" TypeName="ChinookSystem.BLL.GenreController"></asp:ObjectDataSource>
</asp:Content>
