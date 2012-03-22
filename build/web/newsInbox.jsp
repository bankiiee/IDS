<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : manageNewsInbox
    Created on : Jan 15, 2012, 11:20:26 PM
    Author     : Bankiiee
--%>
<script type="text/javascript">
    $(document).ready(function() {
        $('#example').dataTable();
    } );
    function showNewsDialog(newsid){
        
//        $.ajax({
//            url: "/ajax_pages/my_page.ext",
//            data: {....},
//            success: function(data) {
//              $(dialogName).append(data);

        //alert(newsid);
        $( "#show-news" ).load('showNewsPage.jsp?newsid='+newsid).dialog({
            height: 400,
            width:450,
            modal: true
        });
    }
    
</script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div>
    <sql:query var="result" dataSource="db">
        SELECT id,topic,story,fromdate,todate,forusergroupid,newstypeid,mediaid,attachment,status,remark from news;
    </sql:query>

    <table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
        <!-- column headers -->
        <thead>
            <tr style="font-size: 14px">

                <th>Headline</th>
            
                <th>Post Date</th>
                <th>Publish Until</th>
                <th>User Group ID</th>
                <th>News Type ID</th>
                <th>Media ID</th>
                <th>Attachment</th>
                <th>News Status</th>
                <th>Remark</th>
            </tr>
            </thread>
            <!-- column data -->
        <tbody>
            <c:forEach var="row" items="${result.rows}">
                <tr class="">
                    <td><a  onclick="showNewsDialog(${row.id})">${row.topic}</a></td>
                    <td>${row.fromdate}</td>
                    <td>${row.todate}</td>
                    <td>${row.forusergroupid}</td>
                    <td>${row.newstypeid}</td>
                    <td>${row.mediaid}</td>
                    <td>${row.attachment}</td>
                    <td>${row.status}</td>
                    <td>${row.remark}</td>
                </tr>
            </c:forEach>
        </tbody>   

    </table>

        <div id="show-news" >
            
        </div>
</div>

