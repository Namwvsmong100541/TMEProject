<%-- 
    Document   : TransferPage
    Created on : Oct 28, 2019, 9:48:02 PM
    Author     : LENOVO
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="tme.project.demo.model.Member"%>
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
               background-color:#efeff4;
                color: #000000;
                font-family: 'Montserrat', sans-serif ;
            }
            .table.dataTable{
                background: whitesmoke;
            }
            thead{
                background: silver;
            }
            .event{
                margin: 10px;
                text-align: left;
            }
            .eventarea{
                background-color: white;
                border: 0.20px #707070 solid;
                border-radius:8px;
            }
            .timedate,.emergency,.location{
                padding-left: 20px;
            }
            .button1{
                margin-left: 80%;
                margin-bottom: 10px;
                border-radius: 8px;
                background-color: #BD4747; 
                border: none;
                color: white;
                padding: 5px;
                padding-left: 10px;
                padding-right:  10px;
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

            .notify img{
                width: 20px;
                height: 20px;
                float: right;
                margin:10px;
            }
            .timedate{
                margin-top: 0px;
            }
            .information.a{
                color: whitesmoke;
            }
            .status_time,.contact_person{
                padding-left: 20px;
            }
            
            .container{
                width: 1000px;
            }

        </style>
    </head>

    <body>
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
                        <a class="navbar-brand" href="">TME |</a>
                        <div class="now">
                            <a class="navbar-brand"><font size="3"><font color="#9ACD32"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></font>
                                <%=session.getAttribute("member_name")%> </font></a>
                        </div>
                        <div class="block1">
                            <div id="navbar" class="collapse navbar-collapse">
                                <ul class="nav navbar-nav">
                                    <li><a href="ManageLocation"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add Location</a></li>
                                    <li class="active"><a href="ListAllLocation"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> All Locations</a></li>
                                    <li><a href="TransferPage"><span class="glyphicon glyphicon-transfer" aria-hidden="true"></span> Transfer Page</a></li>
                                    <li><a href="Register"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Add Officer</a></li>
                                    <li><a href="ListAllOfficer"><span class="glyphicon glyphicon-th-list" aria-hidden="true"></span> All Officer</a></li>
                                    <li><a href="AdminLogout"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span> Log out</a></li>
                                </ul>
                            </div>
                        </div><!--/.nav-collapse -->
                    </div>
                </div>
            </div>
        </nav>

        
        <div class="container">
            <br>
            <br>
            <br>
            <br>
            <br>

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
                                                document.getElementById(`countdown-${index + 1}`).innerText = text
                                            }

                                            function getDisplayCountdown(difference) {
                                                if (checkTimeoutPassed(difference)) {
                                                    return "Timeout"
                                                }
                                                const time = countdown(difference)
                                                return `${time.minutes}:${time.seconds}`
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
                                                                .map(showTimeOnScreen)
                                                    }
                                                    setInterval(() => {
                                                        init()
                                                    }, 1000)

            </script>

    </body>
</html>


