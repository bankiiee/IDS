<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : createAdmin
    Created on : Mar 12, 2012, 5:17:58 PM
    Author     : RcKShT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="css/cssForStudentViewProfilePage.css" rel="stylesheet" type="text/css">
<div class ="wrapper"  >
    <sql:query var="result" dataSource="db">
        SELECT *  from admin;
    </sql:query>

    <form action="/IDS/insertAdminServlet" method="GET">
        
        <table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
            <table border="0">
                            <font style="color: RED;">(*)</font> เป็นข้อมูลที่จำเป็นที่ต้องกรอก
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


        


