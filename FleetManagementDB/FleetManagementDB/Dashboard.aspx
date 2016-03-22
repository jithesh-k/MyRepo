<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="FleetManagementDB.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title></title>
    <script src="http://maps.googleapis.com/maps/api/js"></script>
    <script src="Scripts/angular.min.js"></script> 
    <style type="text/css">
.bgimg {
    background-image: url("Images/TruckN.jpg");
}
        .auto-style1 {
            width: 596px;
            height: 161px;
        }
    </style>


</head>
<body>
    <p>
        <img class="auto-style1" src="Images/TruckN.jpg" usemap="#truck" /></p>
        <map name="truck">
            <area alt="One" shape ="rect" coords="40,158,58,167" href="Map.html" />
            <area alt="two" shape ="rect" coords="137,159,151,162" href="Map.html" />
            <area alt="three" shape ="rect" coords="" href="#" />
        </map>
   
</body>
</html>
