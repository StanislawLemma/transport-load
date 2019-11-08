<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="DriverMaster.aspx.cs" Inherits="Trans.DriverMaster" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="form-horizontal">
            <h3>Add Driver</h3>
            <hr />

            <div class="form-row">
                <div class="col-4">
                    <asp:Label ID="Label1" runat="server" class="col-form-label" Text="Name"></asp:Label>
                    <asp:TextBox ID="txtDName" runat="server" CssClass="form-control form-control-sm col-md-8"></asp:TextBox>
                </div>

                <div class="col-6">
                    <asp:Label ID="Label2" runat="server" CssClass="col-form-label" Text="Surname"></asp:Label>
                    <asp:TextBox ID="txtDSurname" runat="server" CssClass="form-control form-control-sm col-md-6"></asp:TextBox>
                </div>
            </div>

            <div class="form-row">
                <div class="col-4">
                    <asp:Label ID="Label3" runat="server" CssClass="col-form-label" Text="Phone"></asp:Label>
                    <asp:TextBox ID="txtDPhone" runat="server" CssClass="form-control form-control-sm col-md-8"></asp:TextBox>
                </div>
                <div class="col-6">
                    <asp:Label ID="Label4" runat="server" CssClass="col-form-label" Text="Email"></asp:Label>
                    <asp:TextBox ID="txtDEmail" runat="server" CssClass="form-control form-control-sm col-md-6"></asp:TextBox>
                </div>
            </div>

            <div class="form-row">
                <div class="col-4">
                    <asp:Label ID="Label6" runat="server" CssClass="col-form-label" Text="Address"></asp:Label>
                    <asp:TextBox ID="txtDAddress" textmode="MultiLine" runat="server" CssClass="form-control form-control-sm col-md-8"></asp:TextBox>
                </div>
                <div class="col-6">
                    <asp:Label ID="Label5" runat="server" CssClass="col-form-label" Text="SSN"></asp:Label>
                    <asp:TextBox ID="txtDSsn" runat="server" CssClass="form-control form-control-sm col-md-6"></asp:TextBox>
                </div>
            </div>

            <%--<div class="form-group row">
                <div class="col-md-10">
                    <asp:Button ID="btSaveDriver" runat="server" CssClass="btn btn-success btn-lg" Text="Save" OnClick="btSaveDriver_Click" />
                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                </div>
            </div>--%>
        </div>

        <div class="col-xs-11 space-vert">
            <asp:Button ID="Button1" runat="server" CssClass="btn btn-success" Text="Save" OnClick="btSaveDriver_Click" />
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>


        <hr />
        <h3>Drivers</h3>

        <div class="panel panel-default">
            <%--driver table begins--%>

            <asp:Repeater ID="rptrDrivers" runat="server" OnItemCommand="rptrDrivers_ItemCommand">
                <HeaderTemplate>
                    <%--<div class="table-responsive">--%>
                    <table class="table table-sm table-striped table-bordered table-hover">
                        <thead style="background-color: #cbd6d0;">
                            <tr>
                                <th class="gj-hidden" scope="col">Uid</th>
                                <th scope="col">Name</th>
                                <th scope="col">Surname</th>
                                <th scope="col">Phone</th>
                                <th scope="col">Email</th>
                                <th scope="col">SSN</th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <th class="gj-hidden"><%# Eval("Uid") %></th>
                        <td><%# Eval("name") %></td>
                        <td><%# Eval("surname") %></td>
                        <td><%# Eval("phone") %></td>
                        <td><%# Eval("email") %></td>
                        <td><%# Eval("ssn") %></td>
                        <td style="width:  4%">
                            <div class="box">
                                <asp:Button ID="delete" runat="server" CssClass="btn btn-danger btn-sm" Text="DEL" UseSubmitBehavior="False" CommandName="delete" CommandArgument='<%# Eval("Uid") %>' />
                            </div>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
            </table>
                </FooterTemplate>
            </asp:Repeater>

        </div>
        <%--driver table ends--%>
    </div>

</asp:Content>
