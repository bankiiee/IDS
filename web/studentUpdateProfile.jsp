<%-- 
    Document   : studentUpdateProfile
    Created on : Sep 5, 2011, 11:05:50 PM
    Author     : IT KMITL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IDS | แก้ไขข้อมูลส่วนตัวของนักศึกษา</title>
        <link href="css/cssForUpdateProfilePage.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="scripts/jquery-1.6.2.js"></script>
        <script src="scripts/cufon-yui.js" type="text/javascript"></script>
	<script src="scripts/ChunkFive_400.font.js" type="text/javascript"></script>
<!--	<script type="text/javascript">
                    Cufon.replace('h1',{ textShadow: '1px 1px #fff'});
			Cufon.replace('h2',{ textShadow: '1px 1px #fff'});
			Cufon.replace('h3',{ textShadow: '1px 1px #000'});
			Cufon.replace('.back');
	</script>-->


    </head>
    <body>
       
    <div class="wrapper">
			<h1>แก้ไขข้อมูลส่วนตัว</h1>
			<h2>กรุณากรอกข้อมูลตามความเป็นจริง เพื่อการแจ่งข่าวสารได้อย่างถูกต้องและฉับไว</h2>
			<div class="content">
				<div id="form_wrapper" class="form_wrapper">					
                                    <form class="login active" action="updateStudentProfileServlet" method="GET">
                                        <center><h3>ข้อมูลของฉัน</h3></center>
						<div>
							<label>ชื่อ:</label>
                                                        <input type="text" name="fname" placeholder="" value="${firstname}"/>
							<span class="error">This is an error</span>
						</div>
						<div>
							<label>นามสกุล: </label>
                                                        <input type="text" name="lname" placeholder="" value="${lastname}"/>
							<span class="error">This is an error</span>
						</div>
                                                <div>
							<label>อีเมลล์:</label>
                                                        <input type="text" name="email" placeholder=""/>
							<span class="error">This is an error</span>
						</div>
						<div>
							<label>เบอร์โทรศัพท์มือถือ: </label>
                                                         <input type="text" name="telno" placeholder=""/>
							<span class="error">This is an error</span>
						</div>
                                                <div>
							<label>ชั้นปีปัจจุบัน:</label>
                                                        <select name="currentyear">
                                                            <option value="0">โปรดระบุ</option>
                                                            <option value="1">ชั้นปีที่ 1</option>
                                                            <option value="2">ชั้นปีที่ 2</option>
                                                            <option value="3">ชั้นปีที่ 3</option>
                                                            <option value="4">ชั้นปีที่ 4</option>
                                                        </select>
							<span class="error">This is an error</span>
						</div>
						<div>
							<label>Facebook: </label>
                                                        <input type="text" name="facebook" placeholder="http://www.facebook.com/userProfileName"/>
							<span class="error">This is an error</span>
						</div>
                                                <div>
							<label>Twitter: </label>
                                                         <input type="text" name="twitter" placeholder="@yourTwitterAccount"/>
							<span class="error">This is an error</span>
						</div>
						<div class="bottom">
<!--							<div class="remember"><input type="checkbox" /><span>ข้อมูลถูกต้อง</span></div>-->
							<input type="submit" value="บันทึกข้อมูล"></input>
							<div class="clear"></div>
						</div>
					</form>
					
				</div>
				<div class="clear"></div>
			</div>
		</div>
    </body>
</html>
