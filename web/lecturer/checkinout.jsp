<%-- 
    Document   : checkinout
    Created on : Feb 28, 2012, 12:57:55 AM
    Author     : bankiiee
--%>
<%String ct = this.getServletContext().getContextPath();%>

<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="<%=ct%>/css/cssForStudentViewProfilePage.css" rel="stylesheet" type="text/css">
<sql:query var="result" dataSource="db">
    SELECT DISTINCT * FROM user u, lecturer l where u.id = l.id and u.username = '${userid}'
</sql:query>

<!DOCTYPE html>
<div>
    <div class="wrapper">
        <c:forEach var="item" items="${result.rows}">

            <div class="content">
                <div id="form_wrapper" class="form_wrapper">					
                    <form class="login active" name ="updateForm" action="<%=ct%>/DoCheckInServlet" method="GET">
                        <center><h3>Check-in / Check-out <br>

                            </h3></center>
                        <div>
                            <table border="0">
                                <font style="color: RED;">(*)</font> เป็นข้อมูลที่จำเป็นที่ต้องกรอก
                                <tbody>
                                    <tr>
                                        <td><label>ชื่อ: <font style="color: RED">(*)</font></label>
                                            <input type="text" name="fname" id="fname" placeholder="" value="${firstname}" disabled="true" autofocus="autofocus"/></td>
                                        <td><label>นามสกุล: <font style="color: RED">(*)</font></label>
                                            <input type="text" name="lname" placeholder="" value="${lastname}" disabled="true"/></td>
                                    </tr>
                                    <tr>
                                        <td><label>หมายเลขห้องพักอาจารย์: <font style="color: RED">(*)</font></label>
                                            <input type="text" name="room" placeholder="" disabled="true" value="${item.room}"/>
                                        </td>
                                        <td>
                                            <label>สถานะของท่าน: </label>                                          
                                            <input type="text" name="supdate" placeholder="I'm out to lunch" autofocus="autofocus"/>

                                        </td>
                                    </tr>
                                    <tr><td>

                                        </td><td></td></tr>
                                </tbody>
                            </table>


                        </div>
                        <div class="bottom">
                            <c:choose>
                                <c:when test="${row.status != 'In-Office'}">
                                    <input type="button" value="Check-In Now!"  name="checkin" onclick="doSubmit()" ></input>
                                </c:when>
                                <c:otherwise>
                                    <input type="button" value="Check-In Now!"  name="checkin" onclick="doSubmit()" ></input>
                                </c:otherwise>
                            </c:choose>
<!--                            <div class="remember"><input type="checkbox" /><span>ข้อมูลถูกต้อง</span></div>-->
                            <div class="clear"></div>
                        </div>
                    </form>

                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>
</c:forEach>

<script type="text/javascript">
   
    function doSubmit(){
        var ans = confirm('ผู้อื่นสามารถเห็นสถานะปัจจุบันของท่านได้ ยินยอม?');
        if(ans == true){
            document.forms["updateForm"].submit();
        }
    }
</script>
