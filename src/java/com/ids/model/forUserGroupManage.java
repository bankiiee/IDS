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
public class forUserGroupManage {

    Connection conn;
    PreparedStatement pstm;

    public forUserGroupManage(Connection conn) {
        this.conn = conn;
    }

    public boolean addUserGroup(String name) {
        try {
            String sqlCmd = "insert into usergroup (name) values(?)";

            pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, name);
            if (pstm.executeUpdate() > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(forUserGroupManage.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public boolean delUserGroup(String id) {
        try {
            String sqlCmd = "delete from usergroup where id =?";

            pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, id);
            if (pstm.executeUpdate() > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(forUserGroupManage.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
}
