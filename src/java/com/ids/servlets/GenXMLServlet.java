/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ids.servlets;

import com.ids.model.Lecturer;
import com.ids.model.News;
import com.ids.util.XMLCreator;
import com.ids.util.XMLCreatorLecturer;
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
            System.out.println("Page to go is " + page + "  " + view);
            System.out.println();
            Connection conn = (Connection) this.getServletContext().getAttribute("conn");
            String sql = "Select * from News where status = 'active' order by id desc";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            List list = new ArrayList();
            while (rs.next()) {
                News n = new News();
                n.setId(rs.getInt("id"));
                n.setUserid(rs.getInt("userid"));
                n.setTopic(rs.getString("topic"));
                n.setStory(rs.getString("story"));
                n.setSenddate(rs.getString("senddate"));
                n.setNewstypeid(rs.getInt("newstypeid"));
                n.setInputmediaid(rs.getInt("inputmediaid"));
                n.setStatus(rs.getString("status"));
                n.setRemark(rs.getString("remark"));
                n.setPriorityid(rs.getInt("priorityid"));
                
                String sql11 = "select * from picture where newsid = "+n.getId();
                Statement stmt2 = conn.createStatement();
                ResultSet result2 = stmt2.executeQuery(sql11);
                result2.next();
                n.setPath(result2.getString("path"));
                
                
                list.add(n);
                out.println(list.size());
               // out.println("Headline     " + rs.getString("topic"));

            }
            XMLCreator xce = new XMLCreator(list);
            xce.setSavedLocation(this.getServletContext().getRealPath(""));
            xce.runExample();

            String sql2 = "select * from lecturer l, user u where l.id = u.id";
            ResultSet rs2 = stmt.executeQuery(sql2);
            List list2 = new ArrayList();
            while (rs2.next()) {
                Lecturer l = new Lecturer();
                l.setId(rs2.getInt("id"));
                l.setUsername(rs2.getString("username"));
                l.setFname(rs2.getString("fname"));
                l.setLname(rs2.getString("lname"));
                l.setRoom(rs2.getString("room"));
                l.setStatus(rs2.getString("status"));
                list2.add(l);
            }
            XMLCreatorLecturer xcel = new XMLCreatorLecturer(list2);
            xcel.setSavedLocation(this.getServletContext().getRealPath(""));
            xcel.runExample();




//            RequestDispatcher rd = request.getRequestDispatcher(page+"?v="+view+"&refresh=true");
//            rd.forward(request, response);
            if (session.getAttribute("role").equals("student")) {
                response.sendRedirect("" + page + "?v=" + view + "&refresh=true");

            } else if (session.getAttribute("role").equals("lecturer")) {
                response.sendRedirect("lecturer/main.jsp?gen=yes");
            } else {
                response.sendRedirect(session.getAttribute("role") + "/" + page + "?v=" + view + "&refresh=true");
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
