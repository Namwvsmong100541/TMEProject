<%-- 
    Document   : ListAllOfficer
    Created on : Nov 2, 2019, 11:07:04 PM
    Author     : LENOVO
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="tme.project.demo.model.Place"%>
<%@page import="tme.project.demo.model.Ticket"%>
<%@page import="tme.project.demo.model.Member"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link href="css/sticky-footer-navbar.css" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>TME | All Locations</title>

        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <link href="css/dataTables.bootstrap.min.css" rel="stylesheet">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <title>Notification List</title>
        <style>
            html,body{
                background-color:#F5F5F5;
                color: #000000;
            }
            .page-header{
                background-color:#FFFFFF;
                padding-top: 40px ;
                padding-left: 30px;
                padding-right: 30px;
                padding-bottom: 40px;
                color: #000000;
                font-family:Cordia New;
                text-align:center;
            }
            .block1{
                float:right;
            }
            .now{
                float:right;
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
                        <div class="now">
                            <a class="navbar-brand"><font size="3"><font color="#9ACD32"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></font>
                                <%=session.getAttribute("member_name")%> </font></a>
                        </div>
                        <div class="block1">
                            <div id="navbar" class="collapse navbar-collapse">
                                <ul class="nav navbar-nav">
                                    <li><a href="ManageLocation"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add Location</a></li>
                                    <li><a href="ListAllLocation"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> All Locations</a></li>
                                    <li><a href="TransferPage"><span class="glyphicon glyphicon-transfer" aria-hidden="true"></span> Transfer Page</a></li>
                                    <li><a href="Register"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Add Officer</a></li>
                                    <li class="active"><a href="ListAllOfficer"><span class="glyphicon glyphicon-th-list" aria-hidden="true"></span> All Officer</a></li>
                                    <li><a href="AdminLogout"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span> Log out</a></li>
                                </ul>
                            </div>
                        </div><!--/.nav-collapse -->
                    </div>
                </div>
            </div>
        </nav>

        <!-- Begin page content -->
        <div class="container">
            <br>
            <br>
            <br>
            <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Name</th>
                        <th>เพศ</th>
                        <th>ประจำอยู่ที่</th>
                        <th>ติดต่อ</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Member> members = Member.getAllOffices();
                        int count = 1;
                        for (Member m : members) {
                    %>
                    <tr>
                        <td><%=count++%></td>
                        <td><%=m.getName()%>  <%=m.getSurname()%></td>  
                        <td><%=m.getGenderName()%></td>
                        <td><%=m.getFaculty()%></td>
                        <td><%=m.getPhoneNo()%></td>
                        <td>
                <center>

                    <form action="DeleteOfficer" method="post" onsubmit="return confirm('You really want to delete?');">       
                        <button type="submit"><span class="glyphicon glyphicon-trash"  ></span></button>
                        <input type="hidden" name="member_id" value="<%=m.getId()%>"> 
                    </form>  
                </center>
                </td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>


        <!-- Bootstrap core JavaScript
================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

        <script src="js/jquery.dataTables.min.js"></script>
        <script src="js/dataTables.bootstrap.min.js"></script>

        <script type="text/javascript" class="init">
                        $(document).ready(function () {
                            $('#example').DataTable();
                        });
        </script>
    </body>
</html>


