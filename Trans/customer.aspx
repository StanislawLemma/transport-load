<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="customer.aspx.cs" Inherits="Trans.customer" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="form-horizontal">
            <h3>Add Customer</h3>
            <hr />

            <div class="form-row">
                <div class="col-4">
                    <asp:Label ID="Label1" runat="server" class="col-form-label" Text="Title"></asp:Label>
                    <asp:TextBox ID="txtCTitle" runat="server" CssClass="form-control form-control-sm col-md-8"></asp:TextBox>
                </div>

                <div class="col-6">
                    <asp:Label ID="Label3" runat="server" CssClass="col-form-label" Text="Phone"></asp:Label>
                    <asp:TextBox ID="txtCPhone" runat="server" CssClass="form-control form-control-sm col-md-8"></asp:TextBox>
                </div>
            </div>

            <div class="form-row">
                
                <div class="col-4">
                    <asp:Label ID="Label4" runat="server" CssClass="col-form-label" Text="Email"></asp:Label>
                    <asp:TextBox ID="txtCEmail" runat="server" CssClass="form-control form-control-sm col-md-6"></asp:TextBox>
                </div>
                <div class="col-6">
                    <asp:Label ID="Label6" runat="server" CssClass="col-form-label" Text="Address"></asp:Label>
                    <asp:TextBox ID="txtCAddress" textmode="MultiLine" runat="server" CssClass="form-control form-control-sm col-md-8"></asp:TextBox>
                </div>
            </div>

        </div>

        <div class="col-xs-11 space-vert">
            <asp:Button ID="Button1" runat="server" CssClass="btn btn-success" Text="Save" OnClick="btSaveDriver_Click" />
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>


        <hr />
        <h3>Drivers</h3>

        <div class="panel panel-default">
            <%--customer table begins--%>

            <asp:Repeater ID="rptrCustomers" runat="server" OnItemCommand="rptrCustomers_ItemCommand">
                <HeaderTemplate>
                    <table class="table table-sm table-striped table-bordered table-hover">
                        <thead style="background-color: #cbd6d0;">
                            <tr>
                                <th class="gj-hidden" scope="col">Uid</th>
                                <th scope="col">Title</th>
                                <th scope="col">Phone</th>
                                <th scope="col">Email</th>
                                <th scope="col">Address</th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <th class="gj-hidden"><%# Eval("Uid") %></th>
                        <td><%# Eval("title") %></td>
                        <td><%# Eval("phone") %></td>
                        <td><%# Eval("email") %></td>
                        <td><%# Eval("address") %></td>
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
        <%--customer table ends--%>
    </div>
</asp:Content>
