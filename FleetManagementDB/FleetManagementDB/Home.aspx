﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="FleetManagementDB.Home" %>

<!DOCTYPE html>

<html>
<head>
    <title></title>
    <script src="http://maps.googleapis.com/maps/api/js?key=&sensor=false&extension=.js"></script>
    <script src="Scripts/angular.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Style/Style.css" rel="stylesheet" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Style/dashboard.css" rel="stylesheet">
</head>
<body>

    <!--<nav class="navbar navbar-inverse">
        <div class="container">
            <a class="navbar-brand"
               ui-sref="home">ABCD-FleetManagement</a>
            <div class="navbar-header">
                <button type="button"
                        class="navbar-toggle"
                        data-toggle="collapse"
                        data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="navbar-collapse collapse">

            </div>
        </div>
    </nav>-->
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Project name</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">Dashboard</a></li>
                    <li><a href="#">Settings</a></li>
                    <li><a href="#">Profile</a></li>
                    <li><a href="#">Help</a></li>
                </ul>
                
            </div>
        </div>
    </nav>
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-3 col-md-2 sidebar">
                <ul class="nav nav-sidebar">
                    <li class="active"><a href="#">Home <span class="sr-only">(current)</span></a></li>
                    <li><a href="#">Reports</a></li>
                    <li><a href="#">Analytics</a></li>
                    <li><a href="#">Export</a></li>
                </ul>
            </div>
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <div ng-app="mapsApp" ng-controller="MapCtrl">


                    <div id="map"></div>




                </div>
            </div>
                
            </div>
    </div>
            
            <script>
                var trucks = [
            {
                truckid: 'TR1524',
                desc: 'MV111',
                lat: 43.7000,
                long: -79.4000
            },
            {
                truckid: 'TR1525',
                desc: 'MV111',
                lat: 40.6700,
                long: -73.9400
            },
            {
                truckid: 'TR1526',
                desc: 'This is the second best city in the world!',
                lat: 41.8819,
                long: -87.6278
            },
            {
                truckid: 'TR1527',
                desc: 'MV111',
                lat: 34.0500,
                long: -118.2500
            },
            {
                truckid: 'TR1528',
                desc: 'MV111',
                lat: 36.0800,
                long: -115.1522
            }
                ];

                //Angular App Module and Controller
                angular.module('mapsApp', [])
                .controller('MapCtrl', function ($scope) {

                    var mapOptions = {
                        zoom: 4,
                        center: new google.maps.LatLng(40.0000, -98.0000),
                        mapTypeId: google.maps.MapTypeId.TERRAIN
                    }

                    $scope.map = new google.maps.Map(document.getElementById('map'), mapOptions);

                    $scope.markers = [];

                    var infoWindow = new google.maps.InfoWindow();

                    var createMarker = function (info) {

                        var marker = new google.maps.Marker({
                            map: $scope.map,
                            position: new google.maps.LatLng(info.lat, info.long),
                            title: info.truckid,
                            icon: "Images/TMarker.png"
                        });
                        marker.content = '<div class="infoWindowContent">' + info.desc + '</div>';

                        google.maps.event.addListener(marker, 'click', function () {
                            infoWindow.setContent('<h2>' + marker.title + '</h2>' + marker.content);
                            infoWindow.open($scope.map, marker);
                        });

                        $scope.markers.push(marker);

                    }

                    for (i = 0; i < trucks.length; i++) {
                        createMarker(trucks[i]);
                    }

                    $scope.openInfoWindow = function (e, selectedMarker) {
                        e.preventDefault();
                        google.maps.event.trigger(selectedMarker, 'click');
                    }

                });
            </script>



</body>
</html>
