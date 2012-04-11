<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : createAdmin
    Created on : Mar 12, 2012, 5:17:58 PM
    Author     : RcKShT
--%>
<% String ct = this.getServletContext().getContextPath();%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="<%=ct%>/css/cssForSendNews.css" rel="stylesheet" type="text/css">
   <sql:query var="user" dataSource="db">
            SELECT *  from user u, admin a where u.id = a.id;
        </sql:query>

<div style="margin-top: 50px;">
    <div class ="form_wrapper" id="form_wrapper"  >
        <sql:query var="result" dataSource="db">
            SELECT *  from admin a, user u where u.id != a.id ;
        </sql:query>
        <h1> Add New Staff Admin</h1>
        <form action="/IDS/insertAdminServlet" method="GET" class="login active" name="addForm" id="addForm">
            <table border="0">
                <h3>  <font style="color: RED;">(*)</font> เป็นข้อมูลที่จำเป็นที่ต้องกรอก</h3>
                <tbody>
                    <!--                                <tr>
                                                        <td><label>ชื่อ: <font style="color: RED">(*)</font></label>
                                                            <input type="text" name="fname" id="fname" placeholder="" value="" autofocus="autofocus"/></td>
                                                        <td><label>นามสกุล: <font style="color: RED">(*)</font></label>
                                                            <input type="text" name="lname" placeholder="" value="" /></td>
                                                    </tr>-->
                    <tr>
                            <label>Select User from the list :</label>
                <select name="userid" id="userid">
                    <c:forEach var="userrow" items="${user.rows}">
                        <option value="${userrow.id}">${userrow.fname} ${userrow.lname} (${userrow.username})</option>
                    </c:forEach>
                </select>
                        
                    </tr>
                    <tr>
<!--                        <td><label>Username: <font style="color: RED">(*)</font></label>
                            <input type="text" name="username" placeholder=""  value="" id="username"/>
                        </td>-->
                        <td><label>Password: <font style="color: RED">(*)</font></label>
                            <input type="password" name="password" placeholder="" value="" id="password"/>
                        </td>
                        <td><label>Remark: <font style="color: RED"></font></label>
                            <input type="text" name="remark" placeholder=""  value=""/>
                        </td>
                    </tr>


            </table>
            <input type="button" name="save" value="Save" align ="left" onclick="formSubmit()"/>
        </form>
    </div>
    <script type="text/javascript">
        function formSubmit(){
            //alert(1);
            if(document.getElementById("username").value != ''  &&document.getElementById("userid").value !='' ){
                document.forms["addForm"].submit()
            }else{
                alert("Something Wrong");
            }
        }
    </script>
</div>




