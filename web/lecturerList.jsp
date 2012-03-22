<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : lecturerList
    Created on : Feb 10, 2012, 12:08:05 PM
    Author     : Bankiiee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script type="text/javascript">
    $(document).ready(function() {
        $('#example').dataTable(
    );
    } );
</script>
<div>
    <sql:query var="item" dataSource="db">
        select * from lecturer;
    </sql:query>

        <center>
            
            <h2>รายชื่ออาจารย์</h2>
    <table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
        <thead>
            <tr>
                <th ></th>
                <th >อาจารย์</th>
                <th >ห้องพักอาจารย์</th>
                <th >สถานะปัจจุบัน</th>
            </tr>
        </thead>
        <tbody style="text-align: CENTER;">
            <c:forEach var="row" items="${item.rows}">
                <tr>
                    <td><img src="images/icons/111-user.png" width="24" height="21" alt="111-user"/>
                    </td>
                    <td>${row.fname} ${row.lname}</td>
                    <td>${row.room}</td>
                    <td>${row.status}</td>
                </tr>
            </c:forEach>



        </tbody>
    </table>
        </center>
</div>


