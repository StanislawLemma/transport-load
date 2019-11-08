<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mapzip.aspx.cs" Inherits="Trans.mapzip" %>

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
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 500px;
        width: 800px;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      .controls {
        margin-top: 10px;
        border: 1px solid transparent;
        border-radius: 2px 0 0 2px;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
        height: 32px;
        outline: none;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
      }

      #origin-input,
      #destination-input {
        background-color: #fff;
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
        margin-left: 12px;
        padding: 0 11px 0 13px;
        text-overflow: ellipsis;
        width: 200px;
      }

      #origin-input:focus,
      #destination-input:focus {
        border-color: #4d90fe;
      }

      #mode-selector {
        color: #fff;
        background-color: #4d90fe;
        margin-left: 12px;
        padding: 5px 11px 0px 11px;
      }

      #mode-selector label {
        font-family: Roboto;
        font-size: 13px;
        font-weight: 300;
      }
      #right-panel {
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }

      #right-panel select, #right-panel input {
        font-size: 10px;
      }

      #right-panel select {
        width: 100%;
      }

      #right-panel i {
        font-size: 10px;
      }
      #right-panel {
        height: 100%;
        float: right;
        width: 390px;
        overflow: auto;
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
                        <li class="nav-item">
                            <a class="nav-link" href="Default.aspx">Home<span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="LoadMastersiz.aspx">Loads</a>
                        </li>
                        <li class="nav-item active">
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
                        <asp:Button ID="btnSignOut" runat="server" CssClass="btn btn-outline-success my-2 my-sm-0 btn-sm" Text="Sign Out" OnClick="btnSignOut_Click"/>
                    </div>
                </div>
            </nav>
        </div>





        <input id="origin-input" class="controls" type="text"
            placeholder="Enter an origin location">

        <input id="destination-input" class="controls" type="text"
            placeholder="Enter a destination location">

        <div id="mode-selector" class="controls">
            <input type="radio" name="type" id="changemode-walking">
            <label for="changemode-walking">Walking</label>

            <input type="radio" name="type" id="changemode-transit">
            <label for="changemode-transit">Transit</label>

            <input type="radio" name="type" id="changemode-driving" checked="checked">
            <label for="changemode-driving">Driving</label>
        </div>
        <div id="right-panel"></div>
        <div id="map"></div>

        <script>

            function initMap() {
                var map = new google.maps.Map(document.getElementById('map'), {
                    mapTypeControl: false,
                    //center: { lat: ‎40, lng: ‎-74 },
                    center: {lat: 40.71, lng: -73.8195},
                    zoom: 5
                });

                new AutocompleteDirectionsHandler(map);
            }

            /**
             * @constructor
            */
            function AutocompleteDirectionsHandler(map) {
                this.map = map;
                this.originPlaceId = null;
                this.destinationPlaceId = null;
                this.travelMode = 'DRIVING';
                var originInput = document.getElementById('origin-input');
                var destinationInput = document.getElementById('destination-input');
                var modeSelector = document.getElementById('mode-selector');
                this.directionsService = new google.maps.DirectionsService;
                this.directionsDisplay = new google.maps.DirectionsRenderer;
                this.directionsDisplay.setMap(map);
                this.directionsDisplay.setPanel(document.getElementById('right-panel'));

                var originAutocomplete = new google.maps.places.Autocomplete(
                    originInput, { placeIdOnly: true });
                var destinationAutocomplete = new google.maps.places.Autocomplete(
                    destinationInput, { placeIdOnly: true });

                this.setupClickListener('changemode-walking', 'WALKING');
                this.setupClickListener('changemode-transit', 'TRANSIT');
                this.setupClickListener('changemode-driving', 'DRIVING');

                this.setupPlaceChangedListener(originAutocomplete, 'ORIG');
                this.setupPlaceChangedListener(destinationAutocomplete, 'DEST');

                this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(originInput);
                this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(destinationInput);
                this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(modeSelector);
            }

            // Sets a listener on a radio button to change the filter type on Places
            // Autocomplete.
            AutocompleteDirectionsHandler.prototype.setupClickListener = function (id, mode) {
                var radioButton = document.getElementById(id);
                var me = this;
                radioButton.addEventListener('click', function () {
                    me.travelMode = mode;
                    me.route();
                });
            };

            AutocompleteDirectionsHandler.prototype.setupPlaceChangedListener = function (autocomplete, mode) {
                var me = this;
                autocomplete.bindTo('bounds', this.map);
                autocomplete.addListener('place_changed', function () {
                    var place = autocomplete.getPlace();
                    if (!place.place_id) {
                        window.alert("Please select an option from the dropdown list.");
                        return;
                    }
                    if (mode === 'ORIG') {
                        me.originPlaceId = place.place_id;
                    } else {
                        me.destinationPlaceId = place.place_id;
                    }
                    me.route();
                });

            };

            AutocompleteDirectionsHandler.prototype.route = function () {
                if (!this.originPlaceId || !this.destinationPlaceId) {
                    return;
                }
                var me = this;

                this.directionsService.route({
                    origin: { 'placeId': this.originPlaceId },
                    destination: { 'placeId': this.destinationPlaceId },
                    travelMode: this.travelMode
                }, function (response, status) {
                    if (status === 'OK') {
                        me.directionsDisplay.setDirections(response);
                    } else {
                        window.alert('Directions request failed due to ' + status);
                    }
                });
            };

        </script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBwsB0N-QVthc6CIM3AVo9OsbZal9TyCmM&libraries=places&callback=initMap"
            async defer></script>



        <script src="Content/js/bootstrap.min.js"></script>
    </form>
</body>
</html>
