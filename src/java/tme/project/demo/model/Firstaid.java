/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tme.project.demo.model;

import java.sql.Connection;
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
 * @author LENOVO
 */
public class Firstaid {

    private String name;
    private String desc;
    private String firstaid_id;

    public Firstaid() {
    }

    public Firstaid(String name, String desc) {
        this.name = name;
        this.desc = desc;
    }

    public Firstaid(String name, String desc, String firstaid_id) {
        this.name = name;
        this.desc = desc;
        this.firstaid_id = firstaid_id;
    }
    
    


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getFirstaid_id() {
        return firstaid_id;
    }

    public void setFirstaid_id(String firstaid_id) {
        this.firstaid_id = firstaid_id;
    }
    

    private static void ORM(Firstaid f, ResultSet rs) {
        try {
            f.setName(rs.getString("Type_Of_Emergency"));
            f.setDesc(rs.getString("Description"));
            f.setFirstaid_id(rs.getString("FirstAid_ID"));

        } catch (SQLException ex) {
            Logger.getLogger(Firstaid.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static List<Firstaid> getAllFirstAid() {
        Firstaid f = null;
        List<Firstaid> firstAid = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            Statement stmt = conn.createStatement();
            String sqlCmd = "SELECT * FROM First_Aid";
            ResultSet rs = stmt.executeQuery(sqlCmd);
            while (rs.next()) {
                f = new Firstaid();
                ORM(f, rs);
                if (firstAid == null) {
                    firstAid = new ArrayList<Firstaid>();
                }
                firstAid.add(f);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Firstaid.class.getName()).log(Level.SEVERE, null, ex);
        }
        return firstAid;
    }
    
    public static Firstaid getFirstaid(String firstAid_id) {
        Firstaid f = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            Statement stmt = conn.createStatement();
            String sqlCmd = "SELECT * FROM `First_Aid` WHERE FirstAid_ID = "+ firstAid_id;
            ResultSet rs = stmt.executeQuery(sqlCmd);
            while (rs.next()) {
                f = new Firstaid();
                ORM(f, rs);

            }
        } catch (SQLException ex) {
            Logger.getLogger(Firstaid.class.getName()).log(Level.SEVERE, null, ex);
        }
        return f;
    }
}
