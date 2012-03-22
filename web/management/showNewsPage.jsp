<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : showNewsPage
    Created on : Jan 19, 2012, 11:18:09 PM
    Author     : bankiiee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div>
    
    <sql:query var="item" dataSource="db">
        SELECT * from news where id = ${param.newsid}
        
    </sql:query>
        <c:forEach var="row" items="${item.rows}">
            <center><h2 style="color: lightseagreen">${row.topic}</h2></center>
            <p style="font-size: 16px;">${row.story}</p>
        </c:forEach>
</div>
