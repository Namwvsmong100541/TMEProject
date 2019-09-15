
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
                        &nbsp &nbsp <a href="MyEmergency"><button type="button" class="btn btn-info" ><span class="glyphicon glyphicon-bell" aria-hidden="true"></span></button></a>
                    </div>
                </div>
            </div> 
            <div id="map" class="map">
            </div>
            <br>
            <div class="container2">
                <form action="AddEmergency" method="post">
                    <div class="row">
                        <div class="col">
                            <input name="lat_value" type="text" id="lat_value"  class="form-control" value="0" /> 
                        </div>
                        <div class="col">
                            <input name="lon_value" type="text" id="lon_value" class="form-control" value="0" />
                        </div>
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
                                    <button type="button" class="btn btn-secondary btn-lg" ><span class="glyphicon glyphicon-camera" aria-hidden="true"></span></button>
                                    <div class="btn-group" role="group" aria-label="Basic example">
                                        <button type="button" class="btn btn-outline-warning"><span class="glyphicon glyphicon-record" aria-hidden="true"></span></button>  
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-3"> 

                            </div>
                            <div class="col-9">
                               <div class="but1">
                                  &nbsp <button type="submit" name="submit" class="btn btn-warning"><span class="glyphicon glyphicon-send" aria-hidden="true"></span> SUBMIT &nbsp 
                                        <input name="member_id" type="hidden" value="<%=session.getAttribute("member_id")%>">
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
<script async defer src="https://maps.googleapis.com/maps/api/js?key=&sensor=false&callback=initMap" type="text/javascript"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>    
<script type="text/javascript" src="js/scriptmap.js"></script>    

</html>
