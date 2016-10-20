<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Security_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row jumbotron">
        <h1>Site Administration</h1>
    </div>

    <div class="row">
        <div class="col-md-12">
            <!-- Navigation Tabs -->
            <ul class="nav nav-tabs">
                <li class="active"><a href="#users" data-toggle="tab">Users</a></li>
                <li><a href="#roles" data-toggle="tab">Roles</a></li>
                <li><a href="#unregistered" data-toggle="tab">Unregistered Users</a></li>
            </ul>
            <!-- Create the needed controls for the designated tab -->
            <div class="tab-content">
                <!-- User Tab -->
                <div class="tab-pane fade in active" id="users">
                    <h2>User CRUD</h2>
                </div>

                <!-- Role Tab -->
                <div class="tab-pane fade" id="roles">
                    <asp:ListView ID="RoleListView" runat="server"
                        DataSourceID="RoleListViewODS"
                        InsertItemPosition="LastItem"
                        ItemType="ChinookSystem.Security.RoleProfile"
                        DataKeyNames="RoleId"
                        OnItemDeleted="RefreshAll">
                        <EmptyDataTemplate>
                            <span>No security roles have been set up.</span>
                        </EmptyDataTemplate>
                        <LayoutTemplate>
                            <div class="row bginfo">
                                <div class="col-sm-3 h4">Action</div>
                                <div class="col-sm-3 h4">Role</div>
                                <div class="col-sm-6 h4">Members</div>
                            </div>
                            <div runat="server" id="itemPlaceholder"></div>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <div class="row">
                                <div class="col-sm-3">
                                    <asp:LinkButton ID="RemoveRole" runat="server" CommandName="Delete">Remove</asp:LinkButton>
                                </div>
                                <div class="col-sm-3">
                                    <%# Item.RoleName %>
                                </div>
                                <div class="col-sm-6">
                                    <asp:Repeater ID="RoleUserRepeater" runat="server" DataSource="<%# Item.UserNames %>" ItemType="System.string">
                                        <ItemTemplate>
                                            <%# Item %>
                                        </ItemTemplate>
                                        <SeparatorTemplate>, </SeparatorTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </ItemTemplate>
                        <InsertItemTemplate>
                            <div class="row">
                                <div class="col-sm-1">
                                    <asp:LinkButton ID="InsertRole" runat="server" CommandName="Insert">Insert</asp:LinkButton>
                                </div>
                                <div class="col-sm-2">
                                    <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel">Cancel</asp:LinkButton>
                                </div>
                                <div class="col-sm-6">
                                    <asp:TextBox ID="RoleName" runat="server" Text='<%# BindItem.RoleName %>' placeholder="Role Name"></asp:TextBox>
                                </div>
                            </div>
                        </InsertItemTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="RoleListViewODS" runat="server"
                        DataObjectTypeName="ChinookSystem.Security.RoleProfile"
                        DeleteMethod="RemoveRole"
                        InsertMethod="AddRole"
                        OldValuesParameterFormatString="original_{0}"
                        SelectMethod="ListAllRoles"
                        TypeName="ChinookSystem.Security.RoleManager" />
                </div>

                <!-- Unregistered User Tab -->
                <div class="tab-pane fade" id="unregistered">
                    <asp:GridView ID="UnregisteredUsersGridView" runat="server" AutoGenerateColumns="False" DataSourceID="UnregisteredUsersODS">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id"></asp:BoundField>
                            <asp:BoundField DataField="UserType" HeaderText="UserType" SortExpression="UserType"></asp:BoundField>
                            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName"></asp:BoundField>
                            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName"></asp:BoundField>
                            <asp:TemplateField HeaderText="AssignedUserName" SortExpression="AssignedUserName">
                                <ItemTemplate>
                                    <asp:TextBox runat="server" Text='<%# Bind("AssignedUserName") %>' ID="TextBox1"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="AssignedEmail" SortExpression="AssignedEmail">
                                <ItemTemplate>
                                    <asp:TextBox runat="server" Text='<%# Bind("AssignedEmail") %>' ID="TextBox2"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="UnregisteredUsersODS" runat="server"
                        OldValuesParameterFormatString="original_{0}"
                        SelectMethod="ListAllUnregisteredUsers"
                        TypeName="ChinookSystem.Security.UserManager" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
