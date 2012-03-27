/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ids.servlets;

import com.ids.util.Utility;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author RcKShT
 */
public class updateNewsServlet extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=TIS-620");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        Utility util = new Utility();
        String topic = request.getParameter("topic");
        String story = request.getParameter("story");
        String fromdate = request.getParameter("fromdate");
        String todate = request.getParameter("todate");
        String publisher = request.getParameter("publisher");
        
        String forusergroupidtr = request.getParameter("forusergroupid");
        Integer forusergroupid = Integer.parseInt(forusergroupidtr);
        
        String mediaidtr = request.getParameter("mediaid");
        Integer mediaid = Integer.parseInt(mediaidtr);
        
        String newstypeidtr = request.getParameter("newstypeid");
        Integer newstypeid = Integer.parseInt(newstypeidtr);
        
        String priorityidtr = request.getParameter("priorityid");
        Integer priorityid = Integer.parseInt(priorityidtr);
        
        String remark = request.getParameter("remark");
        String attchpath = request.getParameter("attchpath");
        
        String idtr = request.getParameter("id");
        Integer newsid = Integer.parseInt(idtr);
        
        try {
            Connection conn = (Connection) this.getServletContext().getAttribute("conn");
            String sql = "update news set topic = ?, story = ?, forusergroupid = ?, newstypeid = ?, mediaid = ? , remark = ? , priorityid = ?, publisher = ?, fromdate = ? , todate = ? , attchpath = ?   where id = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, topic);
            pstmt.setString(2, story);
            pstmt.setInt(3, forusergroupid);
            pstmt.setInt(4, newstypeid);
            pstmt.setInt(5, mediaid);
            pstmt.setString(6, remark);
            pstmt.setInt(7, priorityid);
            pstmt.setString(8, publisher);
            pstmt.setString(9, fromdate);
            pstmt.setString(10, todate);
             pstmt.setString(11, attchpath);
            pstmt.setInt(12, newsid);
            
            //pstmt.setString(8, session.getAttribute("adminid") + "");

            if (pstmt.executeUpdate() > 0) {

                //response.sendRedirect("management/main.jsp?v=82");

                out.println("<script type='text/javascript'>alert('ข้อมูลปรับปรุงเรียบร้อยแล้ว');</script>");
                //out.println("<script type='text/javascript'>parent.Windows.refresh();</script>");
                out.println("<script type='text/javascript'>self.window.close();</script>");


            } else {
                System.out.println("Update Failed");
                out.println("<script type='text/javascript'>alert('ไม่สามารถอัพเดตข้อมูลประวัติได้ กรุณาตรวจสอบข้อมูลอีกครั้ง');</script>");
            }
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
            Logger.getLogger(updateNewsServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
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
            Logger.getLogger(updateNewsServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
