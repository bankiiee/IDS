/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ids.servlets;

import com.ids.model.News;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
 * @author Bankiiee
 */
public class addNewsServlet extends HttpServlet {

    public Connection conn;

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
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        this.conn = (Connection) this.getServletContext().getAttribute("conn");

        try {
            News news = new News();

            String headline = request.getParameter("topic").trim();
            String story = request.getParameter("story").trim();
            String senddate = request.getParameter("senddate");
            // String todate = request.getParameter("todate");
            // System.out.println((String) request.getParameter("forusergroupid"));
            String[] forusergroupid = request.getParameterValues("forusergroupid");;
            int newstypeid = Integer.parseInt((String) request.getParameter("newstypeid"));
            int edunewstypeid  =0;
            if(session.getAttribute("role").equals("student")){
                edunewstypeid = 0;
            }else{
                            edunewstypeid = Integer.parseInt(request.getParameter("edunewstypeid"));
            }
            if (!session.getAttribute("role").equals("student")) {
                edunewstypeid = Integer.parseInt(request.getParameter("edunewstypeid"));

            }

            int inputmediaid = Integer.parseInt((String) request.getParameter("inputmediaid"));
            String attachment = request.getParameter("attachment");
            if(attachment.isEmpty()){
                attachment = "attachments/News.png";
            }
            String escape_attch = attachment.replace("%20", "_");
            String status = "";
            if (!session.getAttribute("role").equals("student") && !session.getAttribute("role").equals("lecturer")) {
                status = "active";
            } else if (session.getAttribute("role").equals("lecturer") && edunewstypeid != 0) {
                status = "active";
            } else {
                status = "inactive";

            }
            String remark = request.getParameter("remark");
            int pid = Integer.parseInt(request.getParameter("priority"));
            System.out.println("" + session.getAttribute("userid"));
            news.setUserid(Integer.parseInt(session.getAttribute("id").toString()));
            news.setTopic(headline);
            news.setStory(story);
            news.setSenddate(senddate);
            // news.setTodate(todate);
            // news.setForusergroupid(forusergroupid);
            news.setNewstypeid(newstypeid);
            news.setInputmediaid(inputmediaid);
            // news.setAttchpath(escape_attch);
            news.setStatus(status);
            news.setRemark(remark + edunewstypeid);
            news.setPriorityid(pid);

            boolean result = this.addNews(news);
            System.out.println(request.getRequestURL());
            System.out.println("Insert row: " + result);
            if (result) {
                if (true) {
                    String sql = "select * from news order by id desc limit 1";
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(sql);
                    rs.next();
                    int newsid = rs.getInt("id");
                    int aff = 0;
                    System.out.println(""+forusergroupid.length);
                    for (int i = 0; i < forusergroupid.length; i++) {
                        String sql2 = "insert into news_has_usergroup values (" + newsid + "," + Integer.parseInt(forusergroupid[i]) + ")";
                        aff += stmt.executeUpdate(sql2);
                        System.out.println("Row Affected " + aff);
                        
                    }
                    if (aff == forusergroupid.length) {
                        System.out.println("Complete!");
                        String sql3 = "insert into picture(newsid,path) values (" + newsid + ",'" + attachment + "')";
                        int aff2 = stmt.executeUpdate(sql3);
                        if (aff2 != 0 && session.getAttribute("role").equals("student")) {
                            System.out.println("Pic Saved!");
                            response.sendRedirect("main.jsp?v=6");
                        } else {
                            response.sendRedirect(session.getAttribute("role") + "/main.jsp");

                        }
                    }
                }
                //RequestDispatcher rd = request.getRequestDispatcher("GenXMLServlet?page=main.jsp&v=6");
                //rd.forward(request, response);
                //  response.sendRedirect("GenXMLServlet?page=main.jsp&v=6");
            } else {
                //  response.sendRedirect(session.getAttribute("role")+"main.jsp?v=5&status=error");
            }

        } catch (SQLException ex) {
            Logger.getLogger(addNewsServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            out.close();
        }
    }

    public boolean addNews(News n) {
        boolean result = false;
        try {
            String sql = "insert into news(userid, topic, story, senddate,newstypeid,inputmediaid,status,remark,priorityid) values(?,?,?,?,?,?,?,?,?)";
            System.out.println("Connection is null ?" + this.conn);
            PreparedStatement pstmt = this.conn.prepareStatement(sql);

            pstmt.setInt(1, n.getUserid());
            pstmt.setString(2, n.getTopic());
            pstmt.setString(3, n.getStory());
            pstmt.setString(4, n.getSenddate());
//            pstmt.setString(5, n.getTodate());
//            pstmt.setInt(4, n.getForusergroupid());
            pstmt.setInt(5, n.getNewstypeid());
            pstmt.setInt(6, n.getInputmediaid());
//            pstmt.setString(9, n.getAttchpath());
            pstmt.setString(7, n.getStatus());
            pstmt.setString(8, n.getRemark());
            pstmt.setInt(9, n.getPriorityid());

            System.out.println("Insert String:" + n.getTopic());
            int s = pstmt.executeUpdate();
            if (s != 0) {
                System.out.println("Add News to DB Success!");
                result = true;


            } else {
                System.out.println("Failed!!!!!!!!!!!!!!!!!");
                result = false;
            }

        } catch (SQLException ex) {
            System.out.println("Error Msg:::" + ex.getMessage());
            Logger.getLogger(addNewsServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
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
