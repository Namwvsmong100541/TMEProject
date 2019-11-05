<%-- 
    Document   : ManageLocation
    Created on : Oct 28, 2019, 9:46:00 PM
    Author     : LENOVO
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="tme.project.demo.model.Place"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
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
        <title>TME - Add new location</title>
        <style>
            html,body{
                background-color:#efeff4;
                color: #000000;
                font-family: 'Montserrat', sans-serif ;
            }
            .page-header{
                background-color:#f47735;
                padding-top: 20px ;
                padding-left: 30px;
                padding-right: 30px;
                padding-bottom: 20px;
                color: white;
                font-family:Cordia New;
                text-align:center;
                border-radius: 5px; 
            }
            .container{
                width:1020px;
                
            }
            .block1{
                float:right;
            }
            .now{
                float:right;
            }
            .navbar{
                background: #f47735;
                color: white;
            }
            .navbar-default .navbar-brand{
                color: white;
            }
            .footer{
                background: whitesmoke;
            }
            .form-group{
                color: #707070;
                margin-left: 235px;
            }
            .form-control{
                width: 500px;
            }
            .btn-default{
            margin-left: 420px;
            }
            .content{
                text-align: center;
                
            }
            .content label{
                margin-right: 560px;
                margin-left: 0px;
            }
        </style>
    </head>
    <body>

        <!-- Fixed navbar -->
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <div class="block2">
                        <a class="navbar-brand" href="ListTickets">TME |</a>

                        <div class="block1">
                            <div id="navbar" class="collapse navbar-collapse">
                                <ul class="nav navbar-nav">

                                    <li class="active"><a href="ManageLocation"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add Location</a></li>
                                    <li><a href="ListAllLocation"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> All Locations</a></li>
                                    <li><a href="TransferPage"><span class="glyphicon glyphicon-transfer" aria-hidden="true"></span> Transfer Page</a></li>
                                    <li><a href="Register"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Add Officer</a></li>
                                    <li><a href="ListAllOfficer"><span class="glyphicon glyphicon-th-list" aria-hidden="true"></span> All Officer</a></li>
                                    <li><a href="AdminLogout"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span> Log out</a></li>
                            </div><!--/.nav-collapse -->
                        </div>
                    </div>
                </div>
                <div class="now">
                    <a class="navbar-brand"><font size="3"><font color="#9ACD32"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></font>
                        <%=session.getAttribute("member_name")%></font></a>
                </div>
            </div>

        </nav>

        <!-- Begin page content -->
        <div class="container">
            <div class="page-header">
                <article>

                    </br><font size=50> Add new location of KMUTT </font></h1>
                </article>
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
            <div class="content">
                <form action="ManageLocation" method="post">
                    <div class="form-group">
                        <label for="title">Add new location name</label>
                        <input name="place_name" type="text" class="form-control" id="title" placeholder="Input name of location" required="">
                    </div>


                    <input name="member_id" type="hidden" value="<%=session.getAttribute("member_id")%>">
                    <button type="submit" name="submit" class="btn btn-default">SUBMIT</button>
                </form>
            </div>
        </div>

        <footer class="footer">
            <div class="container">
                <p class="text-muted">Written by TrippleN</p>
            </div>
        </footer>

        <!-- Bootstrap core JavaScript
================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
