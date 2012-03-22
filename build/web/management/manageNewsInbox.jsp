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
<!DOCTYPE html>

<div style="width: 150%">
    <sql:query var="result" dataSource="db">
        SELECT id,userid,topic,story,fromdate,todate,forusergroupid,newstypeid,mediaid,attachment,status,remark from news order by id desc;
    </sql:query>

    <table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
        <!-- column headers -->
        <label>Operation : </label> <input type="button" name="actall" value="Active All" onClick="setAllSelectedActive();"/>
                 | <input type="button" name="inactall" value="Inactive All" onClick="setAllSelectedInActive();"/>
        <thead>
            <tr style="font-size: 14px">
                <th>User ID</th>
                <th>Headline</th>
<!--                <th>Story</th>-->
                <th>Post Date</th>
                <th>Publish Until</th>
                <th>User Group ID</th>
                <th>News Type ID</th>
                <th>Media ID</th>
                <th>Attachment</th>
                <th style="width: 20%">News Status<br>
                </th>
                <th>Remark</th>
            </tr>
            </thread>
            <!-- column data -->
        <tbody>
            <c:forEach var="row" items="${result.rows}">
                <tr class="">
                    <td style="text-align: CENTER;"><c:out value="${row.userid}"/></td>
                    <td style="text-align: CENTER;"><a href="javascript:window.open('showNewsPage.jsp?newsid=${row.id}
','window','width=500,height=500,scrollbars=no,resizable=no,toolbar=no,directories=no,location=no,menubar=no,status=no,left=0,top=0'); "><c:out value="${row.topic}"/><img src="images/magnify.png"/></a></td>
<!--                    <td style="text-align: CENTER;"><c:out value="${row.story}"/></td>-->
                    <td style="text-align: CENTER;"><c:out value="${row.fromdate}"/></td>
                    <td style="text-align: CENTER;"><c:out value="${row.todate}"/></td>
                    <td style="text-align: CENTER;"><c:out value="${row.forusergroupid}"/></td>
                    <td style="text-align: CENTER;"><c:out value="${row.newstypeid}"/></td>
                    <td style="text-align: CENTER;"><c:out value="${row.mediaid}"/></td>
                    <td style="text-align: CENTER;"><c:out value="${row.attachment}"/></td>
                    <td style="text-align: LEFT;">Status :<b> <c:out value="${row.status}"/></b><br>
                        <input type="radio" name="status" value="active" onclick="setSelectedActive(${row.id})"/>active
                        <input type="radio" name="status" value="inactive" onclick="setSelectedInActive(${row.id})"/>inactive
                        
                    </td>
                    <td style="text-align: LEFT;"><c:out value="${row.remark}"/></td>

                </tr>
            </c:forEach>
        </tbody>   

    </table>

</div>
<script type="text/javascript">
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