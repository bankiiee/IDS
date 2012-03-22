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
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author bankiiee
 */
public class updateLecturerProfileServlet extends HttpServlet {

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
        Utility util = new Utility();
        try {
            
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet updateStudentProfileServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            
            String fname = request.getParameter("fname");
            System.out.println(fname);
            String lname = request.getParameter("lname");
            String room = request.getParameter("room");
           
            
           Connection conn = (Connection) this.getServletContext().getAttribute("conn");
           String sql = "insert into lecturer(username,fname,lname,room) values (?,?,?,?)";
           PreparedStatement pstmt = conn.prepareStatement(sql);
           pstmt.setString(1, session.getAttribute("userid")+"");
           pstmt.setString(2, fname);
           pstmt.setString(3, lname);
           pstmt.setString(4,  room);
          
          
           int success = pstmt.executeUpdate();
           if(success == 1){
               System.out.println("Update Success");
               Statement stmt = conn.createStatement();
               String sql2 = "select * from lecturer where username like '"+session.getAttribute("userid")+"'";
               ResultSet rs = stmt.executeQuery(sql2);
               while(rs.next()){
                   session.setAttribute("id",rs.getInt("id") );
               }
               
               out.println("<script type='text/javascript'>alert('ข้อมูลปรับปรุงเรียบร้อยแล้ว');</script>");
               response.sendRedirect("lecturer/main.jsp?pupdate=success");
           }else{
               System.out.println("Update Failed");
               out.println("<script type='text/javascript'>alert('ไม่สามารถอัพเดตข้อมูลประวัติได้ กรุณาตรวจสอบข้อมูลอีกครั้ง');</script>");
           }
            out.println("</body>");
            out.println("</html>");
            
        } catch (Exception ex) {
            Logger.getLogger(updateStudentProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
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
