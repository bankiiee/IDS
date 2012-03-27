<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : showArticle
    Created on : Mar 26, 2012, 1:51:13 AM
    Author     : bankiiee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script type="text/javascript">
        
</script>
<sql:query var="result" dataSource="db">
    select * from news where id = ${param.nid}
</sql:query>

 <c:forEach var="item" items="${result.rows}">

            <div class="newsDetail" style="background-color: white">
                <h3><b>${item.topic}</b></h3>
                ${item.story}
                <br><b>ประกาศโดย:</b> ${item.publisher} <b>วันที่ประกาศ:</b> ${item.fromdate} 
                <b>หมวดหมู่:</b> 
                <sql:query var="result2" dataSource="db">
                    SELECT * from newstype where id = ${item.newstypeid};
                </sql:query>
                <c:forEach var="row" items="${result2.rows}">
                    ${row.name}
                </c:forEach>
                <b>ระดับ:</b> ${item.priorityid}
            </div>
        </c:forEach>