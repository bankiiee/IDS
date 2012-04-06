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
        <title>IDS | Student | ${firstname}</title>
        <link href="css/cssForMainPage.css" rel="stylesheet" type="text/css">
        <link href="css/custom-theme/jquery-ui-1.8.18.custom.css" rel="stylesheet" type="text/css">
        <script src="scripts/cufon-yui.js" type="text/javascript"></script>
        <script src="scripts/ChunkFive_400.font.js" type="text/javascript"></script>
        <script type="text/javascript" src="scripts/jquery-1.6.2.js"></script>
        <script type="text/javascript" src="scripts/jquery.cycle.all.js"></script>
        <script type="text/javascript" src="scripts/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="scripts/jquery-ui-1.8.18.custom.min.js"></script>
        <script type="text/javascript" src="scripts/scriptForMainPage.js"></script>
        <link type="text/css" href="css/menu.css" rel="stylesheet" />
         <script type="text/javascript" src="scripts/jquery.easing.1.3.js"></script>
        <script src="scripts/slides.min.jquery.js"></script>
        <link rel="stylesheet" href="css/cssForSlideNewsPage.css"/>
        <link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="css/fx.slide.css" type="text/css" media="screen" />

        <link href="css/stylesFeed.css" rel="stylesheet" type="text/css" />

        <script language="javascript" type="text/javascript" src="scripts/jquery.jfeed.js"></script>
        <script language="javascript" type="text/javascript" src="scripts/jquery.aRSSFeed.js"></script>
        <link rel="stylesheet" href="css/demo_table.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="css/demo_page.css" type="text/css" media="screen" />
        <script type="text/javascript" src="scripts/jquery.dataTables.js"></script>
        <!--         <script type="text/javascript" src="scripts/live.js"></script>-->
 <script src="scripts/modernizr-transitions.js"></script>
        <script src="scripts/jquery.masonry.min.js"></script>

        <script>
            $(function(){
                $('#slides-slideNews').slides({
                    preload: true,
                    preloadImage: 'images/slideNews_MainPage/loading.gif',
                    play: 5000,
                    pause: 2500,
                    hoverPause: true
                });
            });
            
            $(document).ready( function() {
                $('div.RSSAggrCont').aRSSFeed();
                
       
            } );
            window.setInterval('showTime()',200);
            function showTime(){
                var now = new Date();
                var hour        = now.getHours();
                var minute      = now.getMinutes();
                var second      = now.getSeconds();
                var mil = now.getMilliseconds();
                var monthnumber = now.getMonth()+1;
                var monthday    = now.getDate();
                var year        = now.getFullYear();
            
            if(second%2==0){
                          document.getElementById("datetime").innerHTML = "Today is "+monthday+"/"+monthnumber+"/"+year+", and It's now "+hour+":"+minute+":"+second;
            }else{
                                document.getElementById("datetime").innerHTML = "Today is "+monthday+"/"+monthnumber+"/"+year+", and It's now "+hour+" "+minute+" "+second;
            }
            }
            
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
                    <c:when test="${param.refresh == 'true'}">
                        <script>
                            alert("ข่าวสารได้ส่งเข้าสู่ระบบเรียบร้อยแล้ว");
                        </script>
                    </c:when>
                    <c:otherwise>
                    </c:otherwise>
                </c:choose>

                <div class="logo-header">
                    <a href="main.jsp"> <img src="images/ids_logo.png" width="150" height="150" alt="IDS System"></img></a><br>
                </div>
                                         <div id="datetime">
                  </div>
                <div class="header">
                    <div></div><br>
                    <div class="header-user">
                       
<!--                        <center>Welcome, ${username}</center>-->

                    </div>
                </div>

                <div class="navBar">
                    <div id="accordion">
                        <h3><a href="#">ข่าวสาร</a></h3>
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
                        <!--                        <h3><a href="##">กล่องข้อความ</a></h3>
                                                <div>
                                                    <ul>
                                                        <li>กล่องข้อความเข้า</li>
                                                        <li>ส่งข้อความ</li>
                        
                                                    </ul>
                                                </div>-->
                        <h3><a href="###">ส่งข่าวสาร</a></h3>
                        <div>
                            <ul>
                                <li><a href="main.jsp?v=5">ส่งข่าวสารสู่ระบบ</a></li>
                            </ul>
                        </div>

                        <h3><a href="######">ตรวจสอบอาจารย์</a></h3>
                        <div>
                            <ul>
                                <li><a href="main.jsp?v=60">รายชื่ออาจารย์ที่เข้ามาคณะวันนี้</a></li>
                            </ul>
                        </div>

                        <h3><a href="####">ข้อมูลส่วนตัว</a></h3>
                        <div>
                            <ul>
                                <li><a href="main.jsp?v=40&mode=view">ข้อมูลส่วนตัว</a></li>
                            </ul>

                        </div>




                        <!--                        <h3><a href="########">ติดต่อเจ้าหน้าที่</a></h3>
                                                <div>
                                                    <ul>
                                                        <li>ประกาศข่าว</li>
                                                        <li>ส่งข้อความส่วนตัว</li>
                        
                                                    </ul>
                                                </div>-->
                    </div>

                </div>
                <div class="container">
                    <div id="search-bar">
                        <!--                        <right>ค้นหาข่าว : <input type="text" name="keyword" placeholder="กรุณาระบุคำเพื่อค้นหา"/>
                                                    <input type="button" value="ค้นหาทันที"/>
                                                </right>-->
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
                        <c:when test="${param.v == 30}">

                            <div>
                                <jsp:include page="newsPage1.jsp"/>
                            </div>
                        </c:when>
                        <c:when test="">
                        </c:when>
                        <c:when test="${param.v == 5}">
                            <div>
                                <jsp:include page="sendNews.jsp"/>
                            </div>
                        </c:when>
                        <c:when test="${param.v == 40 and param.mode == 'view'}">
                            <div>
                                <jsp:include page="studentViewProfile.jsp?mode=view"/>
                            </div>
                        </c:when>
                        <c:when test="${param.v == 60}">
                            <div>
                                <jsp:include page="lecturerList.jsp"/>
                            </div>
                        </c:when>
                        <c:when test="${param.v == 'rm'}">
                            <div class="container">
                                <jsp:include page="readmoreNews.jsp"/>
                            </div>
                        </c:when>
                        <c:when test="${param.pupdate == 'success'}">
                            <script type="text/javascript">
                                alert("ข้อมูลปรับปรุงเรียบร้อยแล้ว");
                                window.location.href = 'main.jsp?v=40&mode=view';
                            </script>
                        </c:when>
                        <c:otherwise>
                          

                            <%--<jsp:include page="newsInbox.jsp"></jsp:include> --%>

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
                    window.location.href ='logout.jsp';
                }else{
                    window.location='main.jsp';      
                }
            }
        </script>


    </body>
</html>