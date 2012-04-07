<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : adminUpdateProfile
    Created on : Mar 13, 2012, 12:19:01 AM
    Author     : RcKShT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class ="wrapper"  >
    <sql:query var="result" dataSource="db">
        SELECT * from admin  a, user u where a.id=u.id;
    </sql:query>

        <div style="margin-top: 50px;">
            <h1>Admin Manage Admin</h1>
    <form action="/IDS/deleteAdminServlet" method="GET">
        
        <table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
            

            <!-- column headers -->

            <thead>
                <tr style="font-size: 14px">
                    <th> ID </th>
                    <th> FirstName </th>
                    <th> LastName </th>
                    <th> Username </th>

                    <th> Selected to Edit </th>
                    <th> Selected to Remove </th>

                </tr>
                </thread>
                <!-- column data -->
                
            <tbody>
           
                <c:forEach var="row" items="${result.rows}">
                     
                    <tr class="">
                        
                        <td style="text-align: CENTER;"><c:out value="${row.id}"/></td>
                        <td style="text-align: CENTER;"><a><c:out value="${row.fname}"/></td>
                        <td style="text-align: CENTER;"><a><c:out value="${row.lname}"/></td>
                        <td style="text-align: CENTER;"><a><c:out value="${row.username}"/></td>
                        <td style="text-align: CENTER;"><a href="main.jsp?v=111&id=${row.id}" ><input type="button" name="${row.id}" value="edit"/></a></td>
                        <td style="text-align: CENTER;"><input type="checkbox" name="select" value="${row.id}"/>

                    </tr>
                    </form>
                </c:forEach>
            
            </tbody>   
            
       </table>
        
        <center><input type="submit" name="remove" value="Remove Selected" /></center>

    </form>
</div>
</div>
