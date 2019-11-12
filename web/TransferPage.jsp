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
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>TME | Transfer Page </title>

        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <link href="css/dataTables.bootstrap.min.css" rel="stylesheet">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <title>TME - Transfer </title>
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
                width:1150px;

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
            .eventarea{
                background-color: white;
                border: 0.20px #707070 solid;
                border-radius:8px;
                margin-bottom: 10px;
                padding-left: 30px;
            }

            .notify img{
                width: 20px;
                height: 20px;
                float: right;
                margin:10px;
            }
            .emergency h6{
                margin-top: 30px;
            }

            .status_time{
                height: 120px;
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
                                    <li class="active"><a href="TransferPage"><span class="glyphicon glyphicon-transfer" aria-hidden="true"></span>  Transfer Page</a></li>
                                    <li><a href="TransferedCase"><span class="glyphicon glyphicon-check" aria-hidden="true"></span>  Transfered </a></li>
                                    <li><a href="Register"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>Add Officer</a></li>
                                    <li ><a href="ListAllOfficer"><span class="glyphicon glyphicon-th-list" aria-hidden="true"></span> All Officer</a></li>
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
            <%
                if (request.getAttribute("tickets") != null) {
                    List<Ticket> tickets = (List) request.getAttribute("tickets");
                    int count = 1;
                    for (Ticket t : tickets) {
                        if (t.getStatusName().equalsIgnoreCase("Waiting for response")) {
            %>


            <div class="event">

                <div class="eventarea">

                    <div class="notify">
                        <img src="images\alarm (1).png" alt="">

                    </div>

                    <div class="emergency">

                        <h6>Emergency : <%= t.getName()%> </h6>
                    </div>

                    <div class="timedate">
                        <h6>Date : Time : <span class="updated"><%=t.getDateTime()%></span></h6>
                    </div>
                    <div class="contact_person">
                        <h6>Location : <%=t.getPlace()%>  </h6> 
                    </div>


                    <div class="status_time">
                        <h6>Counting time : <span id="countdown-<%=count++%>"></span> </h6>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <div class="Confirm">
                                        <form action="TransferPage" method="post" onsubmit="return confirm('Comfirm transfer this case?');">  
                                            <select id="exampleFaculty" name="member_id" class="form-control" required="">
                                                <option> ส่งต่อให้เจ้าหน้าที่ที่ประจำจุดใด ? </option>
                                                <%
                                                    List<Member> members = Member.getAllOffices();
                                                    for (Member m : members) {
                                                %>
                                                <option value="<%=m.getId()%>"><%=m.getName()%> ตึก <%=m.getFaculty()%></option>
                                                <%
                                                    }
                                                %>
                                            </select> 
                                            <br>

                                            <input type="hidden" name="id" value="<%=t.getId()%>">
                                            <input type="hidden" name="status" value="0">      

                                            <button class="button1">Transfer Case</button></a>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>




                <tr>
                    <td> </td>
                    <td><a href = "" target="_blank"> </a></td>
                    <td> </td>
                    <td> </td>
                </tr>
                <% }
                    }

                } else {


                %>


                <%                        }
                %>
            </div>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
            <script src="js/bootstrap.min.js"></script>
            <script>
                                            const updatedTimes = document.querySelectorAll('.updated')
                    console.log(updatedTimes)                        

                                            function getTimeout(date) {
                                                const minuteTimeout = 2
                                                const timeout = new Date(date.getTime() + minuteTimeout * 60 * 1000)
                                                return timeout
                                            }
                                            function getTimeString(node) {
                                                return node.innerText
                                            }
                                            function getDateFromString(text) {
                                                return new Date(text)
                                            }
                                            const getDifferenceTimeFrom = (current) => (future) => {
                                                    return future - current
                                                }

                                            function checkTimeoutPassed(difference) {
                                                return difference < 0
                                            }

                                            function showTimeOnScreen(text, index) {                                         
        document.getElementById('countdown-' + index).innerText = text
                                            }

                                            function getDisplayCountdown(difference) {
                                                if (checkTimeoutPassed(difference)) {
                                                    return "Timeout"
                                                }
                                                const time = countdown(difference)
                                                return time.minutes + ':' + time.seconds
                                                    }

                                                    function countdown(difference) {
                                                        const _second = 1000
                                                        const _minute = _second * 60
                                                        const _hour = _minute * 60
                                                        const _day = _hour * 24
                                                        const _month = _day * 30
                                                        const _year = _month * 12
                                                        // calculate dates
                                                        let years = Math.floor(difference / _year)
                                                        let months = Math.floor((difference % _year) / _month)
                                                        let days = Math.floor((difference % _month) / _day)
                                                        let hours = Math.floor((difference % _day) / _hour)
                                                        let minutes = Math.floor((difference % _hour) / _minute)
                                                        let seconds = Math.floor((difference % _minute) / _second)
                                                        // fix dates so that it will show two digets
                                                        days = String(days).length >= 2 ? days : '0' + days
                                                        hours = String(hours).length >= 2 ? hours : '0' + hours
                                                        minutes = String(minutes).length >= 2 ? minutes : '0' + minutes
                                                        seconds = String(seconds).length >= 2 ? seconds : '0' + seconds
                                                        return {
                                                            minutes,
                                                            seconds
                                                        }
                                                    }

                                                    function init() {
                                                        const currentDate = Date.now()
                                                        const getDifferenceTime = getDifferenceTimeFrom(currentDate)
                                                        result = Array.from(updatedTimes)
                                                                .map(getTimeString)
                                                                .map(getDateFromString)
                                                                .map(getTimeout)
                                                                .map(getDifferenceTime)
                                                                .map(getDisplayCountdown)
                                                                .map((element, index) => {
                                                                    const counter = index + 1
                                                                    console.log(element)
                                                                    showTimeOnScreen(element, counter)
                                                                })
                                                    }
                                                    setInterval(() => {
                                                        init()
                                                    }, 1000)

            </script>
    </body>
</html>


