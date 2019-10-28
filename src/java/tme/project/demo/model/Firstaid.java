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

    public Firstaid() {
    }

    public Firstaid(String name, String desc) {
        this.name = name;
        this.desc = desc;
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

    private static void ORM(Firstaid f, ResultSet rs) {
        try {
            f.setName(rs.getString("Type_Of_Emergency"));
            f.setDesc(rs.getString("Description"));

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
}
