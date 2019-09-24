<%@page import="java.util.Properties"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
                        <a href="MyEmergency"><button type="button" class="btn btn-info" ><span class="glyphicon glyphicon-bell" aria-hidden="true"></span>
                                <span class="badge badge-light"> 
                                    <%
                                        try {
                                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                                            Connection con = DriverManager.getConnection("jdbc:mysql://35.240.139.209/TMEApp", "tmepro", "tme123456");
                                            Statement st = con.createStatement();
                                            String strQuery = "SELECT count(*) FROM `Emergency_Notify` WHERE member_id_fk = " + session.getAttribute("member_id");
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
                                </span></button></a>
                    </div>
                </div>
            </div> 
            <div id="map" class="map">
            </div>
            <br>
            <div class="container2">
                <form action="AddEmergency" method="post">
                    <div class="row">                       

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
                                    <br>

                                    &nbsp <button type="submit" name="submit" class="btn btn-warning"><span class="glyphicon glyphicon-send" aria-hidden="true"></span> SUBMIT &nbsp 
                                        <input name="member_id" type="hidden" value="<%=session.getAttribute("member_id")%>">
                                        <input name="lat_value"  type="hidden" id="lat_value"  class="form-control" value="0" /> 
                                        <input name="lon_value" type="hidden" id="lon_value" class="form-control" value="0" />          
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
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>    
<script>
    var map; // กำหนดตัวแปร map ไว้ด้านนอกฟังก์ชัน เพื่อให้สามารถเรียกใช้งาน จากส่วนอื่นได้  
    var GGM; // กำหนดตัวแปร GGM ไว้เก็บ google.maps Object จะได้เรียกใช้งานได้ง่ายขึ้น  
    var my_Marker;  // กำหนดตัวแปรเก็บ marker ตำแหน่งปัจจุบัน หรือที่ระบุ  
    function initialize() { // ฟังก์ชันแสดงแผนที่  
        GGM = new Object(google.maps); // เก็บตัวแปร google.maps Object ไว้ในตัวแปร GGM  

        // เรียกใช้คุณสมบัติ ระบุตำแหน่ง ของ html 5 ถ้ามี    
        if (navigator.geolocation) {

            // หาตำแหน่งปัจจุบันโดยใช้ getCurrentPosition เรียกตำแหน่งครั้งแรกครั้งเดียวเมื่อเปิดมาหน้าแผนที่
            navigator.geolocation.getCurrentPosition(function(position) {
                var myPosition_lat = position.coords.latitude; // เก็บค่าตำแหน่ง latitude  ปัจจุบัน  
                var myPosition_lon = position.coords.longitude;  // เก็บค่าตำแหน่ง  longitude ปัจจุบัน           

                // สรัาง LatLng ตำแหน่ง สำหรับ google map  
                var pos = new GGM.LatLng(myPosition_lat, myPosition_lon);

                // กำหนด DOM object ที่จะเอาแผนที่ไปแสดง ที่นี้คือ div id=map  
                var my_DivObj = $("#map")[0];

                // กำหนด Option ของแผนที่  
                var myOptions = {
                    zoom: 17, // กำหนดขนาดการ zoom  
                    scaleControl: true,
                    center: pos, // กำหนดจุดกึ่งกลาง  เป็นจุดที่เราอยู่ปัจจุบัน
                    mapTypeControl: false,
                    mapTypeId: GGM.MapTypeId.ROADMAP // กำหนดรูปแบบแผนที่  
//                    mapTypeControlOptions: {// การจัดรูปแบบส่วนควบคุมประเภทแผนที่  
//                        position: GGM.ControlPosition.RIGHT, // จัดตำแหน่ง  
//                        style: GGM.MapTypeControlStyle.DROPDOWN_MENU // จัดรูปแบบ style       
//                    }
                };

                map = new GGM.Map(my_DivObj, myOptions);// สร้างแผนที่และเก็บตัวแปรไว้ในชื่อ map                      

                my_Marker = new GGM.Marker({// สร้างตัว marker  
                    position: pos, // กำหนดไว้ที่เดียวกับจุดกึ่งกลาง  
                    map: map, // กำหนดว่า marker นี้ใช้กับแผนที่ชื่อ instance ว่า map  
                    icon: "http://www.ninenik.com/demo/google_map/images/male-2.png",
                    draggable: true, // กำหนดให้สามารถลากตัว marker นี้ได้  
                    title: "ลากเพื่อหาตำแหน่งจุดที่ต้องการ!" // แสดง title เมื่อเอาเมาส์มาอยู่เหนือ  
                });

                // กำหนด event ให้กับตัวแผนที่ เมื่อมีการเปลี่ยนแปลงการ zoom  
                GGM.event.addListener(map, "zoom_changed", function () {
                    $("#zoom_value").val(map.getZoom()); // เอาขนาด zoom ของแผนที่แสดงใน textbox id=zoom_value    
                });

            }, function () {
                // คำสั่งทำงาน ถ้า ระบบระบุตำแหน่ง geolocation ผิดพลาด หรือไม่ทำงาน    
            });

            // ให้อัพเดทตำแหน่งในแผนที่อัตโนมัติ โดยใช้งาน watchPosition
            // ค่าตำแหน่งจะได้มาเมื่อมีการส่งค่าตำแหน่งที่ถูกต้องกลับมา
            navigator.geolocation.watchPosition(function(position){

                var myPosition_lat = position.coords.latitude; // เก็บค่าตำแหน่ง latitude  ปัจจุบัน  
                var myPosition_lon = position.coords.longitude;  // เก็บค่าตำแหน่ง  longitude ปัจจุบัน  

                // สรัาง LatLng ตำแหน่งปัจจุบัน watchPosition
                var pos = new GGM.LatLng(myPosition_lat, myPosition_lon);

                // ให้ marker เลื่อนไปอยู่ตำแหน่งปัจจุบัน ตามการอัพเดทของตำแหน่งจาก watchPosition
                my_Marker.setPosition(pos);

                var my_Point = my_Marker.getPosition();  // ดึงตำแหน่งตัว marker  มาเก็บในตัวแปร
                $("#lat_value").val(my_Point.lat());  // เอาค่า latitude ตัว marker แสดงใน textbox id=lat_value  
                $("#lon_value").val(my_Point.lng()); // เอาค่า longitude ตัว marker แสดงใน textbox id=lon_value   
                $("#zoom_value").val(map.getZoom()); // เอาขนาด zoom ของแผนที่แสดงใน textbox id=zoom_value           

                map.panTo(pos); // เลื่อนแผนที่ไปตำแหน่งปัจจุบัน  
                map.setCenter(pos);  // กำหนดจุดกลางของแผนที่เป็น ตำแหน่งปัจจุบัน                   


            }, function () {
                navigator.geolocation.getCurrentPosition(success, error);     
            });

        } else {
            // คำสั่งทำงาน ถ้า บราวเซอร์ ไม่สนับสนุน ระบุตำแหน่ง    
        }



    }
    $(function () {
        // โหลด สคริป google map api เมื่อเว็บโหลดเรียบร้อยแล้ว  
        // ค่าตัวแปร ที่ส่งไปในไฟล์ google map api  
        // v=3.2&sensor=false&language=th&callback=initialize  
        //  v เวอร์ชัน่ 3.2  
        //  sensor กำหนดให้สามารถแสดงตำแหน่งทำเปิดแผนที่อยู่ได้ เหมาะสำหรับมือถือ ปกติใช้ false  
        //  language ภาษา th ,en เป็นต้น  
        //  callback ให้เรียกใช้ฟังก์ชันแสดง แผนที่ initialize  
        $("<script/>", {
            "type": "text/javascript",
            src: "//maps.google.com/maps/api/js?key=AIzaSyAHmKZ96a7T1gvXwMDRzyyGRQgOfFuEet8&sensor=false&language=th&callback=initialize"
        }).appendTo("body");
    });
</script>    

</html>