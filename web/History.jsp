
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
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
        <link href="css/sticky-footer-navbar.css" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Report - My Notification</title>

        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/sticky-footer-navbar.css" rel="stylesheet">

        <link href="css/dataTables.bootstrap.min.css" rel="stylesheet">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <title>TME - My Notification</title>
        <style>
            form{
                display: inline-block;
            }
            html,body{
                background-color:#EFEFF4;
                font-family: 'Montserrat', sans-serif ;
            }
            body{
                color: #707070;
            }
            .block2 a{
                color: black;
            }
            .table.dataTable{
                background: whitesmoke;
            }
            thead{
                background: silver;
            }
            .event{
                margin: 10px;
            }
            .eventarea{
                background-color: white;
                border: 0.25px #707070 solid;
                border-radius:8px;
            }
            .timedate,.emergency,.location,.status{
                padding-left: 20px;
            }
            .button1{
                margin-left: 190px;
                margin-bottom: 15px;
                border-radius: 8px;
                background-color: #F58F5A; 
                border: none;
                color: white;
                padding: 5px;
                padding-left: 10px;
                padding-right:  10px;
            }
            .menubar {
                background: whitesmoke;
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
                padding-right: 30px;
                height: 30px;


            }
            .logout {
                background:#F47735;
                height: 30px;
                color: white;
                width: 100%;
                padding: 5px;
                position: fixed; 
                top: 0;
                z-index: 9999;

            }


            .logout .studentID{
                background: #F47735;
                width: 100px;
                height: 15px;
                float: left;
                margin-top: 0px;
                margin-right: 5px;
                margin-left: 5px;
                text-align: center;
                padding: 0px;
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
                background:#F47735;
                color: white ;
                font-size: 10px;
                text-align: center;
                padding:5px;
                position: fixed; 
                top: 30px;
                z-index: 8000;
                border-top:  1.5px white solid;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);

            }

            .header h2{
                text-align: center;
                font-size: 20px;
                margin-top: 10px;
                padding-left: 12px;

            }
            .container{
                padding: 0px;
                margin-top: 30px;

            }
            .notify img{
                width: 20px;
                height: 20px;
                float: right;
                margin:10px;
            }
            .timedate{
                margin-top: 20px;
            }
            .information.a{
                color: whitesmoke;
            }
            .status {
                color: green ;
            }

        </style>
    </head>
    <body>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
        <!-- Begin page content -->
        <div class="logout">


            <div class="out">
                <img src="images\logout .png" alt="">
                <a href="Logout">Log out</a>

            </div> 
            <div class="studentID"> <%=session.getAttribute("member_name")%> </div>



        </div>

        <div class="header">
            <h2>History</h2> 
        </div>
        <div class="container">
            <br>
            <br>
            <br>

            <%
                if (request.getAttribute("tickets") != null) {
                    List<Ticket> tickets = (List) request.getAttribute("tickets");
                    int count = 1;
                    for (Ticket t : tickets) {
                        if (t.getStatusName().equalsIgnoreCase("Completed")) {
            %>
            <div class="event">

                <div class="eventarea">

                    <div class="notify">
                        <img src="images\alarm (1).png" alt="">

                    </div>

                    <div class="timedate">

                        <h6>Date : Time : <%=t.getDateTime()%> </h6>
                    </div>

                    <div class="emergency">
                        <h6>Emergency : <%= t.getName()%> </h6>
                    </div>
                    <div class="location">
                        <h6>Location : <%= t.getPlace()%> </h6>
                    </div>
                    <div class="status">
                        <h6><b>Status : <%=t.getStatusName()%> </b></h6>
                    </div>
                    <div class="information"></div>
                    <a href = "Detail?id=<%=t.getId()%>"><button class="button1">More detail</button></a>
                </div>
            </div>


            <% }
                }

            } else {


            %>

            <tr>
                <td> </td>
                <td><a href = "" target="_blank"> </a></td>
                <td> </td>
                <td> </td>
            </tr>
            <%                        }
            %>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>


        <div class="menubar">

            <a href="History"><img src="images\history (4).png" alt="">
                <a href="StatusAccept"><img src="images\list2.png" alt="">
                    <a href="MyCase"><img src="images\transfer (3).png" alt="">
                        <a href="UpdateStatus"><img src="images\alarm.png" alt="">
                            <a href="Home"><img src="images\home.png" alt="">
                                </div>
                                </body>
                                </html>

