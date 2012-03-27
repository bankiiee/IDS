<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 
    Document   : login
    Created on : Aug 23, 2011, 10:46:17 PM
    Author     : bankiiee
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Access Control</title>
        <link href="css/cssForLoginPage.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="scripts/jquery-1.6.2.js"></script>
        <script src="scripts/cufon-yui.js" type="text/javascript"></script>
        <script src="scripts/ChunkFive_400.font.js" type="text/javascript"></script>
        <script type="text/javascript">
            Cufon.replace('h1',{ textShadow: '1px 1px #fff'});
            //Cufon.replace('h2',{ textShadow: '1px 1px #fff'});
            //Cufon.replace('h3',{ textShadow: '1px 1px #000'});
            Cufon.replace('.back');
        </script>

    </head>
    <body>
         <div class="header">
            <a href="welcome.jsp" >กลับสู่หน้าหลัก</a>
<!--            <a href="adminLogin.jsp" style="alignment-adjust: right;" >Admin Login</a>-->
            </div>
        <c:choose>
            <c:when test="${param.error == 1}">
                <script type="text/javascript">
                    alert("Invalid Username and Password");
                    window.location="login.jsp";
                </script>
            </c:when>
            <c:when test="${param.error == 2}">
                <script type="text/javascript">
                    alert("กรุณาตรวจสอบข้อมูลใหม่อีกครั้ง");
                    window.location="login.jsp";
                </script>
            </c:when>
            <c:otherwise>

                <div class="wrapper">
                    <h1>IDS Applicaton System</h1>
                    <h2>กรุณา Login เพื่อทำการเข้าใช้ระบบครับ                <a href="adminLogin.jsp" class="adminButton">Admin Login</a>       
</h2>
                    <div class="content">
                        <div id="form_wrapper" class="form_wrapper">					
                            <form class="login active" action="LoginServlet" method="POST">
                                <h3>Login</h3>
                                <div>
                                    <label>Username:</label>
                                    <input type="text" name="username" placeholder="itxxxxxxxx"/>
                                </div>
                                <div>
                                    <label>Password: </label>
                                    <input type="password" name="password" />
                                </div>
<!--                                <div style="visibility: hidden;">
                                    <label>Role: </label>
                                    <select name="_role">
                                        <option value="undefined">โปรดระบุ</option>
                                        <option value="">-----------</option>
                                        <option value="student">นักศึกษา</option>
                                        <option value="lecturer">อาจารย์</option>
                                        <option value="external">ผู้ติดต่อภายนอก</option>
                                        <option value="staff">ผู้ดูแลระบบ</option>
                                    </select>

                                </div>-->
<!--                                <div><label>สำหรับผู้ติดต่อภายนอก กรุณากด <a href="createGuestAccount.jsp" style="font-size: 16px;color:crimson">ที่นี่</a> เพื่อสร้างบัญชีเข้าใช้ใช้งานระบบ</label>
                                </div>-->
                                <div class="bottom">
                                    
                                    <input type="submit" value="Login"></input>

                                    <div class="clear"></div>
                                </div>
                            </form>

                        </div>
                        <div class="clear"></div>
                    </div>
                </div>

            </c:otherwise>
        </c:choose>

    </body>
    <style type="text/css">
.adminButton {
	-moz-box-shadow:inset 0px 1px 0px 0px #fceaca;
	-webkit-box-shadow:inset 0px 1px 0px 0px #fceaca;
	box-shadow:inset 0px 1px 0px 0px #fceaca;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ffce79), color-stop(1, #eeaf41) );
	background:-moz-linear-gradient( center top, #ffce79 5%, #eeaf41 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffce79', endColorstr='#eeaf41');
	background-color:#ffce79;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #eeb44f;
	display:inline-block;
	color:#ffffff;
	font-family:arial;
	font-size:12px;
	font-weight:bold;
	padding:4px 12px;
	text-decoration:none;
	text-shadow:1px 1px 0px #ce8e28;
}.adminButton:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #eeaf41), color-stop(1, #ffce79) );
	background:-moz-linear-gradient( center top, #eeaf41 5%, #ffce79 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#eeaf41', endColorstr='#ffce79');
	background-color:#eeaf41;
}.adminButton:active {
	position:relative;
	top:1px;
}
/* This imageless css button was generated by CSSButtonGenerator.com */
</style>
</html>
