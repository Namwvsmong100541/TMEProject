<%@page import="java.util.Properties"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tme.project.demo.model.Place"%>
<%@page import="java.util.List"%>
<%@page import="tme.project.demo.model.Ticket"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="Content-Security-Policy" content="
              default-src * data: blob: ws: wss: gap://ready file://*;
              style-src * 'unsafe-inline'; 
              script-src * 'unsafe-inline' 'unsafe-eval';
              connect-src * ws: wss:;">
        <meta name="format-detection" content="telephone=no" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Report - Add Ticket</title>

        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/sticky-footer-navbar.css" rel="stylesheet">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Begin page content -->
        <style>
            body{
                color: white;
            }
            .studentID{
                float: left;
            }
            .containerA{
                padding: 5px 15px 0;
            }
            .page-header{
                margin: 10px 0 10px;
            }
            .content .Emer{
                margin-bottom: 15px;
            }
            .studentID{
                margin-top: 5px;
            }
            .out button{
                font-size: 12px;
                margin-right: 5px;
                padding: 4px;
            }
            .container .out{
                margin-right: 1px;
            }
            .but3 .but1 button{
                background: orange;
                border: 1px solid white ;
                font-size: 18px;
                color: white;
            }
            label{
                font-size: 12px;
            }
            .form-group textarea{
                font-size: 10px; 
            }
            .form-group input{
                font-size: 10px;  
            }
            .form-group select{
                font-size: 10px;  
            }
            .but2 button{
                border: 2px solid white ;
                font-size: 13px;
            }
            .but3 button{
                background: khaki;
                color: black;
                border: 1px black ;
            }
        </style>
    <div class="containerA">
        <div class="page-header">
            <title>Emergency Notify</title>
            <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
            <link rel="stylesheet" href="css\Notify.css">
            <body background="images\bg1.jpg" align="center"> 
                <div class="container">
                    <div class="out">
                        <img src="images\logout .png" alt=""> 
                        <label><a href="Logout"><button type="button" class="btn btn-default"> Log out</button></a></label> 
                    </div> 
                    <div class="studentID">
                        <h6> Student ID :  <%=session.getAttribute("member_name")%>
                    </div>
                </div>
        </div>
        <%
            if (request.getAttribute("code") != null) {
        %>
        <div class="alert alert-<%=(String) request.getAttribute("code")%>">
            <strong><%=(String) request.getAttribute("alert")%></strong> 
            <%=(String) request.getAttribute("message")%>
        </div>
        <%
            }
        %>

        <div class="container">
            <div class="Emer">
                <div class="row">
                    <div class="col-9">
                        <h4>EMERGENCY NOTIFY</h4>
                    </div>
                    <div class="col-3">
                        <a href="MyEmergency"><button type="button" class="btn btn-info" ><span class="glyphicon glyphicon-bell" aria-hidden="true"></span>
                                <span class="badge badge-light"> 
                                    <%
                                        try {
                                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                                            Connection con = DriverManager.getConnection("jdbc:mysql://35.240.139.209/TMEApp", "tmepro", "tme123456");
                                            Statement st = con.createStatement();
                                            String strQuery = "SELECT count(*) FROM `Emergency_Notify` WHERE member_id_fk = " + session.getAttribute("member_id");
                                            ResultSet rs = st.executeQuery(strQuery);
                                            String Countrow = "";
                                            while (rs.next()) {
                                                Countrow = rs.getString(1);
                                                out.println(Countrow);
                                            }
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    %>   
                                </span></button></a>
                    </div>
                </div>
            </div> 
            <div id="map" class="map">
            </div>
            <br>
            <div class="container2">
                <form action="AddEmergency" method="post" enctype="multipart/form-data">
                    <div class="row">

                    </div>
                    <div class="but3">
                        <div class="row">
                            <div class="col-8">
                                <label for="title">SPECIFY EMERGENCY</label>                 
                                <textarea name="name" class="form-control" id="desc" rows="3" placeholder="Description" required=""></textarea>

                                <label for="desc">PHONE NUMBER</label>
                                <input name="desc" type="text" class="form-control" id="title" rows="2" placeholder="Phone number" required="">
                                <br>
                            </div>
                            <div class="col-4">
                                <label for="place">LOCATION</label>
                                <select id="exampleFaculty" name="place" class="form-control" required="">
                                    <%
                                        ArrayList<Place> places = Place.getAllPlaces();
                                        for (Place p : places) {
                                    %>
                                    <option value="<%= p.getPlace_name()%>"><%= p.getPlace_name()%></option>
                                    <%
                                        }
                                    %>
                                </select> 
                                <br>
                                &nbsp&nbsp&nbsp
                                <div class="btn-group-vertical" role="group" aria-label="Basic example">
                                    <button onClick="openImageUpload()" id="upload-image-button" type="button" class="btn btn-secondary btn-lg" ><span class="glyphicon glyphicon-camera" aria-hidden="true"></span></button>
                                    <input onChange="previewFile()" id="image-input" name="image" type="file" accept="image/*" style="visibility: hidden; width: 0; height: 0;">
                                </div>
                                <div style="width: 60px; height: 40px; display: inline-block; vertical-align: top;" id="image-preview">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-3"> 

                            </div>

                            <div class="col-9">
                                <div class="but1">
                                    <br>

                                    &nbsp <button type="submit" name="submit" class="btn btn-warning"><span class="glyphicon glyphicon-send" aria-hidden="true"></span> SUBMIT &nbsp 
                                        <input name="member_id" type="hidden" value="<%=session.getAttribute("member_id")%>">
                                        <input name="lat_value"  type="hidden" id="lat_value"  class="form-control" value="0" /> 
                                        <input name="lon_value" type="hidden" id="lon_value" class="form-control" value="0" />          
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <br>
        </div>
    </div>
</body>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>    
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAHmKZ96a7T1gvXwMDRzyyGRQgOfFuEet8&callback=initMap" type="text/javascript"></script>

<script>
    function openImageUpload() {
        var imageInput = document.getElementById("image-input");
        imageInput.click()
    }
    
    function previewFile() {
        var previewBox = document.getElementById("image-preview");

        var file    = document.getElementById("image-input").files[0];
        var reader  = new FileReader();

        reader.onloadend = function () {
          previewBox.innerHTML = '<img src="' + reader.result + '" class="img-responsive" />'
        }

        if (file) {
          reader.readAsDataURL(file);
        } else {
          previewBox.innerHTML = "";
        }
    }
</script>

<script>
    var lat, lng = 0.1;
    var marker, map = null;
    var markers = [];
    var infoWindow;

    function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        var bangkok_latlng = new google.maps.LatLng(13.7563, 100.5018);
        map.setCenter(bangkok_latlng);
        map.setZoom(12);
        infoWindow.setPosition(bangkok_latlng);
        infoWindow.setContent(browserHasGeolocation ?
                'Error: The Geolocation service failed.' :
                'Error: Your browser doesn\'t support geolocation.');
    }

    function initMap() {

        markers = [];

        map = new google.maps.Map(document.getElementById('map'), {
            panControl: false,
            streetViewControl: false,
            mapTypeControl: false,
            zoom: 18,
            zoomControlOptions: {
                style: google.maps.ZoomControlStyle.SMALL,
                position: google.maps.ControlPosition.LEFT_BOTTOM
            },
            mapTypeId: google.maps.MapTypeId.ROADMAP
        });

        infoWindow = new google.maps.InfoWindow();

        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function (position) {
                var pos = {
                    lat: position.coords.latitude,
                    lng: position.coords.longitude
                };

                $("#lat_value").val(pos.lat);
                $("#lon_value").val(pos.lng);

                // infoWindow.setPosition(pos);
                // infoWindow.setContent('Your Location.');
                // infoWindow.open(map);
                map.setCenter(pos);

                marker = new google.maps.Marker({
                    position: pos,
                    map: map,
                    icon: "http://www.ninenik.com/demo/google_map/images/male-2.png",
                    title: 'Your Location.',
                    draggable: true
                });

                google.maps.event.addListener(marker, 'dragend', function (evt) {
                    var my_Point = my_Marker.getPosition();
                    $("#lat_value").val(my_Point.lat());  // เอาค่า latitude ตัว marker แสดงใน textbox id=lat_value  
                    $("#lon_value").val(my_Point.lng());
                    $("#zoom_value").val(map.getZoom());
                    map.setCenter(marker.position);
                    marker.setMap(map);
                });

            }, function () {
                handleLocationError(true, infoWindow, map.getCenter());
            });
        } else {
            // Browser doesn't support Geolocation
            handleLocationError(false, infoWindow, map.getCenter());
        }
    }
</script>

</html>