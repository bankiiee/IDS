<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%String ct = this.getServletContext().getContextPath();%>

<%-- 
    Document   : readmoreNews
    Created on : Mar 27, 2012, 3:35:03 PM
    Author     : bankiiee
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script type="text/javascript">
    $(document).ready(function() {
        $('#example').dataTable(
        {
            "sPaginationType" : "full_numbers"
        });
    } );
    
   function showMore(id){
      // alert(1);
       $( "#showmore" ).load('readmoreNewsDetail.jsp?newsid='+id).dialog({
        height: 400,
        width:450,
        modal: true
    });
   }
</script>



<div style="width: 100%; margin-top: 50px;" >
    <h1>Read More News</h1>

    <sql:query var="result" dataSource="db">
        SELECT id,publisher,topic,story,fromdate,attchpath from news order by id desc;
    </sql:query>

    <table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
        <!-- column headers -->

        <thead>
            <tr style="font-size: 14px">
                <th style='width: 40px;'>Publisher</th>
                <th style='width: auto;'>Headline</th>
                <!--                <th>Story</th>-->
                <th>Post Date</th>

                <th>Attachment</th>

            </tr>
            </thread>
            <!-- column data -->
        <tbody>
            <c:forEach var="row" items="${result.rows}">
                <tr class="">
                    <td style="text-align: CENTER;"><c:out value="${row.publisher}"/></td>
                    <td style="text-align: CENTER;"><a onClick="showMore(${row.id})"><c:out value="${row.topic}"/></a></td>
                                                       <!--                    <td style="text-align: CENTER;"><c:out value="${row.story}"/></td>-->
                    <td style="text-align: CENTER;"><c:out value="${row.fromdate}"/></td>

                    <td style="text-align: CENTER;">
                        <a onClick="showPic('<%=ct%>/${row.attchpath}')">
                            <img src="<%=ct%>/${row.attchpath}" style="width: 48px;height: 48px;"/>
                        </a>
                    </td>

                </tr>
            </c:forEach>
        </tbody>   

    </table>
        
        <div id="showmore"></div>

</div>