<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : deleteNews
    Created on : Mar 27, 2012, 6:24:10 PM
    Author     : RcKShT
--%>

<script type="text/javascript">
    $(document).ready(function() {
        $('#example').dataTable(
        {
            "sPaginationType" : "full_numbers"
        });
    } );
</script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String ct = this.getServletContext().getContextPath();%>

<div style="width: 100%; margin-top: 50px;" >
    <h1>Delete News</h1>
    <form action="/IDS/deleteNewsServlet" method="GET">
        <sql:query var="result" dataSource="db">
            SELECT * from news where status like 'inactive' order by id desc;
        </sql:query>
        <input type="submit" name="remove" value="Remove Selected" />
        <table cellpadding="0" cellspacing="0" border="0" class="display" id="example">



            <thead>
                <tr style="font-size: 14px">
                    <th style='width: 90px;'>Publisher</th>
                    <th style ="width: 34%">Headline</th>
                    <th>Post Date</th>
                    <th style="width: 14%">News Status<br>
                    </th>

                    <th> Selected to Remove </th>
                </tr>
                </thread>

            <tbody>
                <c:forEach var="row" items="${result.rows}">
                    <tr class="">
                        <td style="text-align: CENTER;"><c:out value="${row.publisher}"/></td>
                        <td style="text-align: CENTER;"><c:out value="${row.topic}"/></td>
                                                           <!--                    <td style="text-align: CENTER;"><c:out value="${row.story}"/></td>-->
                        <td style="text-align: CENTER; width: 75px;"><c:out value="${row.fromdate}"/></td>
                        <td style="text-align: LEFT;width: 50px;">Status :<b>${row.status}</b></td>

                        <td style="text-align: CENTER;"><input type="checkbox" name="select" value="${row.id}"/></td>
                        </c:forEach>


            </tbody>
        </table>

    </form>
</div>