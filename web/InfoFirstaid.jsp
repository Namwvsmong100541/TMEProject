<%-- 
    Document   : InfoFirstaid
    Created on : Nov 1, 2019, 12:03:57 AM
    Author     : LENOVO
--%>


<%@page import="tme.project.demo.model.Firstaid"%>
<%@page import="java.util.List"%>
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
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/sticky-footer-navbar.css" rel="stylesheet">

        <link href="css/dataTables.bootstrap.min.css" rel="stylesheet">
        <!-- include a theme, can be included into the core instead of 2 separate files -->

        <title>First Aid</title>
        <style>
            form{
                display: inline-block;
            }
            html,body{
                background-color:whitesmoke;
                font-family: 'Montserrat', sans-serif ;
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
                padding: 2px;
                font-size: 12px;
            }

            .out {
                float: right;
                font-size: 12px;
                text-align: center;
                margin-right: 15px;
                margin-bottom: 20px;
                color: white;
            }
            .out button{
                font-size: 12px;
                margin-right: 5px;
                padding: 3px;
            }
            .out img{
                margin-top: 0px;
            }
            .out a{
                color: white;

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
                border-top:  1px white solid;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            }

            .header h2{
                text-align: center;
                font-size: 20px;
                margin-top: 10px;
                padding-left: 12px;

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
                margin-bottom: 0px;
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
                        .menubar {
                background: white;
                width: 100%;
                height: 45px;
                border:#CECCCC 1px;
                border-style: solid; 
                position: fixed; 
                bottom:  0px;
                z-index: 8000;

            }
            .menubar img{
                float: right;
                margin-right: 10px;
                margin-top: 7px;
                margin-bottom: 5px;
                padding-right: 40px;
                height: 30px;
            }
        </style>

    </head>

</head>
<body >
        <!-- Begin page content -->
        <div class="logout">


            <div class="out">
                <img src="images\logout .png" alt="">
                <a href="Logout"> Log out</a>

            </div> 
            <div class="studentID"> <%=session.getAttribute("member_name")%> </div>


            <%
                
                Firstaid f = Firstaid.getFirstaid("FirstAid_ID");

            %>

        </div>

        <div class="header">
            <a class="navbar-brand" href="FirstAid"> <img src="images\left-arrow.png" alt=""></a>
            <h2><%=f.getName()%></h2> 
        </div>
    <br>
    <br>
    <div class="container">
        <div class="page-header">
            <h5><b>วิธีการปฐมพยาบาลเบื้องต้น</b></h5>

        </div>

        <div class="row">
            <div class="col-md-8">
                <div class="panel panel-default">
                    <div class="panel-heading"> <h4> <%=f.getName()%> </h4></div>                               
                    <div class="panel-body">              
                        <p> Information : <%=f.getDesc()%> </p>

                    </div>
                </div>
            </div>
        </div>

    </div>
</body>
<div class="menubar">
            <a href="FirstAid"><img src="images\first-aid-kit_1.png" alt=""></a>
            <a href="MyEmergency"><img src="images\checklist (2).png" alt=""></a>
            <a href="AddEmergency"><img src="images\bell (4).png" alt=""></a>
            <a href="Profile"><img src="images\avatar (2).png"alt=""></a>

        </div>
</html>
