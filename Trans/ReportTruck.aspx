<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportTruck.aspx.cs" Inherits="Trans.ReportTruck" %>

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
    <link href="Content/css/jquery.datetimepicker.css" rel="stylesheet" />

    <link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
    <style>
        body {
          font-family: 'Oswald', sans-serif !important;
        }
        
    </style>
    <script src="Content/js/jspdf.js"></script>
    <script src="Content/js/FileSaver.js"></script>
    <script src="Content/js/jspdf.plugin.table.js"></script>
    <script>
        function generatefromtable() {
            var data = [], fontSize = 12, height = 0, doc;
            doc = new jsPDF('p', 'pt', 'a4', true);
            doc.setFont("times", "normal");
            doc.setFontSize(fontSize);
            //doc.text(20, 20, "hi table");
            data = [];
            data = doc.tableToJson('loadtable');
            height = doc.drawTable(data, {
                xstart: 10,
                ystart: 10,
                tablestart: 40,
                marginleft: 10,
                xOffset: 10,
                yOffset: 15
            });
            //doc.text(50, height + 20, 'hi world');
            doc.save("Loads.pdf");
        }
    </script>
    
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
                        <li class="nav-item">
                            <a class="nav-link" href="Default.aspx">Home<span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="LoadMastersiz.aspx">Loads</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="mapzip.aspx">Map</a>
                        </li>
                        <li class="nav-item dropdown active">
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
                        <asp:Button ID="btnSignOut" runat="server" CssClass="btn btn-outline-success my-2 my-sm-0 btn-sm" Text="Sign Out" OnClick="btnSignOut_Click"/>
                    </div>
                </div>
            </nav>
            <%--</div>--%>
        </div>


        <div class="container">
            <div class="form-horizontal">
                <h3>Truck Report</h3>
                <hr />

                <div class="form-row">
                    <div class="col-3">
                        <asp:Label ID="Label4" runat="server" CssClass="col-form-label" Text="Truck #"></asp:Label>
                        <asp:DropDownList ID="ddlTruckNo" runat="server" CssClass="form-control form-control-sm col-md-6"></asp:DropDownList>
                    </div>

                    <div class="col-3">
                        <asp:Label ID="Label6" runat="server" CssClass="col-form-label" Text="Driver"></asp:Label>
                        <asp:DropDownList ID="ddlDriverName" runat="server" CssClass="form-control form-control-sm col-md-6"></asp:DropDownList>
                    </div>

                    <div class="col-3">
                        <asp:Label ID="Label10" runat="server" CssClass="col-form-label" Text="Pickup Date Start"></asp:Label>
                        <asp:TextBox ID="txtLStartDate" runat="server" CssClass="form-control form-control-sm col-md-6"></asp:TextBox>
                    </div>

                    <div class="col-3">
                        <asp:Label ID="Label9" runat="server" CssClass="col-form-label" Text="Pickup Date End"></asp:Label>
                        <asp:TextBox ID="txtLEndDate" runat="server" CssClass="form-control form-control-sm col-md-6"></asp:TextBox>
                    </div>

                    
                </div>

                <div class="form-row">

                    <div class="col-3">
                        <asp:Label ID="Label12" runat="server" CssClass="col-form-label" Text="Pick Up"></asp:Label>
                        <asp:TextBox ID="txtLPLoc" runat="server" CssClass="form-control form-control-sm col-md-6"> </asp:TextBox>
                    </div>

                    <div class="col-3">
                        <asp:Label ID="Label3" runat="server" CssClass="col-form-label" Text="Delivery"></asp:Label>
                        <asp:TextBox ID="txtLDLoc" runat="server" CssClass="form-control form-control-sm col-md-6"></asp:TextBox>
                    </div>

                    
                    <div class="col-3">
                        <asp:Label ID="Label1" runat="server" class="col-form-label" Text="Load #"></asp:Label>
                        <asp:TextBox ID="txtLoadNo" runat="server" CssClass="form-control form-control-sm col-md-6"></asp:TextBox>
                    </div>
                     
                    <div class="col-3">
                        <asp:Label ID="Label2" runat="server" CssClass="col-form-label" Text="Rate #"></asp:Label>
                        <asp:TextBox ID="txtLRateNo" runat="server" CssClass="form-control form-control-sm col-md-6"> </asp:TextBox>
                    </div>

                </div>

                <div class="form-row">
                    <div class="col-3">
                        <asp:Label ID="Label5" runat="server" CssClass="col-form-label" Text="Min. Load Price"></asp:Label>
                        <asp:TextBox ID="txtMinLoadPrice" runat="server" CssClass="form-control form-control-sm col-md-6"> </asp:TextBox>
                    </div>
                    <div class="col-3">
                        <asp:Label ID="Label7" runat="server" CssClass="col-form-label" Text="Max. Load Price"></asp:Label>
                        <asp:TextBox ID="txtMaxLoadPrice" runat="server" CssClass="form-control form-control-sm col-md-6"> </asp:TextBox>
                    </div>

                    <div class="col-3">
                        <asp:Label ID="Label13" runat="server" CssClass="col-form-label" Text="Min. Driver Fee"></asp:Label>
                        <asp:TextBox ID="txtMinDriverFee" runat="server" CssClass="form-control form-control-sm col-md-6"> </asp:TextBox>
                    </div>
                    <div class="col-3">
                        <asp:Label ID="Label14" runat="server" CssClass="col-form-label" Text="Max. Driver Fee"></asp:Label>
                        <asp:TextBox ID="txtMaxDriverFee" runat="server" CssClass="form-control form-control-sm col-md-6"> </asp:TextBox>
                    </div>
                </div>

                <div class="col-xs-11 space-vert">
                    <div class="btn-group" role="group" aria-label="Output Buttons">
                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-success" Text="Search" OnClick="btSaveLoad_Click" />
                        <asp:Button ID="Button2" runat="server" CssClass="btn btn-warning" Text="Clear Selections" OnClick="btClearLoad_Click" />
                    </div>
                </div>
            </div>

            <hr />
            <h3 id="midTitle" runat="server">Active Loads</h3>

            <div class="panel panel-default">
                <%--load table begins--%>

                <asp:Repeater ID="rptrLoads" runat="server">
                    <HeaderTemplate>
                        <div class="table-responsive">
                        <table id="loadtable" class="table table-sm table-striped table-bordered table-hover">
                            <thead style="background-color: #cbd6d0;">
                                    <tr>
                                        <th scope="col">Truck #</th>
                                        <th scope="col">Pickup Date</th>
                                        <th scope="col">Pickup</th>
                                        <th scope="col">Delivery Date</th>
                                        <th scope="col">Delivery</th>
                                        <th scope="col">Rate #</th>
                                        <th scope="col">Load #</th>
                                        <th scope="col">Driver</th>
                                        <th scope="col">Load Price</th>
                                        <th scope="col">Driver Fee</th>
                                        <th scope="col">Total Cost</th>
                                        <th scope="col">Explntn</th>
                                    </tr>
                                </thead>
                                <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("truck_no") %></td>
                            <td><%# Eval("start_date") %></td>
                            <td><%# Eval("pick_loc") %></td>
                            <td><%# Eval("end_date") %></td>
                            <td><%# Eval("del_loc") %></td>
                            <td><%# Eval("rate_no") %></td>
                            <td><%# Eval("no") %></td>
                            <td><%# Eval("driver_name") %></td>
                            <td class="load_price"><%# Eval("load_price") %></td>
                            <td class="driver_price"><%# Eval("driver_fee") %></td>
                            <td><%# Eval("total_cost") %></td>
                            <td><%# Eval("explanation") %></td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </tbody>
            </table>
                        <div class="table-responsive">
                    </FooterTemplate>
                </asp:Repeater>


                <div class="container">
                    <div class="form-horizontal">
                        <div class="form-row">
                            <div class="btn-group" role="group" aria-label="Output Buttons">
                                <asp:Button ID="excel" runat="server" CssClass="btn btn-outline-success" Text="Excel" />
                                <asp:Button ID="pdf" runat="server" CssClass="btn btn-outline-success" Text="PDF" OnClientClick="generatefromtable()" />
                            </div>
                        
                            <div class="col-6"></div>
                            <strong>
                                <asp:Label ID="Label15" runat="server" CssClass="col-form-label" Text="Total Load Cost:"></asp:Label>
                                <asp:Label ID="load_result" runat="server" CssClass="col-sm-2 col-form-label"></asp:Label>


                                <asp:Label ID="Label17" runat="server" CssClass="col-form-label" Text="Total Driver Cost:"></asp:Label>
                                <asp:Label ID="driver_result" runat="server" CssClass="col-sm-2 col-form-label"></asp:Label>
                            </strong>
                        </div>
                    </div>
                </div>

            </div>

            <script>
                $(calculateLoadSum);
                $(calculateDriverSum);

                function calculateLoadSum() {

                    var sum = 0;
                    // iterate through each td based on class and add the values
                    $(".load_price").each(function () {

                        var value = $(this).text();
                        // add only if the value is number
                        if (!isNaN(value) && value.length != 0) {
                            sum += parseFloat(value);
                        }
                    });

                    var n = sum.toString();

                    var final = n.concat(" ", "$")

                    $('#load_result').text(final);
                };

                function calculateDriverSum() {

                    var sum = 0;
                    // iterate through each td based on class and add the values
                    $(".driver_price").each(function () {

                        var value = $(this).text();
                        // add only if the value is number
                        if (!isNaN(value) && value.length != 0) {
                            sum += parseFloat(value);
                        }
                    });

                    var n = sum.toString();

                    var final = n.concat(" ", "$")

                    $('#driver_result').text(final);
                };
            </script>

        </div>


    </form>

    <!---  Footer  -->
    
    <hr />
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
    <script src="Content/js/jquery.table2excel.js"></script>
    <script src="Content/js/jquery.datetimepicker.full.js"></script>
    <script>
        $('#excel').click(function () {
            $('.table').table2excel({
                exclude: ".noExl",
                name: "Loads",
                filename: "Load Data"
            });
        });
    </script>

    <script>
        /*jslint browser:true*/
        /*global jQuery, document*/

        jQuery(document).ready(function () {
            'use strict';

            jQuery('#txtLStartDate, #txtLEndDate').datetimepicker();
        });
    </script>
</body>
</html>
