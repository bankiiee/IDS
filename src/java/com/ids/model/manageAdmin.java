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
public class manageAdmin {
     Connection conn;
    PreparedStatement pstm;
    public manageAdmin(Connection conn) {
        this.conn = conn;
    }
    
    public boolean addAddmin(String fname){
        try {
            String sqlCmd = "insert into admin (fname,lname,username,password,remark) values(?,?,?,?,?)";
            pstm = conn.prepareStatement(sqlCmd);
                pstm.setString(1,fname);
                if(pstm.executeUpdate() > 0){
                    return true;
                }else{
                    return false;
                }
        } catch (SQLException ex) {
            Logger.getLogger(manageAdmin.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
     public boolean delAdmin(String id) {
        try {
            String sqlCmd = "delete from admin where id = ?";
               pstm = conn.prepareStatement(sqlCmd);
               pstm.setString(1, id);
               if (pstm.executeUpdate() > 0) {
                   return true;
               } else {
                   return false;
               }
        } catch (SQLException ex) {
            Logger.getLogger(manageAdmin.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
     }
     
     
    
}
