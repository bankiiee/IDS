/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ids.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author bankiiee
 */
public class ManageNewsInboxServlet extends HttpServlet {

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
        Connection conn = (Connection) this.getServletContext().getAttribute("conn");
        try {
         String mode = request.getParameter("mode");
         String id = request.getParameter("id");
         //   out.println("News ID is "+id);
         if(mode.equalsIgnoreCase("active")){
             Calendar c = Calendar.getInstance();
             //System.out.println(c.get(c.DAY_OF_MONTH) +"-"+c.get(c.MONTH)+"-"+c.get(c.YEAR));
             String df =  c.get(c.YEAR)+"-"+c.get(c.MONTH)+"-"+c.get(c.DAY_OF_MONTH);
             System.out.println("Post Date : "+df);
             String sql1 = "update news set status = 'active', senddate = '"+df+"' where id = "+id;
             Statement stmt = conn.createStatement();
             int row_affected = stmt.executeUpdate(sql1);
             if(row_affected >0){
                 out.println("Success!");
             }
         }  else if(mode.equalsIgnoreCase("inactive")){
             String sql2 = "update news set status = 'inactive' where id = "+id;
             Statement stmt2 = conn.createStatement();
             int row_affected = stmt2.executeUpdate(sql2);
             if(row_affected >0){
                 out.println("Success!");
             }
         } else if(mode.equalsIgnoreCase("active_all")){
             String sql2 = "update news set status = 'active'";
             Statement stmt2 = conn.createStatement();
             int row_affected = stmt2.executeUpdate(sql2);
             if(row_affected >0){
                 out.println("Success!");
             }
         } else if(mode.equalsIgnoreCase("inactive_all")){
             String sql2 = "update news set status = 'inactive'";
             Statement stmt2 = conn.createStatement();
             int row_affected = stmt2.executeUpdate(sql2);
             if(row_affected >0){
                 out.println("Success!");
             }
         }else{
             
         }
         
        } catch(Exception e){
            e.printStackTrace();
        }finally {            
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
