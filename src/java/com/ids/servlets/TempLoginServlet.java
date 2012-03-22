/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ids.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
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
 * @author ITKMITL
 */
public class TempLoginServlet extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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

            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TempLoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String role = request.getParameter("role");
            if (role.equals("student")) {
                try {
                    conn = (Connection) this.getServletContext().getAttribute("conn");
                    String sql = "select * from user where username = '" + username + "'";
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(sql);
                    session.setAttribute("username", username);
                    session.setAttribute("userid", username);
                    session.setAttribute("role", role);
                    if (rs.next()) {
                        response.sendRedirect("main.jsp");
                    } else {
                        response.sendRedirect("main.jsp?v=999");
                    }

                } catch (SQLException ex) {
                    Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else if (role.equals("lecturer")) {
                session.setAttribute("username", username);
                session.setAttribute("userid", username);
                session.setAttribute("role", role);
                response.sendRedirect("lecturer/main.jsp");
            } else if (role.equals("staff")) {
                session.setAttribute("username", username);
                session.setAttribute("userid", username);
                session.setAttribute("role", role);
                response.sendRedirect("management/main.jsp");
            } else if (role.equals("external")) {
                try {
                    conn = (Connection) this.getServletContext().getAttribute("conn");
                    String sql = "select * from guest where username like '" + username + "'";
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(sql);
                    session.setAttribute("username", username);
                    session.setAttribute("userid", username);
                    session.setAttribute("role", role);
                    if (rs.next() && rs.getString("password").equals(password)) {
                        response.sendRedirect("guest/main.jsp");
                    } else {
                        response.sendRedirect("login.jsp?error=1");
                    }

                } catch (SQLException ex) {
                    Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                
            } else {
                response.sendRedirect("login.jsp?error=2");
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
        processRequest(request, response);
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
        processRequest(request, response);
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
