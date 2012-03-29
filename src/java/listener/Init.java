/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package listener;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.sql.DataSource;

/**
 * Web application lifecycle listener.
 * @author IT KMITL
 */
public class Init implements ServletContextListener {
Connection conn;
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
            conn = this.getDb().getConnection();
            sce.getServletContext().setAttribute("conn", conn);
        } catch (Exception ex) {
            Logger.getLogger(Init.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        try {
            conn.close();
            sce.getServletContext().removeAttribute("conn");
        } catch (SQLException ex) {
            Logger.getLogger(Init.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private DataSource getDb() throws NamingException {
        Context c = new InitialContext();
        return (DataSource) c.lookup("java:comp/env/db");
    }

   
    

   
    

    

   

   

    

   

  

   

    
    
}
