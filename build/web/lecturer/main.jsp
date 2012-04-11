<%String ct = this.getServletContext().getContextPath();%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : main
    Created on : Aug 25, 2011, 8:06:15 PM
    Author     : bankiiee
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IDS | Lecturer | ${firstname}</title>
        <link href="<%=ct%>/css/cssForMainPage.css" rel="stylesheet" type="text/css">
        <link href="<%=ct%>/css/custom-theme/jquery-ui-1.8.18.custom.css" rel="stylesheet" type="text/css">
        <script src="<%=ct%>/scripts/cufon-yui.js" type="text/javascript"></script>
        <script src="<%=ct%>/scripts/ChunkFive_400.font.js" type="text/javascript"></script>
        <script type="text/javascript" src="<%=ct%>/scripts/jquery-1.6.2.js"></script>
        <script type="text/javascript" src="<%=ct%>/scripts/jquery.cycle.all.js"></script>
        <script type="text/javascript" src="<%=ct%>/scripts/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="<%=ct%>/scripts/jquery-ui-1.8.18.custom.min.js"></script>
        <script type="text/javascript" src="<%=ct%>/scripts/scriptForMainPage.js"></script>
        <link type="text/css" href="<%=ct%>/css/menu.css" rel="stylesheet" />
        <script type="text/javascript" src="<%=ct%>/scripts/jquery.easing.1.3.js"></script>
        <script src="<%=ct%>/scripts/slides.min.jquery.js"></script>
        <link rel="stylesheet" href="<%=ct%>/css/cssForSlideNewsPage.css">
        <link rel="stylesheet" href="<%=ct%>/css/style.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="<%=ct%>/css/fx.slide.css" type="text/css" media="screen" />
        <link href="<%=ct%>/css/stylesFeed.css" rel="stylesheet" type="text/css" />
        <script language="javascript" type="text/javascript" src="<%=ct%>/scripts/jquery.jfeed.js"></script>
        <script language="javascript" type="text/javascript" src="<%=ct%>/scripts/jquery.aRSSFeed.js"></script>
        <link rel="stylesheet" href="<%=ct%>/css/demo_table.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="<%=ct%>/css/demo_page.css" type="text/css" media="screen" />
        <script type="text/javascript" src="<%=ct%>/scripts/jquery.dataTables.js"></script>
<!--        <script type="text/javascript" src="<%=ct%>/scripts/live.js"></script>-->
 <script src="<%=ct%>/scripts/modernizr-transitions.js"></script>
        <script src="<%=ct%>/scripts/jquery.masonry.min.js"></script>
        <script>
           
            
            $(document).ready( function() {
                $('div.RSSAggrCont').aRSSFeed();
                
                var now = new Date();
                var hour        = now.getHours();
                var minute      = now.getMinutes();
                var second      = now.getSeconds();
                var monthnumber = now.getMonth()+1;
                var monthday    = now.getDate();
                var year        = now.getFullYear();
            
       
            } );
            
        </script>
        <sql:query var="result" dataSource="db">
            SELECT * from newstype
        </sql:query>
            <sql:query var="lecturer" dataSource="db">
            SELECT * from lecturer where id = ${id}
        </sql:query>
    </head>
    <body>
        <div>
            <jsp:include page="loginPane.jsp"/>
        </div>
        <c:choose>
            <c:when test="${username != null}">
                <c:choose>
                    <c:when test="${param.v == 999}">
                        <c:redirect url="updateProfile.jsp"/>
                    </c:when>
                    <c:otherwise>
                    </c:otherwise>
                </c:choose>

                <div class="logo-header" ><a href="main.jsp"> <img src="<%=ct%>/images/ids_logo.png" width="150" height="150" alt="IDS System"></img></a></div>
                <div class="header">
                    <div></div><br>
                    <div class="header-user">
<!--                        <center>Welcome, ${username}</center>-->
                    </div>
                </div>

                <div class="navBar" style="margin-top: 20px;">
                    <div id="accordion">


                        <h3><a href="">ข่าวสาร</a></h3>
                        <div>
                            <ul><c:forEach var="item" items="${result.rows}">
                                    <li><a href="main.jsp?v=1&pri=${item.id}">${item.name}</a></li>
                                </c:forEach>

                            </ul>
                        </div>

                        <h3><a href="#">ประกาศข่าวสาร</a></h3>
                        <div>
                            <ul>
                                <li><a href="main.jsp?v=7#">ประกาศข่าวสาร</a></li>
                            </ul>
                        </div>
                        <h3><a href="##">ข้อมูลส่วนตัว</a></h3>
                        <div>
                            <ul>
                                <li><a href="main.jsp?v=21##">ข้อมูลของฉัน</a></li>
                            </ul>

                        </div>
                         <h3><a href="##">ตรวจสอบสถานะอาจารย์</a></h3>
                            <div>
                                <ul>

                                    <li><a href="main.jsp?v=91##">รายชื่ออาจารย์ที่มาคณะวันนี้</a></li>
                                    
                                </ul>

                            </div>

                        <!--                        <h3><a href="#">ค้นหา</a></h3>
                                                <div>
                                                    <ul>
                                                        <li>ค้นหาอย่างละเอียด</li>
                                                    </ul>
                                                </div>-->

                    </div>


                </div>
                <div class="container">

                    <div  id="checkIn" style="font-size: 20px;margin-top: -50px;">
                        <c:forEach var="lecturerrow" items="${lecturer.rows}">
                      
                        <c:choose>
                            <c:when test="${lecturerrow.status != 'ไม่ระบุ'}">
                                <form action="<%=ct%>/DoCheckOutServlet" name="doCheckOut" >
                                    สถานะของคุณ : <label style="color: blue;">${lecturerrow.status}</label> | <input type="button" onClick="var ans = confirm('สถานะของคุณจะไม่เป็นที่มองเห็นอีกต่อไป ยินยอม ?');if(ans){document.forms['doCheckOut'].submit();}" name="checkout" value="Check-Out!"/>
                                    <input type="hidden" name="username" value="${userid}"/>
                                </form>
                            </c:when>
                            <c:otherwise>
                                สถานะของคุณ : <label style="color: crimson;">ไม่ระบุ</label> | 
                                <a href="main.jsp?v=0" ><input type="button" name="checkin" value="Check-In Now!"/></a>
                                </c:otherwise>
                            </c:choose>
  </c:forEach>
                    </div>



                    <c:choose>
                        <c:when test="${param.v == 1}">
                           <div class="container">
                                <jsp:include page="feedTable.jsp"/>
                            </div>
                        </c:when>
                        <c:when test="${param.v == 2}">
                           <div class="container">
                                <jsp:include page="feedTable.jsp"/>
                            </div>
                        </c:when>
                        <c:when test="${param.v == 3}">
                            <div class="container">
                                <jsp:include page="feedTable.jsp"/>
                            </div>
                        </c:when>
                        <c:when test="${param.v == 22}">
                            <div class="container">
                                <jsp:include page="newsPage1.jsp"/>
                            </div>
                        </c:when>

                        <c:when test="${param.v == 7}">
                            <jsp:include page="sendNews.jsp"/>
                        </c:when>
                        <c:when test="${param.v == 0}">
                            <jsp:include page="checkinout.jsp"/>
                        </c:when>
                        <c:when test="">
                        </c:when>
                        <c:when test="${param.v == 21}">
                            <div>
                                <jsp:include page="lecturerViewProfile.jsp"/>
                            </div>
                        </c:when>
                         <c:when test="${param.v == 'rm'}">
                            <div class="container">
                                <jsp:include page="readmoreNews.jsp"/>
                            </div>
                        </c:when>
                        <c:when test="${param.v == 91}">
                            <div class="container">
                                <jsp:include page="lecturerList.jsp"/>
                            </div>
                        </c:when>
                        <c:when test="">
                        </c:when>
                        <c:otherwise>

                             <div class="container">
                                <jsp:include page="feedTable.jsp"/>
                            </div>



                            <div id="show-news" >

                            </div>



                        </c:otherwise>
                    </c:choose>
                </div>
            </c:when>
            <c:otherwise>
                <jsp:forward page="login.jsp"/>
            </c:otherwise>
        </c:choose>
        <script type="text/javascript">
            function doLogout(){
                        
                    
                var ans = confirm("ต้องการออกจากระบบ ?");
     
                if(ans == true){
                    window.location.href ='../logout.jsp';
                }else{
                    window.location='main.jsp';      
                }
            }
                
            function doCheckOut(){
                //alert("ggg");
                var ans = confirm("ต้องการ Check Out ออกจากระบบรุบะตัวตน ?");
     
                if(ans == true){
                    document.forms['doCheckOut'].submit();
                }else{
                    window.location='main.jsp';      
                }
            }
            
        </script>
        <div id="footer">
            <jsp:include page="../footer.jsp"/>
        </div>
        <script type="text/javascript">
             var now = new Date();
                var hour        = now.getHours();
                var minute      = now.getMinutes();
                var second      = now.getSeconds();
                var monthnumber = now.getMonth()+1;
                var monthday    = now.getDate();
                var year        = now.getFullYear();
               
            window.setInterval("checkTime()",1000);
            
            function checkTime(){
                 var now2 = new Date();
                 if(now2.getHours() == 23 && now2.getMinutes() == 59 &&now2.getSeconds() == 59){
                   $.ajax({
                                                url: '../DoCheckOutServlet',
                                                type: 'POST',
                                                data: '',
                                                success: function(result){
                                                        
                                                        //alert("Success: "+result);
                                                        window.location.reload();
                                                }
                                         });
                 }
                 
            }
         
        </script>
    </body>
</html>