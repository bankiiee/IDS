<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : manageUser
    Created on : Feb 29, 2012, 11:02:12 PM
    Author     : RcKShT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class ="wrapper"  >
    <sql:query var="result" dataSource="db">
        SELECT *  from user;
    </sql:query>

    <form action="/IDS/deleteUserServlet" method="GET">
        
        <table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
            

            <!-- column headers -->

            <thead>
                <tr style="font-size: 14px">
                    <th> ID </th>
                    <th> Username </th>
                    <th> FirstName </th>
                    <th> LastName </th>

                    <th> Selected to Edit </th>
                    <th> Selected to Remove </th>

                </tr>
                </thread>
                <!-- column data -->
            <tbody>
            
                <c:forEach var="row" items="${result.rows}">
                     
                    <tr class="">
                        
                        <td style="text-align: CENTER;"><c:out value="${row.id}"/></td>
                        <td style="text-align: CENTER;"><a><c:out value="${row.username}"/></td>
                        <td style="text-align: CENTER;"><a><c:out value="${row.fname}"/></td>
                        <td style="text-align: CENTER;"><a><c:out value="${row.lname}"/></td>
                        <td style="text-align: CENTER;"><a href="main.jsp?v=110&id=${row.id}" ><input type="button" name="${row.id}" value="edit"/></a></td>
                        <td style="text-align: CENTER;"><input type="checkbox" name="select" value="${row.id}"/>

                    </tr>
                    </form>
                </c:forEach>
            
            </tbody>   
            
       </table>
        
        <center><input type="submit" name="remove" value="Remove Selected" /></center>

    </form>
</div>


