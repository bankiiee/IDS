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
import java.sql.PreparedStatement;
import java.sql.SQLException;
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
 * @author Bankiiee
 */
public class addNewsServlet extends HttpServlet {

    public Connection conn;

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        this.conn = (Connection) this.getServletContext().getAttribute("conn");

        try {
            News news = new News();
            int id = Integer.parseInt((String) session.getAttribute("id")); // userid for ids db only
            System.out.println("USERID:"+id);
            String headline = request.getParameter("headline").trim();
            String story = request.getParameter("story");
            String fromdate = request.getParameter("fromdate");
            String todate = request.getParameter("todate");
            System.out.println((String) request.getParameter("forusergroupid"));
            int forusergroupid = Integer.parseInt((String) request.getParameter("forusergroupid"));
            int newstypeid = Integer.parseInt((String) request.getParameter("newstypeid"));
            int mediaid = Integer.parseInt((String) request.getParameter("mediaid"));
            String attachment = request.getParameter("attachment");
            String status = "inactive";
            String remark = request.getParameter("remark");
      
            news.setUserid(id);
            news.setHeadline(headline);
            news.setStory(story);
            news.setFromdate(fromdate);
            news.setTodate(todate);
            news.setForusergroupid(forusergroupid);
            news.setNewstypeid(newstypeid);
            news.setMediaid(mediaid);
            news.setAttatchment(attachment);
            news.setStatus(status);
            news.setRemark(remark);
            
            boolean result = this.addNews(news);
            System.out.println(request.getRequestURL());
            if(result){
              //  response.sendRedirect(session.getAttribute("role")+"main.jsp?v=6");
             RequestDispatcher rd =  request.getRequestDispatcher("GenXMLServlet?page=main.jsp&v=6");
                rd.forward(request, response);
              //  response.sendRedirect("GenXMLServlet?page=main.jsp&v=6");
            }else{
              //  response.sendRedirect(session.getAttribute("role")+"main.jsp?v=5&status=error");
            }

        } finally {
            out.close();
        }
    }

    public boolean addNews(News n) {
        boolean result = false;
        try {
            String sql = "insert into news(userid, topic, story, fromdate, todate, forusergroupid,newstypeid,mediaid,attachment,status,remark) values(?,?,?,?,?,?,?,?,?,?,?)";
            System.out.println("Connection is null ?" + this.conn);
            PreparedStatement pstmt = this.conn.prepareStatement(sql);

            pstmt.setInt(1, n.getUserid());
            pstmt.setString(2, n.getHeadline());
            pstmt.setString(3, n.getStory());
            pstmt.setString(4, n.getFromdate());
            pstmt.setString(5, n.getTodate());
            pstmt.setInt(6, n.getForusergroupid());
            pstmt.setInt(7, n.getNewstypeid());
            pstmt.setInt(8, n.getMediaid());
            pstmt.setString(9, n.getAttatchment());
            pstmt.setString(10, n.getStatus());
            pstmt.setString(11, n.getRemark());
            System.out.println("Insert String:"+n.getHeadline());
            int s = pstmt.executeUpdate();
            if (s != 0) {
                System.out.println("Add News to DB Success!");
                result = true;
           
                
            } else {
                System.out.println("Failed!!!!!!!!!!!!!!!!!");
                result =  false;
            }

        } catch (SQLException ex) {
            System.out.println("Error Msg:::"+ex.getMessage());
            Logger.getLogger(addNewsServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
return result;
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
