
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="tme.project.demo.model.Place"%>
<%@page import="tme.project.demo.model.Member"%>
<%@page import="tme.project.demo.model.Ticket"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/sticky-footer-navbar.css" rel="stylesheet">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/sticky-footer-navbar.css" rel="stylesheet">

        <link href="css/dataTables.bootstrap.min.css" rel="stylesheet">
        <!-- include a theme, can be included into the core instead of 2 separate files -->

        <title>Detail</title>
        <style>
            form{
                display: inline-block;
            }
            html,body{
                background-color:#EFEFF4;
            }
            thead{
                background: silver;
            }
            .container{
                width: 360px;
            }
            #map {
                height: 300px;
                width: 300px;

            }
            .logout {
                background:#BD4747;
                height: 30px;
                color: white;
                width: 100%;
                padding: 5px;
                position: fixed; 
                top: 0;
                z-index: 9999;

            }


            .logout .studentID{
                background: #BD4747;
                width: 100px;
                height: 15px;
                float: left;
                margin-top: 0px;
                margin-right: 5px;
                margin-left: 5px;
                text-align: center;
                padding: 0px;
                color: white;
            }

            .out {
                float: right;
                font-size: 12px;
                text-align: center;
                margin-right: 15px;


            }
            .out button{
                font-size: 12px;
                margin-right: 5px;
                padding: 3px;
            }
            .out img{
                margin-top: 0px;
                width: 15px;
            }
            .out a{
                color: white;
                margin-top: 5px;
            }
            .header {
                width: 100%;
                height: 50px;
                background:#BD4747;
                color: white ;
                font-size: 10px;
                text-align: center;
                padding:5px;
                position: fixed; 
                top: 30px;
                z-index: 8000;
                border-top:  1.5px white solid;

            }

            .header h2{
                text-align: center;
                font-size: 20px;
                margin-top: 10px;
                margin-right: 35px;

            }
            .header a {
                color: whitesmoke;
                margin-bottom : 15px;
            }
            .navbar-brand{
                padding: 0px;
                margin-left: 15px;
                height: 10px;
            }
            .navbar-brand img{
                width: 20px;
                margin-top: 10px;
            }
            .page-header{
                color: #707070;
                margin-top: 60px;
            }
            .col-md-8{
                color: #707070;
            }
            .panel-heading{
                height: 50px;
            }
           
            .mb-1 {
                margin-bottom: 0.5em;
            }
        </style>

    </head>

    </head>
<body>
    <!-- Begin page content -->
    <div class="logout">


        <div class="out">
            <img src="images\logout .png" alt="">
            <label><a href="Logout"> Log out</a></label> 

        </div> 
        <div class="studentID"> <%=session.getAttribute("member_name")%> </div>



    </div>

    <div class="header">
        <a class="navbar-brand" href="MyEmergency"> <img src="images\left-arrow.png" alt=""></a>
        <h2>More detail</h2> 
    </div>
    <br>
    <br>
    <div class="container">
        <div class="page-header">
            <h4><b>Detail of Notification</b></h4>


            <center>
                <div id="map" class="map">

                </div>
            </center>

            <%
                Ticket t = (Ticket) request.getAttribute("ticket");
                Member m = Member.getMember(t.getUserId());

            %>
        </div><br>

        <div class="row">
            <div class="col-md-8">
                <div class="panel panel-default">
                    <div class="panel-heading"> <h4> <%=t.getName()%> </h4></div>                               
                    <div class="panel-body">              
                        <p> Phone no. : ${ticket.desc}</p>
                        <p> Location : ${ticket.place}</p>
                        <p> Status : ${ticket.statusName}</p>

                    </div>
                </div>
            </div>

            <div class="col-md-4"><div class="panel panel-default">
                    <div class="panel-heading"> <h4><span class="glyphicon glyphicon-user" aria-hidden="true"></span> User Info. </h4></div>                               
                    <div class="panel-body"> 
                        <p> Name : <%=m.getName()%></p>
                        <p> Surname : <%=m.getSurname()%></p>
                        <p> Student ID : <%=m.getStdId()%></p>
                        <p> Faculty : <%=m.getFaculty()%></p>
                        <p> Email : <%=m.getEmail()%></p>
                    </div>
                </div>
            </div>
                    
            <div class="col-md-4"><div class="panel panel-default">
                    <div class="panel-heading"> <h4><span class="glyphicon glyphicon-picture" aria-hidden="true"></span> รูปภาพ </h4></div>
                    <div class="panel-body">
                        <c:choose>
                            <c:when test="${empty ticket.image}">
                                <p class="text-muted text-center">ไม่มีรูปภาพ</p>
                            </c:when>
                            <c:otherwise>
                                <div class="mb-1">
                                    <img src="${ticket.image}" class="img-responsive" />
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>
</detail>
</body>
<script>
    var map;
    var GGM;
    var my_Marker;
    function initMap() {
        var cairo = {lat: <%= t.getLat()%> || 13.6533052, lng: <%= t.getLon()%> || 100.48927819999994};

        var map = new google.maps.Map(document.getElementById('map'), {
            scaleControl: true,
            center: cairo,
            zoom: 18,
            mapTypeControl: false
        });
        var marker = new google.maps.Marker({map: map, position: cairo});
        marker.addListener('click', function () {
            infowindow.open(map, marker);
        });
    }
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAHmKZ96a7T1gvXwMDRzyyGRQgOfFuEet8&sensor=false&callback=initMap"async defer></script>
</html>
