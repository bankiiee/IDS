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
public class mediaManage {

    Connection conn;
    PreparedStatement pstm;

    public mediaManage(Connection conn) {
        this.conn = conn;
    }

    public boolean addMedia(String name) {
        try {
            String sqlCmd = "insert into inputmedia (name) values(?)";
            pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, name);
            if (pstm.executeUpdate() > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(mediaManage.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }

    }

    public boolean delMedia(String id) {
        try {
            String sqlCmd = "delete from inputmedia where id = ?";
            pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, id);
            if (pstm.executeUpdate() > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(mediaManage.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
}
