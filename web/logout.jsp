<%-- 
    Document   : logout
    Created on : Sep 18, 2011, 9:52:38 AM
    Author     : bankiiee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ออกจากระบบ</title>
    </head>
    <body>
        <%session.invalidate();%>
        <script type="text/javascript">
            alert("ทำการออกจากระบบเรียบร้อยแล้ว");
            window.location='index.jsp';
        </script>
    </body>
</html>
