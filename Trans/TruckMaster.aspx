<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="TruckMaster.aspx.cs" Inherits="Trans.TruckMaster" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="form-horizontal">
            <h3>Add Truck</h3>
            <hr />

            <div class="form-row">
                <div class="col-4">
                    <asp:label id="Label1" runat="server" cssclass="col-form-label" text="Truck #"></asp:label>
                    <asp:textbox id="tbTNo" runat="server" cssclass="form-control form-control-sm col-md-8"></asp:textbox>
                </div>
                <div class="col-6">
                    <asp:label id="Label2" runat="server" cssclass="col-form-label" text="Plate"></asp:label>
                    <asp:textbox id="tbTPlate" runat="server" cssclass="form-control form-control-sm col-md-6"></asp:textbox>
                </div>
            
            </div>
                
            <div class="form-row">
                <div class="col-4">
                    <asp:label id="Label3" runat="server" cssclass="col-form-label" text="Model"></asp:label>
                    <asp:textbox id="tbTModel" runat="server" cssclass="form-control form-control-sm col-md-8"></asp:textbox>
                </div>
            
                <div class="col-6">
                    <asp:label id="Label4" runat="server" cssclass="col-form-label" text="Year"></asp:label>
                    <asp:textbox id="tbTYear" runat="server" cssclass="form-control form-control-sm col-md-6"></asp:textbox>
                </div>
            </div>

            <%--<div class="form-group row">
                <div class="col-md-10">
                    <asp:button id="btSaveTruck" runat="server" cssclass="btn btn-success btn-lg" text="Save" onclick="btSaveTruck_Click" />
                    <asp:label id="lblMsg" runat="server"></asp:label>
                </div>
            </div>--%>
        </div>

        <div class="col-xs-11 space-vert">
            <asp:Button ID="btSaveTruck" runat="server" CssClass="btn btn-success" Text="Save" OnClick="btSaveTruck_Click" />
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>

        <hr />
        <h3>Trucks</h3>

        <div class="panel panel-default">
            <%--truck table begins--%>

            <asp:repeater id="rptrTrucks" runat="server" OnItemCommand="rptrTrucks_ItemCommand">
                <HeaderTemplate>
                    <table class="table table-sm table-striped table-bordered table-hover">
                        <thead style="background-color: #cbd6d0;">
                            <tr>
                                <th class="gj-hidden" scope="col">Uid</th>
                                <th scope="col">#</th>
                                <th scope="col">Plate</th>
                                <th scope="col">Model</th>
                                <th scope="col">Year</th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <th class="gj-hidden"><%# Eval("Uid") %></th>
                        <td><%# Eval("no") %></td>
                        <td><%# Eval("plate") %></td>
                        <td><%# Eval("model") %></td>
                        <td><%# Eval("year") %></td>
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
            </asp:repeater>

        </div>
        <%--truck table ends--%>
    </div>

</asp:Content>
