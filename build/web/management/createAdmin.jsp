<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : createAdmin
    Created on : Mar 12, 2012, 5:17:58 PM
    Author     : RcKShT
--%>
<% String ct = this.getServletContext().getContextPath(); %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="<%=ct%>/css/cssForSendNews.css" rel="stylesheet" type="text/css">


<div style="margin-top: 50px;">
<div class ="form_wrapper" id="form_wrapper"  >
    <sql:query var="result" dataSource="db">
        SELECT *  from admin;
    </sql:query>
        <h1> Add New Admin</h1>
    <form action="/IDS/insertAdminServlet" method="GET" class="login active">
        
        
        <table border="0">
            <h3>  <font style="color: RED;">(*)</font> เป็นข้อมูลที่จำเป็นที่ต้องกรอก</h3>
                            <tbody>
                                <tr>
                                    <td><label>ชื่อ: <font style="color: RED">(*)</font></label>
                                        <input type="text" name="fname" id="fname" placeholder="" value="" autofocus="autofocus"/></td>
                                    <td><label>นามสกุล: <font style="color: RED">(*)</font></label>
                                        <input type="text" name="lname" placeholder="" value="" /></td>
                                </tr>
                                <tr>
                                    <td><label>Username: <font style="color: RED">(*)</font></label>
                                        <input type="text" name="username" placeholder=""  value=""/>
                                    </td>
                                    <td><label>Password: <font style="color: RED">(*)</font></label>
                                        <input type="password" name="password" placeholder="" value=""/>
                                    </td>
                                    <td><label>Remark: <font style="color: RED">(*)</font></label>
                                        <input type="text" name="remark" placeholder=""  value=""/>
                                    </td>
                                </tr>

            
       </table>
        <input type="submit" name="save" value="Save" align ="left"/>
    </form>
</div>

    </div>

        


