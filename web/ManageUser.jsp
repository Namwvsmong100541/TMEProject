<%-- 
    Document   : ManageUser
    Created on : Oct 28, 2019, 9:47:17 PM
    Author     : LENOVO
--%>

<<%@page import="java.util.ArrayList"%>
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
        <title>TME - Add new officer</title>
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
                margin-top: 0px;
            }
            .container{
                width:1000px;
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

                                    <li><a href="ManageLocation"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add Location</a></li>
                                    <li><a href="ListAllLocation"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> All Locations</a></li>
                                    <li><a href="TransferPage"><span class="glyphicon glyphicon-transfer" aria-hidden="true"></span> Transfer Page</a></li>
                                    <li class="active"><a href="Register"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Add Officer</a></li>
                                    <li><a href="ListAllOfficer"><span class="glyphicon glyphicon-th-list" aria-hidden="true"></span> All Officer</a></li>
                                    <li><a href="AdminLogout"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span> Log out</a></li>
                                </ul>
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

                    </br><font size=50> Add new officer of KMUTT </font></h1>
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
                <form action="Register" method="post"> 
                    <div class="row">
                        <div class="col-md-5">
                            <div class="form-group">
                                <label for="exampleName"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> ENTER NAME</label>
                                <font face="Tahoma">
                                <input type="name" class="form-control" id="exampleName" name="name" placeholder="NAME" required="">
                                </font>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="form-group">
                                <label for="exampleSurname"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> ENTER SURNAME</label>
                                <font face="Tahoma">
                                <input type="surname" class="form-control" id="exampleSurname" name="surname" placeholder="SURNAME" required="">
                                </font>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-5">
                            <div class="form-group">
                                <label for="faculty">LOCATION</label>
                                <select id="exampleFaculty" name="faculty" class="form-control" required="">
                                    <option> อยู่ประจำจุดใด ? </option>
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
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="exampleGender"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span> SELECT GENDER</label>
                            <br>
                            <label class="checkbox-inline">
                                <input type="radio" id="inlineCheckbox1" name="gender" value="F" required=""><font color="FF6666"> FEMALE </font>
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" id="inlineCheckbox2" name="gender" value="M" required=""><font color="6666FF"> MALE </font>
                            </label>
                        </div>
                        <div class="col-md-8">
                            <div class="form-group">
                                <label for="exampleEmail"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>  E-MAIL ADDRESS</label>
                                <font face="Tahoma">
                                <input type="Email" class="form-control" id="exampleEmail" name="email" placeholder="EMAIL ADDRESS" required="">
                                </font>
                            </div>
                        </div>

                        <div class="col-md-5">

                            <div class="form-group">
                                <label for="exampleUsername"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> CREATE NEW USERNAME</label>
                                <font face="Tahoma">
                                <input type="username" class="form-control" id="exampleUsername" name="username" placeholder="CREATE USERNAME" required="">
                                </font>
                            </div>
                        </div>  
                        <div class="col-md-5">
                            <div class="form-group">
                                <label for="examplePhoneNo"><span class="glyphicon glyphicon-phone" aria-hidden="true"></span> PHONE NUMBER</label>
                                <font face="Tahoma">
                                <input type="phoneNo" class="form-control" id="examplePhoneNo" name="phoneNo" placeholder="XXX-XXXXXXX" required="">
                            </div>
                        </div>
                    </div>
                    <div class="row">               
                        <div class="col-md-5">
                            <div class="form-group">
                                <label for="exampleNewPassword"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span> CREATE NEW PASSWORD</label>
                                <font face="Tahoma">
                                <input type="password" class="form-control" id="exampleNewPassword" name="password" placeholder="NEW PASSWORD" required="">
                            </div>
                        </div>
                        <div class="row">               

                            <div class="col-md-6">

                                <div class="form-group">
                                    <font face="Cordia New">
                                    <label for="exampleConfirmPassword"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span> CONFIRM PASSWORD</label>
                                    </font>
                                    <font face="Tahoma">
                                    <input type="password" class="form-control" id="exampleConfirmPassword" name="repassword" placeholder="CONFIRM PASSWORD" required="">
                                    </font>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <center>
                                    <button type="submit" name="submit" class="btn btn-default">
                                        <input type="hidden" name="position" value="2">SUBMIT</button>
                                </center>
                            </div>


                        </div>
                    </div>
                </form>
            </div>


            

            <!-- Bootstrap core JavaScript
    ================================================== -->
            <!-- Placed at the end of the document so the pages load faster -->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
            <script src="js/bootstrap.min.js"></script>
    </body>
</html>
