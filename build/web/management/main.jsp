<% String ct = this.getServletContext().getContextPath();%>
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
        <title>IDS | Admin | ${firstname}</title>
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

        <script src="<%=ct%>/scripts/jquery.tweet.js"></script>
        <link rel="stylesheet" href="<%=ct%>/css/jquery.tweet.css" type="text/css" media="screen" />


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
            
                //document.getElementById("datetime").innerHTML = "Today is "+monthday+"/"+monthnumber+"/"+year+", and It's now "+hour+":"+minute+":"+second;
       
       
                $(".tweet").tweet({
                    username: "rcksht",
                    join_text: "-",
                    avatar_size: 32,
                    count: 3,
                    auto_join_text_default: "we said,",
                    auto_join_text_ed: "we",
                    auto_join_text_ing: "we were",
                    auto_join_text_reply: "we replied to",
                    auto_join_text_url: "we were checking out",
                    loading_text: "loading tweets..."
                });
            } );
            
        </script>
        <sql:query var="result" dataSource="db">
            SELECT * from newstype
        </sql:query>


    </head>
    <body><div>
            <jsp:include page="loginPane.jsp"/>
        </div>
        <c:choose>
            <c:when test="${username != null}">
                <c:choose>
                    <c:when test="${param.v == 999}">
                        <jsp:include page="pageForDialog.jsp"/>
                    </c:when>
                    <c:otherwise>
                    </c:otherwise>
                </c:choose>

                <div class="logo-header">
                    <a href="main.jsp"> <img src="<%=ct%>/images/ids_logo.png" width="150" height="150" alt="IDS System"></img></a><br>
                </div>
                <div id="datetime">
                </div>
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
                                <!--                                <li><a href="main.jsp?v=1&pri=1">ข่าวการเรียนการสอน</a></li>
                                                                <li><a href="main.jsp?v=1&pri=2">ข่าวรับสมัครงาน ฝึกงาน แนะแนว</a></li>
                                                                <li><a href="main.jsp?v=1&pri=3">ข่าวทุนการศึกษา</a></li>
                                                                <li><a href="main.jsp?v=1&pri=4">ข่าวประชาสัมพันธ์</a></li>
                                                                <li><a href="main.jsp?v=1&pri=0">ข่าวในหมวดอื่นๆ</a></li>-->
                            </ul>
                        </div>
                        <h3><a href="#">จัดการข่าวสาร</a></h3>
                        <div>
                            <ul>
                                <li><a href="main.jsp?v=5#">ประกาศข่าวสาร</a></li>
                                <li><a href="main.jsp?v=6#">จัดการข่าวสารขาเข้า</a></li>
                                <li><a href="main.jsp?v=8#">จัดการข่าวสารขาออก</a></li>
                                 <li><a href="main.jsp?v=9#">ลบข่าวสาร</a></li>
                                <li><a href="../GenXMLServlet?page=main.jsp&v=6">Generate XML Feed</a></li>
                                <li><a href="main.jsp?v=7#">จัดการประเภทข่าวสาร กลุ่มผู้รับสาร และช่องทางการได้มาของข่าวสาร</a></li>
                            </ul>
                        </div>
                        <c:if test="${isAdmin == true}">

                            <h3><a href="##">จัดการผู้ใช้</a></h3>
                            <div>
                                <ul>

                                    <li><a href="main.jsp?v=80##">ค้นหาและแก้ไขบัญชีผู้ใช้</a></li>
                                    <li><a href="main.jsp?v=81##">สร้างบัญชีผู้จัดการระบบ</a></li>
                                    <li><a href="main.jsp?v=82##">แก้ไขบัญชีผู้จัดการระบบ</a></li>
                                </ul>

                            </div>
                            <!--                        <h3><a href="">จัดการแบบประเมิน</a></h3>
                                                    <div>
                                                        <ul>
                                                            <li><a href="">สร้างแบบประเมิน</a></li>
                                                            <li><a href="">แก้ไขแบบประเมิน</a></li>
                                                            <li><a href="">สรุปผลแบบประเมิน</a></li>
                                                            <li><a href="">ค้นหาแบบประเมิน</a></li>
                            
                                                        </ul>
                                                    </div>-->
                            <!--                        <h3><a href="#">จัดการรายงานและเอกสาร</a></h3>
                                                    <div>
                                                        <ul>
                                                            <li><a href="">สร้างรายงาน</a></li>
                                                            <li><a href="">แก้ไขรายงาน</a></li>
                                                            <li><a href="">ค้นหารายงาน</a></li>
                                                            <li><a href="">ส่งออกรายงาน</a></li>
                                                        </ul>
                                                    </div>-->


                        </c:if>

                    </div>
                    <br>
                    <div class="tweet" style="margin-top: 10px;"></div>
                </div>
                <div class="">
                    <div id="search-bar">

                    </div>
                    <!--                    จำนวนข่าวที่รับชมต่อหน้า<select name="feedperview">
                                                                    <option selected="selected">5</option>
                                                                    <option>10</option>
                                                                    <option>15</option>
                                                                    <option>20</option>
                                                                </select>-->


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
                        <c:when test="${param.v == 80}">
                            <span class="container">
                                <jsp:include page="manageUser.jsp"/>
                            </span>
                        </c:when>
                        <c:when test="${param.v == 81}">
                            <span class="container">
                                <jsp:include page="createAdmin.jsp"/>
                            </span>
                        </c:when>
                        <c:when test="${param.insert == 'true'}">
                            <script type='text/javascript'>alert('ข้อมูลปรับปรุงเรียบร้อยแล้ว');
                                window.location.href = 'main.jsp?v=82##';
                            </script>
                        </c:when>
                        <c:when test="${param.v == 110}">
                            <span class="container">
                                <jsp:include page="userUpdateProfile.jsp"/>
                            </span>
                        </c:when>
                        <c:when test="${param.v == 111}">
                            <span class="container">
                                <jsp:include page="adminEditProfile.jsp"/>
                            </span>
                        </c:when>
                        <c:when test="${param.v == 82}">
                            <span class="container">
                                <jsp:include page="adminUpdateProfile.jsp"/>
                            </span>
                        </c:when>
                        <c:when test="${param.v == 5}">
                            <div class="container">
                                <jsp:include page="manageFeed.jsp"/>
                            </div>
                        </c:when>
                        <c:when test="${param.v == 6}">
                            <div class="container">
                                <jsp:include page="manageNewsInbox.jsp"/>
                            </div>
                        </c:when>
                        <c:when test="${param.v == 7}">
                            <div class="container">
                                <jsp:include page="manageNewsType.jsp"/>
                            </div>
                        </c:when>
                        <c:when test="${param.v == 8}">
                            <div class="container">
                                <jsp:include page="manageNewsOutBox.jsp"/>
                            </div>
                        </c:when>
                             <c:when test="${param.v == 9}">
                            <div class="container">
                                <jsp:include page="deleteNews.jsp"/>
                            </div>
                        </c:when>
                        <c:when test="${param.v == 98}">
                            <div class="container">
                                <a href="../GenXMLServlet?page=main.jsp&v=6"></a>
                            </div>
                        </c:when>
                        <c:when test="${param.v == 'rm'}">
                            <div class="container">
                                <jsp:include page="readmoreNews.jsp"/>
                            </div>
                        </c:when>
                        <c:otherwise>

                            <div class="container">
                                <jsp:include page="feedTable.jsp"/>
                            </div>
                            <%--<jsp:include page="newsInbox.jsp"></jsp:include> --%>

                            <!--                            <div class="RSSAggrCont" rssnum="10" rss_url="../idsfeed.xml">
                                                            <div class="loading_rss">
                                                                <img alt="Loading..." src="images/loading.gif" />
                                                            </div>
                                                        </div>-->



                            <div id="show-news" >

                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </c:when>
            <c:otherwise>
                <c:redirect url="../login.jsp"/>
            </c:otherwise>
        </c:choose>
        <div id="footer">
            <%--  <jsp:include page="../footer.jsp"/> --%>
        </div>

        <script type="text/javascript">
            function doLogout(){
                        
                    
                var ans = confirm("ต้องการออกจากระบบ ?");
     
                if(ans == true){
                    window.location.href ='../logout.jsp';
                }else{
                    window.location='main.jsp';      
                }
            }
        </script>
    </body>
</html>