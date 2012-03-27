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
public class newsTypeManage {
    Connection conn;
    PreparedStatement pstm;
    public newsTypeManage(Connection conn) {
        this.conn = conn;
    }
    
    public boolean addNewsType(String name){
        String sqlCmd = "insert into newstype (name) values(?)";
        try {
            pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1,name);
            if(pstm.executeUpdate() > 0){
                return true;
            }else{
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(newsTypeManage.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
    }
    
     public boolean delNewsType(String id){
         String sqlCmd = "delete from newstype where id =?";
         try {
            pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1,id);
            if(pstm.executeUpdate() > 0){
                return true;
            }else{
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(newsTypeManage.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
     }
}
