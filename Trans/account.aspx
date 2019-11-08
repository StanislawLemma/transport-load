<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="account.aspx.cs" Inherits="Trans.account" %>

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
            <%--<nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color: #e3f2fd;" role="navigation">--%>
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
                        <li class="nav-item">
                            <a class="nav-link" href="Default.aspx">Home<span class="sr-only">(current)</span></a>
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
                        <li class="nav-item active">
                            <a class="nav-link" href="account.aspx">User Setings</a>
                        </li>
                    </ul>
                    <div class="form-inline my-2 my-lg-0">
                        <asp:Button ID="btnSignOut" runat="server" CssClass="btn btn-outline-success my-2 my-sm-0 btn-sm" Text="Sign Out" OnClick="btnSignOut_Click" />
                    </div>
                </div>
            </nav>
        </div>

        <%--change password start--%>

    <div class="container">
        <div class="form-horizontal">
            <h2>Change Password</h2>
            <hr />
            
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text="Old Password"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="OldPassword" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label2" runat="server" CssClass="col-md-2 control-label" Text="New Password"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="NewPassword" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label4" runat="server" CssClass="col-md-2 control-label" Text="New Password Again"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="NewPassword2" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Button ID="Button1" runat="server" Text="Update" CssClass="btn btn-default" OnClick="Button1_Click" />
                    <asp:Label ID="Label3" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </div>

    <%--change password end--%>

    </form>
    <!---  Footer  -->
    <hr/>

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
