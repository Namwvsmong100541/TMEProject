<%-- 
    Document   : home.jsp
    Created on : Sep 28, 2019, 3:11:29 PM
    Author     : wilaw
--%>
<%@page import="java.util.Properties"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
        <title>TME | Home Officer</title>

        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/sticky-footer-navbar.css" rel="stylesheet">

        <link href="css/dataTables.bootstrap.min.css" rel="stylesheet">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TME | Home Officer</title>
        <style>
            html,body{
                background-color:#EFEFF4;
                font-family: 'Montserrat', sans-serif ;
            }
            body{
                color: #707070;
                background-repeat: repeat;
                background-position: center;
                height: 700px;
                width:375px;
                position: fixed;
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
                border-top:  1px white solid;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);

            }
            .container{
                width: 340px;
                margin-top: 180px;
            }

            .header h2{
                text-align: center;
                font-size: 20px;
                margin-top: 10px;
                padding-left: 12px;

            }
            .menuhome{
                margin-top: 20px;
                margin-left: 30px;
                width: 80px;
                height: 80px;
                border-radius: 200px;
                background: #f47735;
            }
            .menuhome img{
                width: 50px;
                height:50px;
                margin-left: 16px;
                margin-top: 15px;
            }
            .buttonimg img{
                width: 50px;
                height:50px;
                margin-left: 15px;
                margin-top: 0px;
            }
            .buttonimg2 img{
                width: 50px;
                height:50px;
                margin-left: 18px;
                margin-top: 0px;
            }
            .cardhome{
                background: white;
                width: 140px;
                height: 150px;
                border-radius: 20px;
                border: 0.15px #707070 solid;
                float: left;
                margin: 5px;
                margin-bottom: 10px;
            }
            .menuhome h5{
                text-align: center;
                margin-top: 25px;
            }
            .buttonimg h5{
                text-align: center;
                margin-top: 20px;
            }
        </style>
    </head>
    <body background="images\bodyofficer.jpg" align="">
        <div class="logout">


            <div class="out">
                <img src="images\logout .png" alt="">
                <a href="Logout">Log out</a>

            </div> 
            <div class="studentID"> <%=session.getAttribute("member_name")%> </div>



        </div>

        <div class="header">
            <h2>Home</h2> 
        </div>
            
            <div class="container">
                <div class="cardhome">
                    <div class="menuhome">
                        <span class="badge badge-light" style="background-color: #e23535"> 
                            <%
                                try {
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con = DriverManager.getConnection("jdbc:mysql://34.87.6.230/TMEApp", "tmepro", "tme123456");
                                    Statement st = con.createStatement();
                                    String strQuery = "SELECT count(*) FROM `Emergency_Notify` WHERE Event_status = 0";
                                    ResultSet rs = st.executeQuery(strQuery);
                                    String Countrow = "";
                                    while (rs.next()) {
                                        Countrow = rs.getString(1);
                                        out.println(Countrow);
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>   
                        </span>
                        <div class="buttonimg"> <a href="UpdateStatus"><img src="images\alarm (8).png" alt=""></a>
                        <h5>All Notification</h5></div>
                    </div> 
                </div> 
                <div class="cardhome">
                    <div class="menuhome">
                        <span class="badge badge-light" style="background-color: #e23535"> 
                            <%
                                try {
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con = DriverManager.getConnection("jdbc:mysql://34.87.6.230/TMEApp", "tmepro", "tme123456");
                                    Statement st = con.createStatement();
                                    String strQuery = "SELECT count(*) FROM `Emergency_Notify` WHERE Event_status = 0 "
                                            + "AND Notify_Member_ID = "+session.getAttribute("member_id");
                                    ResultSet rs = st.executeQuery(strQuery);
                                    String Countrow = "";
                                    while (rs.next()) {
                                        Countrow = rs.getString(1);
                                        out.println(Countrow);
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>   
                        </span>
                        <div class="buttonimg"><a href="MyCase"><img src="images\transfer.png" alt=""></a>
                            <h5>My Direct Case</h5></div>
                    </div> 
                </div>
                <div class="cardhome">
                    <div class="menuhome">
                        <span class="badge badge-light" style="background-color: #e23535"> 
                            <%
                                try {
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection con = DriverManager.getConnection("jdbc:mysql://34.87.6.230/TMEApp", "tmepro", "tme123456");
                                    Statement st = con.createStatement();
                                    String strQuery = "SELECT count(*) FROM `Emergency_Notify` WHERE Event_status = 1 "
                                            + "AND Notify_Member_ID = "+session.getAttribute("member_id");
                                    ResultSet rs = st.executeQuery(strQuery);
                                    String Countrow = "";
                                    while (rs.next()) {
                                        Countrow = rs.getString(1);
                                        out.println(Countrow);
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>   
                        </span>
                        <div class="buttonimg2"><a href="StatusAccept"><img src="images\list233.png" alt=""></a>
                            <h5>In progress</h5></div>
                    </div> 
                </div>
                <div class="cardhome">
                    <div class="menuhome">
                        <a href="History"><img src="images\history (5).png" alt=""></a>
                        <h5>History</h5>
                    </div> 
                </div>
                
                
            </div> 

    </body>
</html>
