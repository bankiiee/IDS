/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ids.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author RcKShT
 */
public class manageUser {

    Connection conn;
    PreparedStatement pstm;

    public manageUser(Connection conn) {
        this.conn = conn;
    }

    public boolean addUser(String username) {
        try {
            String sqlCmd = "insert into user (username) values(?)";
            pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, username);
            if (pstm.executeUpdate() > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(manageUser.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public boolean delUser(String id) {
        try {
            String sqlCmd = "delete from user where id =?";
            pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, id);
            if (pstm.executeUpdate() > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(manageUser.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
}
