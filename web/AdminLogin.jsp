<%-- 
    Document   : AdminLogin
    Created on : Nov 1, 2019, 3:46:36 PM
    Author     : LENOVO
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html  lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Admin Login</title>

        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
        <link rel="stylesheet" href="css\Login.css">
        <link href="css/bootstrap.min.css" rel="stylesheet">
    </head>
    <style>
        .login input{
            margin-bottom: 10px;
            width: 300px;
            
        }
        .login form{
           margin-left: 37%;
        }
        .butlogin{
            
            width: 30px;
        }
        .butlogin input{
            border: 2px gainsboro solid;
            padding-left:  15px;
            padding-right: 15px; 
            padding-top: 2px;
            padding-bottom: 2px;
            margin-left: 90px;
            width: 120px;
            
        }
        .login{
            margin-top: 200px;
        }
    </style>
    <body background="images\loginofficer.jpg" align="center">
        <div class="login">
            <div class="container">
                <img src="images\alarmlogin.png" alt=""><br><br>
                <form action="AdminLogin" method="post">                       
                    <input type="username"  class="form-control" id="exampleUsername" name="username" placeholder="Student ID Or Username">
                    <input type="password" class="form-control" id="examplePassword" name="password" placeholder="Password"><br>
                    <div class="butlogin"><input type="submit" name="submit" class="btn btn-default btn-lg" value="Log in"></input>  </div>
                     
                    <p>   </p>
                </form>

                <%
                    if (request.getAttribute("code") != null) {
                %>



                <div class="alert alert-success alert-<%=(String) request.getAttribute("code")%>">

                    <div class="alert alert-success alert-<%=(String) request.getAttribute("code")%>">                      

                        <strong>
                            <font color="#000000"><%=(String) request.getAttribute("alert")%>
                        </strong> <%=(String) request.getAttribute("message")%>
                        </font>
                    </div>

                    <%
                        }

                    %>

                </div>
            </div>
    </body>

</html>
