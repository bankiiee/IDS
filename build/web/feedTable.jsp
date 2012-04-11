<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : feedTable
    Created on : Mar 24, 2012, 11:03:07 PM
    Author     : bankiiee
--%>
<%String ct = this.getServletContext().getContextPath();%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script type="text/javascript">
    $(document).ready(function() {
        $('#example').dataTable(
        {
            "sPaginationType" : "full_numbers"
        }); 
       
    } );
    
    $(function() {
       
        
        $('#sortable').masonry({
            // options
            itemSelector : '.newsDetail',
            columnWidth : 20,
            isAnimated: !Modernizr.csstransitions,
            animationOptions: {
                duration: 400
            }
        });
        $( "#sortable" ).sortable({
            appendTo: '#topic' 
        });
        $( "#draggable" ).draggable({
            revert: "invalid"
        });
        $( "ul, li" ).disableSelection();
    });
        
    function showArticle(newsid, topic, story){
        var cssObj = {
            'height':'600','width':'600'
        }

        $("#"+newsid).clone().css(cssObj).dialog({show : 'slide',modal:true,width:600,height:600,buttons: {
                "Share to Facebook": function() {
                    //                    var status = window.showModalDialog("http://www.facebook.com/sharer.php?u="+window.location.href+"&amp;t="+topic+"<br>"+story, 'popup');
                    //  alert(topic);
                    window.location.href = '../sharefb.jsp?topic='+topic+"&story="+story;
                    $( this ).dialog( "close" );
                },
                "Share to Twitter": function() {
                    window.open("http://twitter.com/home?status=via 'IDS' - "+topic+"%20%20"+window.location.href);
       

                    $( this ).dialog( "close" );
                }
            }});
    }
    function showAttch(path){
        var attch = document.getElementById("showAttch").innerHTML = "<center><a href ='"+path+"'>Download Full-sized Picture</a><br><img src='"+path+"' style='width:70%;height:auto;'  /></center>";
        $("#showAttch").dialog({show:'slide',width:600,height:600});
    }
    
</script>
<c:choose>
    <c:when test="${param.pri != null}">
        <sql:query var="result" dataSource="db">
            select * from news n, news_has_usergroup h  where n.id = h.newsid and h.usergroupid = (select id from usergroup where id = h.usergroupid) and h.usergroupid = (select usergroupid from user where id = ${id}) and n.status like 'active' and n.newstypeid = ${param.pri} order by priorityid asc limit 10;
        </sql:query>
    </c:when>
    <c:when test="${param.pri == 0}">
        <sql:query var="result" dataSource="db">
            SELECT * from news  where newstypeid = 5 and status like 'active'  order by priorityid desc;
        </sql:query>
    </c:when>
    <c:otherwise>
        <sql:query var="result" dataSource="db">
            select * from news n, news_has_usergroup h  where n.id = h.newsid and h.usergroupid = (select id from usergroup where id = h.usergroupid) and h.usergroupid = (select usergroupid from user where id = ${id}) and n.status like 'active' order by priorityid asc limit 10;
        </sql:query>
    </c:otherwise>
</c:choose>





<div class="newsthumb" style="width: 1000px">
    <ul id="draggable" class=""> <h1>News</h1></ul>
    <ul id="sortable" style="">

        <c:forEach var="item" items="${result.rows}">
            <a onclick="showArticle(${item.id},'${item.topic}','${item.story}')">
                <div class="newsDetail"  style="background-color: white">
                    <span id="${item.id}">
                        <sql:query var="pic" dataSource="db">
                            SELECT * FROM picture where newsid = ${item.id}
                        </sql:query>
                        <c:forEach var="picrow" items="${pic.rows}">
                            
                            <img src="<%=ct%>/${picrow.path}" height="80" width="80" onclick="showAttch('<%=ct%>/${picrow.path}')"/>

                        </c:forEach>
                           
                        <h3> <b>${item.topic}</b></h3>
                        ${item.story} 
                        <p><b>ประกาศโดย:</b>
                            <sql:query var="who" dataSource="db">
                                SELECT * FROM user where id =  ${item.userid} 
                            </sql:query>
                            <c:forEach var="whorow" items="${who.rows}">
                                ${whorow.fname} ${whorow.lname}
                            </c:forEach>

                            <b>วันที่ประกาศ:</b> ${item.senddate} 
                            <b>หมวดหมู่:</b> 
                            <sql:query var="result2" dataSource="db">
                                SELECT * from newstype where id = ${item.newstypeid};
                            </sql:query>
                            <c:forEach var="row" items="${result2.rows}">
                                ${row.name}
                            </c:forEach>

                    </span>
                </div>

            </a>


        </c:forEach>
        <div class="newsDetail">
            <a href="main.jsp?v=rm"><h3>Read More</h3></a>
        </div>
    </ul>
</div>
<div id="showAttch" style="">
</div>




<!--         <a href="http://twitter.com/home?status=Custom%20status%20here" target="_blank">Post to Twitter!</a>-->
