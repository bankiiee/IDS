/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ids.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author RcKShT
 */
public class toLCDServlet extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String remark = request.getParameter("remark");
        
        String idtr = request.getParameter("id");
        Integer newsid = Integer.parseInt(idtr);
        
          String attachment = request.getParameter("attachment");
          String escape_attch = attachment.replace("%20", "_");
        
        try {
           
           Connection conn = (Connection) this.getServletContext().getAttribute("conn");
            String sql = "update news set remark = ? where id = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
           
            pstmt.setString(1, remark);
            
            pstmt.setInt(2, newsid);
           
            if (pstmt.executeUpdate() > 0) {

                //response.sendRedirect("management/main.jsp?v=82");

                out.println("<script type='text/javascript'>alert('ส่งข้อมูลเรียบร้อยแล้ว');</script>");
                //out.println("<script type='text/javascript'>parent.Windows.refresh();</script>");
                out.println("<script type='text/javascript'>self.window.close();</script>");


            }
            else {
                System.out.println("Update Failed");
                out.println("<script type='text/javascript'>alert('ไม่สามารถอัพเดตข้อมูลประวัติได้ กรุณาตรวจสอบข้อมูลอีกครั้ง');</script>");
            }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(toLCDServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(toLCDServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
