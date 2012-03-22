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
public class adminUpdateUser extends HttpServlet {

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
        try {
            
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet adminUpdateUser</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet adminUpdateUser at " + request.getContextPath () + "</h1>");
            
             String fname = request.getParameter("fname");
            System.out.println(fname);
            String lname = request.getParameter("lname");
            String email = request.getParameter("email");
            String telno = request.getParameter("telno");
            String currentyear = request.getParameter("currentyear");
            String facebook = request.getParameter("facebook");
            String twitter = request.getParameter("twitter");
            
            Connection conn = (Connection) this.getServletContext().getAttribute("conn");
           String sql = "update user set fname = ?, lname = ?, telno = ?, fbacc = ?, twitacc = ?, email = ?, status = ? where username = ?";
           PreparedStatement pstmt = conn.prepareStatement(sql);
           pstmt.setString(1, fname);
           pstmt.setString(2, lname);
           pstmt.setString(3, telno);
           pstmt.setString(4,  facebook);
           pstmt.setString(5, twitter);
           pstmt.setString(6, email);
           pstmt.setInt(7, Integer.parseInt(currentyear));
           pstmt.setString(8, session.getAttribute("userid")+"");
           
             int success = pstmt.executeUpdate();
           if(success == 1){
               System.out.println("Update Success");
               out.println("<script type='text/javascript'>alert('ข้อมูลปรับปรุงเรียบร้อยแล้ว');</script>");
               response.sendRedirect("management/main.jsp?pupdate=success");
           }else{
               System.out.println("Update Failed");
               out.println("<script type='text/javascript'>alert('ไม่สามารถอัพเดตข้อมูลประวัติได้ กรุณาตรวจสอบข้อมูลอีกครั้ง');</script>");
           }
            out.println("</body>");
            out.println("</html>");
             
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
            Logger.getLogger(adminUpdateUser.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(adminUpdateUser.class.getName()).log(Level.SEVERE, null, ex);
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
