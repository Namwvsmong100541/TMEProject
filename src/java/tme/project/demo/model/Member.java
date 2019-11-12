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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import tme.project.demo.datasource.ConnectionBuilder;

/**
 *
 * @author Antonymz
 */
public class Member {

    

    private int id;
    private String name;
    private String surname;
    private long stdId;
    private String gender;
    private String faculty;
    private String email;
    private String username;
    private String password;
    private String position ;
    private String phoneNo;

    public Member() {
    }

    public Member(String name, String surname,String gender, String faculty, String email, String username, String password, String position,String phoneNo) {
        this.name = name;
        this.surname = surname;
        this.gender = gender;
        this.faculty = faculty;
        this.email = email;
        this.username = username;
        this.password = password;
        this.position = position;
        this.phoneNo = phoneNo;
    }

    public Member(int id, String name, String surname,String gender, String faculty, String email, String username, String password, String position, String phoneNo) {
        this.id = id;
        this.name = name;
        this.surname = surname; 
        this.gender = gender;
        this.faculty = faculty;
        this.email = email;
        this.username = username;
        this.password = password;
        this.position = position;
        this.phoneNo = phoneNo;
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

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public long getStdId() {
        return stdId;
    }

    public void setStdId(long stdId) {
        this.stdId = stdId;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getFaculty() {
        return faculty;
    }

    public void setFaculty(String faculty) {
        this.faculty = faculty;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }
    
    public boolean addMember() {
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sqlCmd = "INSERT INTO member(member_name, member_surname,member_gender, member_faculty, member_email,"
                    + " member_username, member_password, member_position,member_phoneno) VALUES(?,?,?,?,?,?,?,?,?)";
            PreparedStatement pstm = con.prepareStatement(sqlCmd);
            pstm.setString(1, name);
            pstm.setString(2, surname);
            pstm.setString(3, gender);
            pstm.setString(4, faculty);
            pstm.setString(5, email);
            pstm.setString(6, username);
            pstm.setString(7, password);
            pstm.setString(8, position);
            pstm.setString(9, phoneNo);
            int result = pstm.executeUpdate();
            if (result != 0) {
                return true;
            }
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return false;
    }

    private static void ORM(Member m, ResultSet rs) {
        try {
            m.setId(rs.getInt("member_id"));
            m.setName(rs.getString("member_name"));
            m.setSurname(rs.getString("member_surname"));
            m.setFaculty(rs.getString("member_faculty"));
            m.setEmail(rs.getString("member_email"));
            m.setUsername(rs.getString("member_username"));
            m.setPassword(rs.getString("member_password"));
            m.setStdId(rs.getLong("member_stdid"));
            m.setGender(rs.getString("member_gender"));
            m.setPosition(rs.getString("member_position"));
            m.setPhoneNo(rs.getString("member_phoneno"));
            
        } catch (SQLException ex) {
            Logger.getLogger(Ticket.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static Member getMember(int member_id) {
        Member m = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            Statement stmt = con.createStatement();
            String sqlCmd = "SELECT * FROM member WHERE member_id = " + member_id;
            ResultSet rs = stmt.executeQuery(sqlCmd);
            while (rs.next()) {
                m = new Member();
                ORM(m, rs);

            }
        } catch (SQLException ex) {
            Logger.getLogger(Member.class.getName()).log(Level.SEVERE, null, ex);
        }
        return m;
    }
    
    public static Member getNotifyMember(int officer_id) {
        Member m = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            Statement stmt = con.createStatement();
            String sqlCmd = "SELECT * FROM member WHERE member_id = " + officer_id;
            ResultSet rs = stmt.executeQuery(sqlCmd);
            while (rs.next()) {
                m = new Member();
                ORM(m, rs);

            }
        } catch (SQLException ex) {
            Logger.getLogger(Member.class.getName()).log(Level.SEVERE, null, ex);
        }
        return m;
    }

    public String getGenderName() {
        if (gender.equals("F")) {
            return "Female";
        } else if (gender.equals("M")) {
            return "Male";
        }
        return "";
    }
    public static List<Member> getAllOffices() {
        Member m = null;
        List<Member> members = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            Statement stmt = conn.createStatement();
            String sqlCmd = "SELECT * FROM member WHERE member_position = 2";
            ResultSet rs = stmt.executeQuery(sqlCmd);
            while (rs.next()) {
                m = new Member();
                ORM(m, rs);
                if (members == null) {
                    members = new ArrayList<Member>();
                }
                members.add(m);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Member.class.getName()).log(Level.SEVERE, null, ex);
        }
        return members;
    }
    
    public static int getIdByUsernameStudent(String username) throws SQLException {
        String sqlCmd = "SELECT `member_id` FROM `member` WHERE member_stdId = '" + username + "'";
        Connection con = ConnectionBuilder.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(sqlCmd);
        int id = 0;
        if(rs.next()){
            id = rs.getInt("member_id");
        }
        return id;
    }
    
    public static int getIdByUsernameOfficer(String username) throws SQLException {
        String sqlCmd = "SELECT `member_id` FROM `member` WHERE member_username = '" + username + "'";
        Connection con = ConnectionBuilder.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(sqlCmd);
        int id = 0;
        if(rs.next()){
            id = rs.getInt("member_id");
        }
        return id;
    }
    
    public static int getPositionByUsername(String username) throws SQLException {
        String sqlCmd = "SELECT `member_position` FROM `member` WHERE member_username = '" + username + "'";
        Connection con = ConnectionBuilder.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(sqlCmd);
        int id = 0;
        if(rs.next()){
            id = rs.getInt("member_position");
        }
        return id;
    }
    
    public static String getLocationByUsername(String username)throws SQLException {
        String sqlCmd = "SELECT `member_faculty` FROM `member` WHERE member_username = '" + username + "'";
        Connection con = ConnectionBuilder.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(sqlCmd);
        String place = "";
        if(rs.next()){
            place = rs.getString("member_faculty");
        }
        return place;
    }

    public static boolean isStudent(String member_username, String member_password) {
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sqlCmd = "SELECT * FROM `member` WHERE `member_stdId` = '" + member_username + "' AND member_password = '"
                    + member_password + "'";
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return false;
    }
    
    public static boolean isOfficer(String member_username, String member_password) {
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sqlCmd = "SELECT * FROM `member` WHERE `member_username` = '" + member_username + "' AND member_password = '"
                    + member_password + "'";
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return false;
    }
    
    public static boolean isAdmin(String member_username, String member_password) {
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sqlCmd = "SELECT * FROM `member` WHERE `member_username` = '" + member_username + "' AND member_password = '"
                    + member_password + "'";
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return false;
    }
    
    public static boolean delete(int id) {
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "DELETE FROM `member` WHERE member_id = " + id;
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

    @Override
    public String toString() {
        return "Member{" + "id=" + id + ", name=" + name + ", surname=" + surname + ", stdId=" + stdId + ", gender=" + gender + ", faculty=" + faculty + ", email=" + email + ", username=" + username + ", password=" + password + ", position=" + position + '}';
    }
    
}
