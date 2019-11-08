<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="Trans.admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Victory Transport Corp.</title>
    <script src="Content/js/jquery-3.3.1.min.js"></script>
    <!-- Bootstrap -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <link href="Content/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/css/Custom-css.css" rel="stylesheet" />

    <script src="https://cdn.jsdelivr.net/npm/gijgo@1.8.1/combined/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://cdn.jsdelivr.net/npm/gijgo@1.8.1/combined/css/gijgo.min.css" rel="stylesheet" type="text/css" />


    <link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
    <style>
        body {
          font-family: 'Oswald', sans-serif !important;
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #3a634c;">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand" href="Default.aspx">
                    <span>
                        <img alt="Logo" src="Content/Images/logo-png.png" width="50" height="30" class="d-inline-block align-top" /></span>
                    <%--<div style="font-size:80%">--%>
                    <span>Victory Transport Corp.</span>
                    <%--</div>--%>
                </a>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="admin.aspx">Admin Panel<span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Default.aspx">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="LoadMastersiz.aspx">Loads</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="mapzip.aspx">Map</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Reports
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
                                <a class="dropdown-item" href="ReportLoadSummary.aspx">Load Summary</a>
                                <a class="dropdown-item" href="ReportTruck.aspx">Trucks</a>
                                <a class="dropdown-item" href="ReportDriver.aspx">Drivers</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Definitions
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="TruckMaster.aspx">Trucks</a>
                                <a class="dropdown-item" href="DriverMaster.aspx">Drivers</a>
                                <a class="dropdown-item" href="customer.aspx">Customers</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="account.aspx">User Setings</a>
                        </li>
                    </ul>
                    <div class="form-inline my-2 my-lg-0">
                        <asp:Button ID="btnSignOut" runat="server" CssClass="btn btn-outline-success my-2 my-sm-0 btn-sm" Text="Sign Out" OnClick="btnSignOut_Click" />
                    </div>
                </div>
            </nav>
        </div>

        <div class="container">
            <div class="form-horizontal">
                <h3>Welcome Admin! Add User</h3>
                <hr />

                <div class="form-row">
                    <div class="col-4">
                        <asp:Label ID="Label1" runat="server" CssClass="col-form-label" Text="Username"></asp:Label>
                        <asp:TextBox ID="tbUsername" runat="server" CssClass="form-control form-control-sm col-md-8"></asp:TextBox>
                    </div>
                    <div class="col-6">
                        <asp:Label ID="Label2" runat="server" CssClass="col-form-label" Text="Password"></asp:Label>
                        <asp:TextBox ID="tbPassword" runat="server" CssClass="form-control form-control-sm col-md-6"></asp:TextBox>
                    </div>

                </div>

                <div class="form-row">
                    <div class="col-4">
                        <asp:Label ID="Label3" runat="server" CssClass="col-form-label" Text="Name-Surname"></asp:Label>
                        <asp:TextBox ID="tbName" runat="server" CssClass="form-control form-control-sm col-md-8"></asp:TextBox>
                    </div>

                    <div class="col-6">
                        <asp:Label ID="Label4" runat="server" CssClass="col-form-label" Text="Email"></asp:Label>
                        <asp:TextBox ID="tbEmail" runat="server" CssClass="form-control form-control-sm col-md-6"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="col-xs-11 space-vert">
                <asp:Button ID="btSaveUser" runat="server" CssClass="btn btn-success" Text="Save" OnClick="btSaveUser_Click" />
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>


            <hr />
        <h3>Users</h3>

        <div class="panel panel-default">
            <%--user table begins--%>

            <asp:repeater id="rptrUsers" runat="server" OnItemCommand="rptrUsers_ItemCommand">
                <HeaderTemplate>
                    <table class="table table-sm table-striped table-bordered table-hover">
                        <thead style="background-color: #cbd6d0;">
                            <tr>
                                <th class="gj-hidden" scope="col">Uid</th>
                                <th scope="col">Username</th>
                                <th scope="col">Name-Surname</th>
                                <th scope="col">Email</th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <th class="gj-hidden"><%# Eval("Uid") %></th>
                        <td><%# Eval("username") %></td>
                        <td><%# Eval("name") %></td>
                        <td><%# Eval("email") %></td>
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
        <%--user table ends--%>


        </div>


    </form>

    <!---  Footer  -->
    <%--<div class="hr-pos">--%>
        <hr />
    <%--</div>--%>

    <footer>
        <div class="container">
            <p class="float-right"><a href="#">Back To Top</a> </p>
            <p>
                &copy; 2018 victorytransportusa.com &middot; <a href="Default.aspx">Home</a> &middot; <a href="Default.aspx">About</a>
            </p>
        </div>

    </footer>
    <!---  Footer  -->
    
    <script src="Content/js/bootstrap.min.js"></script>

</body>
</html>
