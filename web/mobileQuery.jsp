<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <sql:query var="item" dataSource="db">
           select * from user where username like '${param.username}'
        </sql:query>
    <c:forEach var="row" items="${item.rows}">
        ${row.fname}
    </c:forEach>
   
