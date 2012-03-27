<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : createGuestAccount
    Created on : Oct 4, 2011, 9:19:33 PM
    Author     : ITKMITL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>สร้างบัญชีผู้ติดต่อภายนอก</title>
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
                
            </div>
    <c:choose>
        <c:when test="${param.error != null}">
            <script type="text/javascript">
			alert("กรุณากรอกข้อมูลให้ถูกต้องอีกครั้งครับ");
                        window.location="createGuestAccount.jsp";
            </script>
        </c:when>
        <c:otherwise>
            <div class="wrapper">
			<h1>Guest User Registration</h1>
			<h2>กรุณาสร้างบัญชีสำหรับผู้ติดต่อภายนอก เพื่อเข้าใช้งานระบบ</h2>
			<div class="content">
				<div id="form_wrapper" class="form_wrapper">					
                                    <form class="login active" action="createGuestAccountServlet" method="post">
						<h3>สร้างบัญชีผู้ติดต่อภายนอก</h3>
						<div>
							<label>Username:</label>
                                                        <input type="text" name="username" placeholder="username"/>
							
						
							<label>Password: </label>
                                                        <input type="password" name="password" />
							
                                                        
                                                        <label>กรุณาระบุ Password อีกครั้ง: </label>
                                                        <input type="password" name="password2" />
							
						
                                                    <label>Email: </label>
                                                    <input type="text" name="email" />
                                                    
                                                        
						
                                                    <label>เบอร์โทรติดต่อ: </label>
                                                    <input type="text" name="telno" />
                                                    
                                                        
						</div>
                                                
						<div class="bottom">
							
							<input type="submit" value="สร้างบัญชีเดี๋ยวนี้" onclick="createGuestAccount()"></input>
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
</html>
