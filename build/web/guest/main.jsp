<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <title>IDS | Main page</title>
        <link href="css/cssForMainPage.css" rel="stylesheet" type="text/css">
        <link href="css/blitzer/jquery-ui-1.8.16.custom.css" rel="stylesheet" type="text/css">
        <script src="scripts/cufon-yui.js" type="text/javascript"></script>
        <script src="scripts/ChunkFive_400.font.js" type="text/javascript"></script>
        <script type="text/javascript" src="scripts/jquery-1.6.2.js"></script>
        <script type="text/javascript" src="scripts/jquery.cycle.all.js"></script>
        <script type="text/javascript" src="scripts/jquery-1.6.2.min.js"></script>
        <script type="text/javascript" src="scripts/jquery-ui-1.8.16.custom.min.js"></script>
        <script type="text/javascript" src="scripts/scriptForMainPage.js"></script>
        <link type="text/css" href="css/menu.css" rel="stylesheet" />
        <script src="http://gsgd.co.uk/sandbox/jquery/easing/jquery.easing.1.3.js"></script>
        <script src="scripts/slides.min.jquery.js"></script>
        <link rel="stylesheet" href="css/cssForSlideNewsPage.css">
        <link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="css/fx.slide.css" type="text/css" media="screen" />

    </head>
    <body>
        <div>
          <jsp:include page="loginPane.jsp"/>
        </div>
        <c:choose>
            <c:when test="${username != null}">
                <c:choose>
                    <c:when test="${param.v == 999}">
                        <jsp:include page="pageForDialog.jsp"/>
                    </c:when>
                    <c:when test="${param.status == 'success'}">
                        <script type="text/javascript">
                            alert("ระบบสร้างบัญชีของคุณเรียบร้อยแล้ว \nกำลังเข้าสู้หน้าสำหรับผู้ติดต่อภายนอก");
                            </script>
                    </c:when>
                    <c:otherwise>
                    </c:otherwise>
                </c:choose>

                <div class="logo-header"><a href="main.jsp"> <img src="images/ids_logo.png" width="80" height="100" alt="IDS System"></img></a></div>
                <div class="header">
                    <div></div><br>
                    <div class="header-user">
<!--                        <center>Welcome, ${username}</center>-->
                    </div>
                </div>
                    
                <div class="navBar">
                    <div id="accordion">
                        
                        <h3><a href="">ข่าวสาร</a></h3>
                        <div>
                            <ul>
                                <li><a href="main.jsp">ข่าวด่วน</a></li>
                                <li><a href="main.jsp">ข่าวประชาสัมพันธ์</a></li>
                                

                            </ul>
                        </div>
                        <h3><a href="#">ส่งข่าว</a></h3>
                        <div>
                            <ul>
                               
                                <li><a href="main.jsp?v=2">ส่งข่าวสารให้เจ้าหน้าที่</a></li>
                            </ul>

                        </div>
                        
                    </div>


                </div>
                <div class="container">

                            <div id="search-bar">
                                <right>ค้นหาข่าว : <input type="text" name="keyword" placeholder="กรุณาระบุคำเพื่อค้นหา"/>
                                    <input type="button" value="ค้นหาทันที"/>
                                </right>
                            </div>

                 

                <c:choose>
                    <c:when test="${param.v == 1}">
                        <div class="container">
                            <jsp:include page="newsPage1.jsp"/>
                        </div>
                    </c:when>
                    <c:when test="${param.v==2}">
                        <div class="container">
                            <jsp:include page="sendNews.jsp"/>
                        </div>
                    </c:when>
                    <c:when test="">
                    </c:when>
                    <c:when test="">
                    </c:when>
                    <c:when test="">
                    </c:when>
                    <c:when test="">
                    </c:when>
                    <c:otherwise>
                     <div>
                                <div class="newsHeader"><center><h1 style="color: crimson"><b>ข่าวด่วนหน้า 1</b></h1></center></div>
                                
                                <div class="newsDetail">
                                    <fieldset>
                                        <h2><b>เชิญบุคลากรคณะ และนักศึกษาทำบุญประจำปี คณะไอที</b></h2>
                                        <p>ในวันที่ 12 ตุลาคม 2554 มีการจัดพิธีทำบุญประจำปีขึ้นที่คณะไอที ขอเชิญบุคลากรและนักศึกษา หรือผู้ศรัทธา พร้อมเพรียงกันที่โถง ในเวลา<br>
                                        8.30 น. โดยมีพระสงฆ์จำนวน 20 รูป มาประกอบพิธีดังกล่าว</p>
                                        <p><b>ประกาศโดย:</b> ฝ่ายกิจการนักศึกษา <b>วันที่ประกาศ:</b> 1/10/2554 <b>หมวดหมู่:</b> ทั่วไป <b>ระดับ:</b> ทั่วไป</p>
                                    </fieldset>
                                </div>
                                <br>
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
</script>
    </body>
</html>