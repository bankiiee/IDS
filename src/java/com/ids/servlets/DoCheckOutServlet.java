/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ids.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
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
public class DoCheckOutServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        try {
            /*
             * TODO output your page here. You may use following sample code.
             */
           //String supdate = request.getParameter("supdate");
           String username = (String) session.getAttribute("userid");
           Connection conn = (Connection)  this.getServletContext().getAttribute("conn");
           Statement stmt = conn.createStatement();
           String sql = "update lecturer set status = 'Out-Of-Office', remark = ''  where id = (select id from user where username like '"+username+"')";
           int result = stmt.executeUpdate(sql);
           if(result == 1){
               out.println("Success");
               this.getServletContext().setAttribute("checkins", "Out-Of-Office");
//               RequestDispatcher rd = request.getRequestDispatcher("lecturer/main.jsp?checkin=yes");
//               rd.forward(request, response);
                  RequestDispatcher rd = request.getRequestDispatcher("GenXMLServlet");
               rd.forward(request, response);
              // response.sendRedirect("lecturer/main.jsp?checkout=yes");
           }else{
               out.println("ERROR");
           }
        } catch (SQLException ex) {
            Logger.getLogger(DoCheckInServlet.class.getName()).log(Level.SEVERE, null, ex);
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
