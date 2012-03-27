/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ids.servlets;

import com.ids.model.News;
import com.ids.util.XMLCreator;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author bankiiee
 */
public class GenXMLServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=TIS-620");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
       
        try {
            /*
             * TODO output your page here. You may use following sample code.
             */
            System.out.println("From GenXMLServlet Says HELLO");
            String page = request.getParameter("page");
            String view = request.getParameter("v");
            System.out.println("Page to go is "+page+"  "+view);
            System.out.println();
            Connection conn = (Connection) this.getServletContext().getAttribute("conn");
            String sql = "Select * from News where status = 'active'";
            Statement stmt = conn.createStatement();
            ResultSet rs  = stmt.executeQuery(sql);
            List list = new ArrayList();
            while(rs.next()){
                News n = new News();
                n.setNewsid(rs.getInt(1));
                n.setPublisher(rs.getString(2));
                n.setHeadline(rs.getString(3));
                n.setStory(rs.getString(4));
                n.setFromdate(rs.getString(5));
                n.setTodate(rs.getString(6));
                n.setForusergroupid(rs.getInt(7));
                n.setNewstypeid(rs.getInt(8));
                n.setMediaid(rs.getInt(9));
                n.setAttchpath(rs.getString(10));
                n.setStatus(rs.getString(11));
                n.setRemark(rs.getString(12));
                n.setPriorityid(rs.getInt(13));
                list.add(n);
                out.println(list.size());
                out.println("Headline     " + rs.getString("topic"));
                
            }
             XMLCreator xce = new XMLCreator(list);
             xce.setSavedLocation(this.getServletContext().getRealPath(""));
             xce.runExample();
            
            
            
            
            
            
            
//            RequestDispatcher rd = request.getRequestDispatcher(page+"?v="+view+"&refresh=true");
//            rd.forward(request, response);
             if(session.getAttribute("role").equals("student")){
                             response.sendRedirect(""+page+"?v="+view+"&refresh=true");

             }else{
                             response.sendRedirect(session.getAttribute("role")+"/"+page+"?v="+view+"&refresh=true");
                           //  request.getRequestDispatcher(session.getAttribute("role")+"/"+page+"?v="+view+"&refresh=true").forward(request, response);
             }
        } catch (SQLException ex) {
            Logger.getLogger(GenXMLServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
