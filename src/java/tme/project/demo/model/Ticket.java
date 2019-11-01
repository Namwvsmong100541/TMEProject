/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tme.project.demo.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import tme.project.demo.datasource.ConnectionBuilder;

/**
 *
 * @author Antonymz
 */
public class Ticket {

    private int id;
    private String name;
    private String desc;
    private String place;
    private int status;
    private String image;
    private int userId;
    private String lat;
    private String lon;
    private int countRow;
    private Date dateTime;
    private String catagory;

    public Ticket() {
    }

    public Ticket(String name, String desc, String place ) {
        this.id = 0;
        this.name = name;
        this.desc = desc;
        this.place = place;
        this.status = 0;
        this.lat = lat;
        this.lon = lon;

    }

    public Ticket(String name, String desc, String place, int userId,String lat,String lon) throws SQLException {
        this.name = name;
        this.desc = desc;
        this.place = place;
        this.status = 0;
        this.userId = userId;
        this.lat = lat;
        this.lon = lon;
    }
    
    public Ticket(String name, String desc, String place, int userId,String lat,String lon,String catagory, String image) {
        this.name = name;
        this.desc = desc;
        this.place = place;
        this.status = 0;
        this.userId = userId;
        this.lat = lat;
        this.lon = lon;
        this.catagory = catagory;
        this.image = image;
    }

    public Ticket(int id, String name, String desc, String place, int status, Date dateTime,String lat,String lon ) {
        this.id = id;
        this.name = name;
        this.desc = desc;
        this.place = place;
        this.status = status;
        this.lat = lat;
        this.lon = lon;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getLat() {
        return lat;
    }

    public void setLat(String lat) {
        this.lat = lat;
    }

    public String getLon() {
        return lon;
    }

    public void setLon(String lon) {
        this.lon = lon;
    }

    public int getCountRow() {
        return countRow;
    }

    public void setCountRow(int countRow) {
        this.countRow = countRow;
    }

    public Date getDateTime() {
        return dateTime;
    }

    public void setDateTime(Date dateTime) {
        this.dateTime = dateTime;
    }

    public String getCatagory() {
        return catagory;
    }

    public void setCatagory(String catagory) {
        this.catagory = catagory;
    }
    
    
    
    public static Ticket getTicketById(int id) {
        Ticket t = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sqlCmd = "SELECT * FROM Emergency_Notify WHERE Event_id = ?";
            PreparedStatement pstm = con.prepareStatement(sqlCmd);
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                t = new Ticket();
                ORM(t, rs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Ticket.class.getName()).log(Level.SEVERE, null, ex);
        }
        return t;
    }

    private static void ORM(Ticket t, ResultSet rs) {
        try {
            t.setId(rs.getInt("Event_id"));
            t.setName(rs.getString("Event_name"));
            t.setDesc(rs.getString("Event_desc"));
            t.setPlace(rs.getString("Event_place"));
            t.setStatus(rs.getInt("Event_status"));
            t.setImage(rs.getString("Event_image"));
            t.setUserId(rs.getInt("member_id_fk"));
            t.setLat(rs.getString("Latitude"));
            t.setLon(rs.getString("Longtitude"));
            t.setDateTime(rs.getTimestamp("Date_Time"));
            t.setCatagory(rs.getString("Event_catagory"));

        
        } catch (SQLException ex) {
            Logger.getLogger(Ticket.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static List<Ticket> getAllTickets() {
        Ticket t = null;
        List<Ticket> tickets = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            Statement stmt = conn.createStatement();
            String sqlCmd = "SELECT * FROM Emergency_Notify ORDER BY Event_id DESC";
            ResultSet rs = stmt.executeQuery(sqlCmd);
            while (rs.next()) {
                t = new Ticket();
                ORM(t, rs);
                if (tickets == null) {
                    tickets = new ArrayList<Ticket>();
                }
                tickets.add(t);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Ticket.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tickets;
    }

    public static List<Ticket> getMyTickets(int userId) {
        Ticket t = null;
        List<Ticket> tickets = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            Statement stmt = conn.createStatement();
            String sqlCmd = "SELECT * FROM `Emergency_Notify` WHERE member_id_fk = "+userId+" ORDER BY Event_id DESC";
            ResultSet rs = stmt.executeQuery(sqlCmd);
            while (rs.next()) {
                t = new Ticket();
                ORM(t, rs);
                if (tickets == null) {
                    tickets = new ArrayList<Ticket>();
                }
                tickets.add(t);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Ticket.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tickets;
    }
    
    public static List<Ticket> getTicketsByNotifyMemberId(int member_id) {
        Ticket t = null;
        List<Ticket> tickets = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            Statement stmt = conn.createStatement();
            String sqlCmd = "SELECT * FROM Emergency_Notify WHERE Notify_Member_ID = " + member_id + "  ORDER BY Event_id DESC";
            ResultSet rs = stmt.executeQuery(sqlCmd);
            while (rs.next()) {
                t = new Ticket();
                ORM(t, rs);
                if (tickets == null) {
                    tickets = new ArrayList<Ticket>();
                }
                tickets.add(t);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Ticket.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tickets;
    }

    
    public static int countRow(int userId) {
        int countRow = 0;
        Ticket t = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            Statement stmt = conn.createStatement();
            String sqlCmd = "SELECT count(*) FROM `Emergency_Notify` WHERE member_id_fk = "+userId;
            ResultSet rs = stmt.executeQuery(sqlCmd);
            while (rs.next()) {
                t = new Ticket();
                ORM(t, rs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Ticket.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  countRow;
    }
  
    public boolean addTicket() {
        if (name.length() > 0 && desc.length() > 0 && place.length() > 0) {
            try {
                Connection conn = ConnectionBuilder.getConnection();
                java.sql.Timestamp  sqlDate = new java.sql.Timestamp(new java.util.Date().getTime());
                String sqlCmd = "INSERT INTO `Emergency_Notify`(Event_name, Event_desc, Event_place,Event_status,member_id_fk,"
                                   + "Date_Time, Latitude, Longtitude, Event_catagory, Event_image) VALUES(?,?,?,0,?,?,?,?,?,?)";
                PreparedStatement pstm = conn.prepareStatement(sqlCmd);
                pstm.setString(1, name);
                pstm.setString(2, desc);
                pstm.setString(3, place);
                pstm.setInt(4, userId);
                pstm.setTimestamp(5, sqlDate);
                pstm.setString(6, lat);
                pstm.setString(7, lon);
                pstm.setString(8, catagory);
                pstm.setString(9, image);
                
                int result = pstm.executeUpdate();
                if (result != 0) {
                    return true;
                }
            } catch (SQLException ex) {
                System.err.println(ex);
            }
        }
        return false;
    }

    @Override
    public String toString() {
        return "Ticket{" + "id=" + id + ", name=" + name + ", desc=" + desc + ", place=" + place + '}';
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public static boolean update(int ticket_id, int ticket_status) {
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "UPDATE `Emergency_Notify` SET Event_status = " + ticket_status + " WHERE Event_id = " + ticket_id;
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            int result = pstm.executeUpdate();
            if (result != 0) {
                return true;
            }
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return false;
    }

    public static Ticket getTicket(int ticket_id) {
        Ticket t = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            Statement stmt = conn.createStatement();
            String sqlCmd = "SELECT * FROM `Emergency_Notify` WHERE Event_id = " + ticket_id;
            ResultSet rs = stmt.executeQuery(sqlCmd);
            while (rs.next()) {
                t = new Ticket();
                ORM(t, rs);

            }
        } catch (SQLException ex) {
            Logger.getLogger(Ticket.class.getName()).log(Level.SEVERE, null, ex);
        }
        return t;
    }

    public static boolean delete(int ticket_id) {
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "DELETE FROM `Emergency_Notify` WHERE Event_id = " + ticket_id;
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            int result = pstm.executeUpdate();
            if (result != 0) {
                return true;
            }
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return false;

    }

    public String getStatusName() {
        if (status == 0) {
            return "Waiting for response";
        } else if (status == 1) {
            return "In progess";
        } else if (status == 2) {
            return "Completed";
        }
        return "";
    }
}
