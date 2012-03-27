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
import java.util.Hashtable;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.naming.directory.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author bankiiee
 */
public class MobileDoLoginServlet extends HttpServlet {

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
        Connection conn;
        String usernameStr = "";
        String surnameStr = "";

        try {
//            /* TODO output your page here
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet LoginServlet</title>");
//            out.println("</head>");
//            out.println("<body>");
//          //  out.println("Hello");

            final String SUCCESS = "Success.html";
            final String FAILURE = "Failure.html";
            String strUrl = "login.html";
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String role = "";
            String mobile = "no";
            mobile = request.getParameter("mobile");
            if (mobile == null) {
                mobile = "no";
            }

            System.out.println(role);
            Hashtable env = new Hashtable(11);

            boolean b = false;

            env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
            env.put(Context.PROVIDER_URL, "ldap://161.246.38.141");
            env.put(Context.SECURITY_AUTHENTICATION, "simple");
            env.put(Context.SECURITY_PRINCIPAL, "IT\\" + username);
            env.put(Context.SECURITY_CREDENTIALS, password);
            System.out.println("prepared to send data <br>");
            System.out.println("User = " + username + " <br>");
            System.out.println("is moile? ->>>" + mobile);
            try {
// Create initial context
                DirContext ctx = new InitialDirContext(env);
                SearchControls constraints = new SearchControls();
                constraints.setSearchScope(SearchControls.SUBTREE_SCOPE);
                String[] attrIDs = {"cn", "ou", "givenname", "telephonenumber"};
                constraints.setReturningAttributes(attrIDs);
                System.out.println("ctx    " + ctx);
                NamingEnumeration<SearchResult> search = ctx.search("OU=Lecturer,dc=it,dc=kmitl,dc=ac,dc=th", "samaccountname=" + username, constraints);
                System.out.println("Result Search  " + search);
                if (search.hasMore()) {
                    Attributes att = (Attributes) search.next().getAttributes();
                    System.out.println("<br>Welcome, " + att.get("cn"));
                    System.out.println("ou :" + att.get("ou"));
                    usernameStr = att.get("cn").get() + "";
                    role = "lecturer";

                } else {
                    search = ctx.search("OU=Student,dc=it,dc=kmitl,dc=ac,dc=th", "samaccountname=" + username, constraints);
                    System.out.println("Result Search  " + search);
                    if (search.hasMore()) {
                        Attributes att = (Attributes) search.next().getAttributes();
                        System.out.println("<br>Welcome, " + att.get("cn"));
                        System.out.println("ou :" + att.get("ou"));
                        usernameStr = att.get("cn").get() + "";
                        role = "student";

                    } else {
                        search = ctx.search("OU=Staff,dc=it,dc=kmitl,dc=ac,dc=th", "samaccountname=" + username, constraints);
                        System.out.println("Result Search  " + search);
                        if (search.hasMore()) {
                            Attributes att = (Attributes) search.next().getAttributes();
                            System.out.println("<br>Welcome, " + att.get("cn"));
                            System.out.println("ou :" + att.get("ou"));
                            usernameStr = att.get("cn").get() + "";
                            role = "management";

                        }
                    }
                }
// Close the context when we're done
                b = true;
                ctx.close();

            } catch (NamingException e) {
                e.printStackTrace();
                b = false;
            } finally {
                if (b) {
                    System.out.print("Success");
                   // out.print("Success");
                    strUrl = SUCCESS;
                    session.setAttribute("username", usernameStr);
                    session.setAttribute("userid", username);
                    session.setAttribute("role", role);
                    String[] split = usernameStr.split(" ");
                   // out.print(split);
                    session.setAttribute("firstname", split[0]);
                    session.setAttribute("lastname", split[1]);
                    System.out.println(session.getAttribute("firstname") + "  " + session.getAttribute("lastname"));
//                    RequestDispatcher rd = request.getRequestDispatcher("main.jsp");
//                    rd.forward(request, response);
                    System.out.println(username);
                  //  out.print(session.getAttribute("firstname"));
                    if (username.startsWith("it") && role.equals("student") && mobile.equals("no")) {
                        try {
                            conn = (Connection) this.getServletContext().getAttribute("conn");
                            String sql = "select * from user where username = '" + username + "'";
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery(sql);
                            if (rs.next()) {
                                System.out.println("Userid = " + rs.getString(1));
                                session.setAttribute("id", rs.getString(1));
                                //response.sendRedirect("main.jsp");
                                out.print("true");

                            } else {
                                //  System.out.println("Userid = " + rs.getString(1));

                                // session.setAttribute("id", rs.getString(1));

                                // response.sendRedirect("main.jsp?v=999&test=" + username);
                                out.print("false");
                            }

                        } catch (SQLException ex) {
                            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    } else if (role.equals("lecturer") && !username.startsWith("it")) {
                        try {
                            conn = (Connection) this.getServletContext().getAttribute("conn");
                            String sql = "select * from lecturer  where username = '" + username + "'";
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery(sql);
                            if (rs.next()) {
                                System.out.println("Userid = " + rs.getString(1));
                                session.setAttribute("id", rs.getString(1));
                                // response.sendRedirect("lecturer/main.jsp");
                                out.print("true");

                            } else {
                                //  System.out.println("Userid = " + rs.getString(1));

                                // session.setAttribute("id", rs.getString(1));

                                //response.sendRedirect("lecturer/main.jsp?v=999&test=" + username);
                                out.print("false");

                            }

                        } catch (SQLException ex) {
                            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
                        }

                    } else if (role.equals("staff") && !username.startsWith("it")) {
                        try {
                            conn = (Connection) this.getServletContext().getAttribute("conn");
                            String sql = "select * from admin  where username = '" + username + "'";
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery(sql);
                            if (rs.next()) {
                                System.out.println("Userid = " + rs.getString(1));
                                session.setAttribute("id", rs.getString(1));
                                session.setAttribute("department", rs.getString("department"));
                                // response.sendRedirect("management/main.jsp");
                                out.print("true");

                            } else {
                                //  System.out.println("Userid = " + rs.getString(1));

                                // session.setAttribute("id", rs.getString(1));

                                //response.sendRedirect("management/main.jsp?v=999&test=" + username);
                                out.print("false");

                            }

                        } catch (SQLException ex) {
                            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
                        }

                    } else if (mobile.equals("yes") && username.startsWith("it") && role.equals("student")) {
                     //   response.sendRedirect("m/home.jsp");
                    } else {
                      //  response.sendRedirect("login.jsp?error=2");
                    }

                } else {
                    System.out.print("Failure");
                    out.print("Failure, Username = "+username+" and password = "+password);
                    //response.sendRedirect("login.jsp?error=1");
                    strUrl = FAILURE;
                }
            }


           
//             */
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
