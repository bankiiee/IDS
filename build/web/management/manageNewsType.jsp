<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%String ct = this.getServletContext().getContextPath();%>
<%-- 
    Document   : manageNewsType
    Created on : Jan 15, 2012, 11:20:26 PM
    Author     : Bankiiee
--%>
<!--<script type="text/javascript">
    $(document).ready(function() {
        $('#example').dataTable();
    } );
</script>-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<h1>จัดการประเภทข่าวสาร กลุ่มผู้รับสาร และช่องทางการได้มาของข่าวสาร</h1>

<div style="width: 33%; float: left;margin-right: 1px; border-right: 1px dashed black"  >
    <sql:query var="result" dataSource="db">
        SELECT newstype.id , newstype.name  from newstype;
    </sql:query>

    NewsType
    <form action="/IDS/typeServlet" method="GET">
        <input type="txtbox" name="typeName" value="" /> <input type="submit" name="add" value="Add" /></form> <br>
    <form action="/IDS/deleteNewsTypeServlet" method="GET">
        <table cellpadding="0" cellspacing="0" border="0" class="display" id="example">

            <!-- column headers -->

            <thead>
                <tr style="font-size: 14px">
                    <th> ID </th>
                    <th> Name </th>
                    <th> Selected </th>

                </tr>
                </thread>
                <!-- column data -->
            <tbody>

                <c:forEach var="row" items="${result.rows}">
                    <tr class="">

                        <td style="text-align: CENTER;"><c:out value="${row.id}"/></td>
                        <td style="text-align: CENTER;"><a onClick="doeditnewstype(${row.id})"><c:out value="${row.name}"/></a></td>
                        <td style="text-align: CENTER;"><input type="checkbox" name="select" value="${row.id}"/>
                    </tr>
                </c:forEach>
            </tbody>   

        </table>
        <center><input type="submit" name="remove" value="Remove Selected" /></center>
    </form>

</div>
<script type="text/javascript">
    function doeditnewstype(id){
       // var temp = document.getElementById(id); 
        var name = prompt("แก้ไข");
    
        
        $.ajax({
            url: '../editNewsTypeServlet',
            type: 'GET',
            data: 'name='+name+'&id='+id,
            success: function(result){
                                                        
                alert("Success:"+result);
                window.location.reload();
            }
        });
        
        

    }
</script>

<div style="width: 32%; float: left;margin-right: 1px; border-right: 1px dashed black"  >
    <sql:query var="result" dataSource="db">
        SELECT id , name  from usergroup;
    </sql:query>
    ForUserGroup <br>
    <form action="/IDS/addUserGroupServlet" method="GET">
        <input type="txtbox" name="groupName" value="" /><input type="submit" name="add" value="Add" /></form><br>
    <form action="/IDS/deleteUserGroupServlet" method="GET">
        <table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
            <!-- column headers -->
            <thead>
                <tr style="font-size: 14px">
                    <th> ID </th>
                    <th> Name </th>
                    <th> Selected </th>

                </tr>
                </thread>
                <!-- column data -->
            <tbody>
                <c:forEach var="row" items="${result.rows}">
                    <tr class="">

                        <td style="text-align: CENTER;"><c:out value="${row.id}"/></td>
                        <td style="text-align: CENTER;"><a onClick="doeditusergroup(${row.id})"><c:out value="${row.name}"/></td>
                        <td style="text-align: CENTER;"><input type="checkbox" name="select" value="${row.id}"/>

                    </tr>
                </c:forEach>
            </tbody>   

        </table>
        <center><input type="submit" name="remove" value="Remove Selected" /></center>
    </form>
</div>

<script type="text/javascript">
    function doeditusergroup(id){
       // var temp = document.getElementById(id); 
        var name = prompt("แก้ไข");
    
        
        $.ajax({
            url: '../editUserGroupServlet',
            type: 'GET',
            data: 'name='+name+'&id='+id,
            success: function(result){
                                                        
                alert("Success:"+result);
                window.location.reload();
            }
        });
        
        

    }
</script>

<div style="width: 32%; float: left;"  >
    <sql:query var="result" dataSource="db">
        SELECT id , name  from inputmedia;
    </sql:query>
    Media<br> 
    <form action="/IDS/addMediaServlet" method="GET">
        <input type="txtbox" name="mediaName" value="" /><input type="submit" name="add" value="Add" /></form><br>
    <form action="/IDS/deleteMediaServlet" method="GET">
        <table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
            <!-- column headers -->
            <thead>
                <tr style="font-size: 14px">
                    <th> ID </th>
                    <th> Name </th>
                    <th> Selected </th>

                </tr>
                </thread>
                <!-- column data -->
            <tbody>
                <c:forEach var="row" items="${result.rows}">
                    <tr class="">

                        <td style="text-align: CENTER;"><c:out value="${row.id}"/></td>
                        <td style="text-align: CENTER;"><a onClick="doeditmedia(${row.id})"><c:out value="${row.name}"/></td>
                        <td style="text-align: CENTER;"><input type="checkbox" name="select" value="${row.id}"/>

                    </tr>

                </c:forEach>

            </tbody>   

        </table>
        <center><input type="submit" name="remove" value="Remove Selected" /></center>
    </form>
</div>

<script type="text/javascript">
    function doeditmedia(id){
       // var temp = document.getElementById(id); 
        var name = prompt("แก้ไข");
    
        
        $.ajax({
            url: '../editMediaServlet',
            type: 'GET',
            data: 'name='+name+'&id='+id,
            success: function(result){
                                                        
                alert("Success:"+result);
                window.location.reload();
            }
        });
        
        

    }
</script>

