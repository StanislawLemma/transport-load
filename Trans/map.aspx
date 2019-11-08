<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="map.aspx.cs" Inherits="Trans.map" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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


    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 500px;
        width: 800px;
      }
     

      #floating-panel {
        position: absolute;
        top: 10px;
        left: 25%;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }
      #right-panel {
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }

      #right-panel select, #right-panel input {
        font-size: 15px;
      }

      #right-panel select {
        width: 100%;
      }

      #right-panel i {
        font-size: 12px;
      }
      #right-panel {
        height: 100%;
        float: right;
        width: 390px;
        overflow: auto;
      }
      #map {
        margin-right: 400px;
      }
      #floating-panel {
        background: #fff;
        padding: 5px;
        font-size: 14px;
        font-family: Arial;
        border: 1px solid #ccc;
        box-shadow: 0 2px 2px rgba(33, 33, 33, 0.4);
        display: none;
      }
      @media print {
        #map {
          height: 500px;
          margin: 0;
        }
        #right-panel {
          float: none;
          width: auto;
        }
      }


    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%--<div class="container">--%>
            <div class="navbar navbar-expand-lg navbar-dark bg-dark" role="navigation">
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
                        <li class="nav-item dropdown active">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Reports
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
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
                            </div>
                        </li>
                    </ul>
                    <div class="form-inline my-2 my-lg-0">
                        <asp:Button ID="btnSignOut" runat="server" CssClass="btn btn-outline-success my-2 my-sm-0 btn-sm" Text="Sign Out" />
                    </div>
                </div>
            </div>
            <%--</div>--%>
        </div>





        <div id="floating-panel">
            <strong>Start:</strong>
            <asp:TextBox ID="start" runat="server" CssClass="form-control form-control-sm col-md-12"></asp:TextBox>
            <br />
            <strong>End:</strong>
            <asp:TextBox ID="end" runat="server" CssClass="form-control form-control-sm col-md-12"></asp:TextBox>
            <input id="submit" type="button" value="Find"/>
        </div>

        <div id="right-panel"></div>
        <div id="map"></div>
        <script>
            function initMap() {
                var directionsDisplay = new google.maps.DirectionsRenderer;
                var directionsService = new google.maps.DirectionsService;
                var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 7,
                    center: { lat: 41.85, lng: -87.65 }
                });

                var geocoder = new google.maps.Geocoder();

                directionsDisplay.setMap(map);
                directionsDisplay.setPanel(document.getElementById('right-panel'));

                var control = document.getElementById('floating-panel');
                control.style.display = 'block';
                map.controls[google.maps.ControlPosition.TOP_CENTER].push(control);

                document.getElementById('submit').addEventListener('click', function () {
                    calculateAndDisplayRoute(directionsService, directionsDisplay, geocoder, map);
                });


                //var onChangeHandler = function () {
                //    calculateAndDisplayRoute(directionsService, directionsDisplay, geocoder);
                //};
                //document.getElementById('start').addEventListener('change', onChangeHandler);
                //document.getElementById('end').addEventListener('change', onChangeHandler);
            }

            function calculateAndDisplayRoute(directionsService, directionsDisplay, geocoder, resultsMap) {
                var start;
                var status2;
                var address = document.getElementById('start').value;
                debugger;
                geocoder.geocode({ 'address': address }, function (results, status) {
                    status2 = status;
                    if (status === 'OK') {
                        //resultsMap.setCenter(results[0].geometry.location);
                        //var marker = new google.maps.Marker({
                        //    map: resultsMap,
                        //    position: results[0].geometry.location
                        //    //start = results[0].geometry.location;
                        //});
                        //start = results[0].geometry.location;
                        start = results[0].place_id;
                    } else {
                    alert('Geocode was not successful for the following reason: ' + status);
                    }
                });

                //var start = document.getElementById('start').value;
                var end = document.getElementById('end').value;
                directionsService.route({
                    origin: start,
                    destination: end,
                    travelMode: 'DRIVING'
                }, function (response, status) {
                    if (status === 'OK') {
                        directionsDisplay.setDirections(response);
                    } else {
                        window.alert('Directions request failed due to ' + status);
                    }
                });
            }
        </script>
        <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBwsB0N-QVthc6CIM3AVo9OsbZal9TyCmM&callback=initMap">
        </script>

        <script src="Content/js/bootstrap.min.js"></script>
    </form>


</body>
</html>
