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
import java.util.logging.Level;
import java.util.logging.Logger;
import tme.project.demo.datasource.ConnectionBuilder;

/**
 *
 * @author LENOVO
 */
public class Catagory {
    private String catagory_id;
    private String catagory_name;

    public Catagory() {
    }

    public Catagory(String catagory_id, String catagory_name) {
        this.catagory_id = catagory_id;
        this.catagory_name = catagory_name;
    }

    public Catagory(String catagory_name) {
        this.catagory_name = catagory_name;
    }

    
    public String getCatagory_id() {
        return catagory_id;
    }

    public void setCatagory_id(String catagory_id) {
        this.catagory_id = catagory_id;
    }

    public String getCatagory_name() {
        return catagory_name;
    }

    public void setCatagory_name(String catagory_name) {
        this.catagory_name = catagory_name;
    }
    
    private static void ORM(Catagory c, ResultSet rs) {
        try {
            c.setCatagory_id(rs.getString("CategoryEmergency_ID"));
            c.setCatagory_name(rs.getString("Type_Of_Emergency"));
            
        } catch (SQLException ex) {
            Logger.getLogger(Catagory.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static ArrayList<Catagory> getAllCatagory() {
        Catagory c = null;
        ArrayList<Catagory> catagories = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            Statement stmt = conn.createStatement();
            String sqlCmd = "SELECT * FROM `Category_Emergency`";
            ResultSet rs = stmt.executeQuery(sqlCmd);
            while (rs.next()) {
                c = new Catagory();
                ORM(c, rs);
                if (catagories == null) {
                    catagories = new ArrayList<Catagory>();
                }
                catagories.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Catagory.class.getName()).log(Level.SEVERE, null, ex);
        }
        return catagories;
    }
    
}
