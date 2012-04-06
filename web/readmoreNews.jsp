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
        SELECT id,userid,topic,story,senddate  from news  where status like 'active' order by id desc;
    </sql:query>

    <table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
        <!-- column headers -->

        <thead>
            <tr style="font-size: 14px">
                <th style='width: 40px;'>Publisher</th>
                <th style='width: auto;'>Headline</th>
                <!--                <th>Story</th>-->
                <th style="width:15%;">Post Date</th>

                <th>Attachment</th>

            </tr>
            </thread>
            <!-- column data -->
        <tbody>
            <c:forEach var="row" items="${result.rows}">
                <tr class="">
                    <td style="text-align: CENTER;">
                        <sql:query var="item3" dataSource="db">
                            SELECT *  FROM user where id = ${row.userid}
                        </sql:query>
                        <c:forEach var="row3" items="${item3.rows}">
                                 ${row3.fname} ${row3.lname}

                        </c:forEach>
                    
                    </td>
                    <td style="text-align: CENTER;"><a onClick="showMore(${row.id})"><c:out value="${row.topic}"/></a></td>
                                                       <!--                    <td style="text-align: CENTER;"><c:out value="${row.story}"/></td>-->
                    <td style="text-align: CENTER;"><c:out value="${row.senddate}"/></td>

                    <td style="text-align: CENTER;">
                        <sql:query var="item2" dataSource="db">
                            SELECT * FROM picture where newsid = ${row.id}
                        </sql:query>

                            <c:forEach var="row2" items="${item2.rows}">
                                 <a onClick="showPic('<%=ct%>/${row2.path}')">
                            <img src="<%=ct%>/${row2.path}" style="width: 48px;height: 48px;"/>
                        </a>
                            </c:forEach>
                       
                    </td>

                </tr>
            </c:forEach>
        </tbody>   

    </table>
        
        <div id="showmore"></div>

</div>