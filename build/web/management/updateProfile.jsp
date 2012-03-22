<%-- 
    Document   : studentUpdateProfile
    Created on : Sep 5, 2011, 11:05:50 PM
    Author     : IT KMITL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String ct = this.getServletContext().getContextPath(); %>
<!DOCTYPE html>
<html>
    <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IDS | แก้ไขข้อมูลส่วนตัวของเจ้าหน้าที่</title>
        <link href="<%=ct%>/css/cssForUpdateProfilePage.css" rel="stylesheet" type="text/css">
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
			
			<div class="content">
				<div id="form_wrapper" class="form_wrapper">					
                                    <form class="login active" action="<%=ct%>/updateStaffProfileServlet" method="GET">
                                        <center><h3>ข้อมูลส่วนตัว</h3></center>
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
							<label>ส่วนงาน</label>
                                                        <select name="department" >
                                                            <option value="sa">หน่วยกิจการนักศึกษา</option>
                                                            <option value="reg">หน่วยทะเบียนและประมวลผล</option>
                                                            <option value="grad">หน่วยบัณฑิตศึกษา</option>
                                                        </select>
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
