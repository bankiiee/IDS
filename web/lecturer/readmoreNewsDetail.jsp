<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%String ct = this.getServletContext().getContextPath();%>
<%-- 
    Document   : showNewsPage
    Created on : Jan 19, 2012, 11:18:09 PM
    Author     : bankiiee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script type="text/javascript">
  function showPic(picpath){
        //alert(picpath);
        document.getElementById("showPic").innerHTML = "<center><a href ='"+picpath+"'>Download Full-sized Picture</a><br><img src='"+picpath+"' style='width:70%;height:auto;'  /></center>";
        $("#showPic").dialog({show : 'slide',modal:true, width:640,height:600});
    }
</script>
</div>
<div>
    
    <sql:query var="item" dataSource="db">
        SELECT * from news where id = ${param.newsid}
        
    </sql:query>
        <c:forEach var="row" items="${item.rows}">
            <center><h2 style="color: lightseagreen">${row.topic}</h2></center>
            <p style="font-size: 16px;">${row.story}</p>
            <p>Attachment :
                  <sql:query var="item2" dataSource="db">
                            SELECT * FROM picture where newsid = ${row.id}
                        </sql:query>

                            <c:forEach var="row2" items="${item2.rows}">
                                 <a onClick="showPic('<%=ct%>/${row2.path}')">
                            <img src="<%=ct%>/${row2.path}" style="width: 48px;height: 48px;"/>
                        </a>
                            </c:forEach>
                
        </c:forEach>
</div>
<div id="showPic"></div>
