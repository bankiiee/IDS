<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : manageNewsInbox
    Created on : Jan 15, 2012, 11:20:26 PM
    Author     : Bankiiee
--%>
<script type="text/javascript">
    $(document).ready(function() {
        $('#example').dataTable(
        {
            "sPaginationType" : "full_numbers"
        });
    } );
</script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String ct = this.getServletContext().getContextPath();%>
<!DOCTYPE html>

<div style="width: 200%; margin-top: 50px;" >
    <h1>Manage News Outbox</h1>

    <sql:query var="result" dataSource="db">
        SELECT * from news where status = 'active' order by id desc;
    </sql:query>

    <table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
        <!-- column headers -->
        <label>Operation : </label> <input type="button" name="actall" value="Active All" onClick="setAllSelectedActive();"/>
        | <input type="button" name="inactall" value="Inactive All" onClick="setAllSelectedInActive();"/>
        <thead>
            <tr style="font-size: 14px">
                <th style='width: 100px;'>Publisher</th>
                <th style="width: 250px">Headline</th>
                <!--                <th>Story</th>-->
                <th>Send Date</th>
                <th>User Group ID</th>
                <th>News Type ID</th>
                <th>Media ID</th>
                <th  style="width: 100px">Attachment</th>
                <th style="width: 200px">News Status<br>
                </th>
                <th>Priority</th>
            </tr>
            </thread>
            <!-- column data -->
        <tbody>
            <c:forEach var="row" items="${result.rows}">
                <tr class="">
                    <td style="text-align: CENTER;"><c:out value="${row.userid}"/></td>
                    <td style="text-align: CENTER;"><a onClick="doedit(${row.id})"><c:out value="${row.topic}"/></a></td>
                                                       <!--                    <td style="text-align: CENTER;"><c:out value="${row.story}"/></td>-->
                    <td style="text-align: CENTER; width: 75px;"><c:out value="${row.senddate}"/></td>

                    <td style="text-align: CENTER;">
                        <sql:query var="item2" dataSource="db">
                            select * from news_has_usergroup where newsid = ${row.id}
                        </sql:query>
                        <c:forEach var="row2" items="${item2.rows}">
                            ${row2.usergroupid} 
                        </c:forEach>

                    </td>
                    <td style="text-align: CENTER;">

                        <sql:query var="item3" dataSource="db">
                            select name from newstype where id = ${row.newstypeid}
                        </sql:query>
                        <c:forEach var="row3" items="${item3.rows}">
                            ${row3.name}
                        </c:forEach>
                    </td>
                    <td style="text-align: CENTER;">
                        <sql:query var="item4" dataSource="db">
                            select name from inputmedia where id = ${row.inputmediaid}
                        </sql:query>
                        <c:forEach var="row4" items="${item4.rows}">
                            ${row4.name}
                        </c:forEach>
                    </td>
                    <td style="text-align: CENTER;">
                        <a onClick="showPic('<%=ct%>/${row.attchpath}')">
                            <img src="<%=ct%>/${row.attchpath}" style="width: 48px;height: 48px;"/>
                        </a>
                    </td>
                    <td style="text-align: LEFT;width: 50px;">
                      <input type="radio" name="status" value="active" checked="checked"  onclick="setSelectedActive(${row.id})"/>   <b>active</b>
                        <input type="radio" name="status" value="inactive" onclick="setSelectedInActive(${row.id})"/>inactive
                    </td>
                    <td style="text-align: LEFT;">
                        <sql:query var="item" dataSource="db">
                            select name from priority where id = ${row.priorityid};
                        </sql:query>
                        <c:forEach var="row" items="${item.rows}">
                            ${row.name}
                        </c:forEach>

                    </td>

                </tr>
            </c:forEach>
        </tbody>   

    </table>

</div>
<div id="showPic">

</div>
<div id="showNews">

</div>

<script type="text/javascript">
    function doedit(id){
             var returnV = window.showModalDialog("showNewsPage.jsp?newsid="+id,"mywindow","width=500,height=500,scrollbars=no,resizable=no,toolbar=no,directories=no,location=no,menubar=no,status=no,left=0,top=0");
             if (returnV == 1){
                     window.location.reload();
             }
    }
    
    function showPic(picpath){
        //alert(picpath);
        document.getElementById("showPic").innerHTML = "<center><a href ='"+picpath+"'>Download Full-sized Picture</a><br><img src='"+picpath+"' style='width:70%;height:auto;'  /></center>";
        $("#showPic").dialog({show : 'slide',modal:true, width:640,height:600});
    }
    function setSelectedActive(id){
        //alert(id);
        $.ajax({
            url: '../ManageNewsInboxServlet',
            type: 'POST',
            data: 'mode=active&id='+id,
            success: function(result){
                                                        
                alert("Success: "+result);
                window.location.reload();
            }
        });

    }    

    function setSelectedInActive(id){
        $.ajax({
            url: '../ManageNewsInboxServlet',
            type: 'POST',
            data: 'mode=inactive&id='+id,
            success: function(result){
                                                        
                alert("Success: "+result);
                window.location.reload();
            }
        });
    }
    function setAllSelectedActive(){
        //alert(id);
        $.ajax({
            url: '../ManageNewsInboxServlet',
            type: 'POST',
            data: 'mode=active_all',
            success: function(result){
                                                        
                alert("Success: "+result);
                window.location.reload();
            }
        });

    }
    function setAllSelectedInActive(){
        //alert(id);
        $.ajax({
            url: '../ManageNewsInboxServlet',
            type: 'POST',
            data: 'mode=inactive_all',
            success: function(result){
                                                        
                alert("Success: "+result);
                window.location.reload();
            }
        });

    }    


</script>