<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 
    Document   : studentUpdateProfile
    Created on : Sep 5, 2011, 11:05:50 PM
    Author     : IT KMITL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String ct = this.getServletContext().getContextPath();%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="<%=ct%>/css/cssForStudentViewProfilePage.css" rel="stylesheet" type="text/css">
<sql:query var="result" dataSource="db">
    SELECT* FROM lecturer where username like '${userid}'
</sql:query>

<div class="wrapper">
    <c:forEach var="item" items="${result.rows}">

        <div class="content">
            <div id="form_wrapper" class="form_wrapper">					
                <form class="login active" name ="updateForm" action="<%=ct%>/lecturerUpdateProfileServlet" method="GET">
                    <center><h3>ข้อมูลส่วนตัว <br>
                            <input type="radio" name="mode" id="modeview" value="view" onchange ="checkmode('view')" checked="checked"/>ดูข้อมูล
                            <input type="radio" name="mode" id="modeedit" value="edit" onchange ="checkmode('edit')"/>แก้ไขข้อมูล
                        </h3></center>
                    <div>
                        <table border="0">
                            <font style="color: RED;">(*)</font> เป็นข้อมูลที่จำเป็นที่ต้องกรอก
                            <tbody>
                                <tr>
                                    <td><label>ชื่อ: <font style="color: RED">(*)</font></label>
                                        <input type="text" name="fname" id="fname" placeholder="" value="${firstname}" disabled="true" autofocus="autofocus"/></td>
                                    <td><label>นามสกุล: <font style="color: RED">(*)</font></label>
                                        <input type="text" name="lname" placeholder="" value="${lastname}" disabled="true"/></td>
                                </tr>
                                <tr>
                                    <td><label>หมายเลขห้องพักอาจารย์: <font style="color: RED">(*)</font></label>
                                        <input type="text" name="room" placeholder="" disabled="true" value="${item.room}"/>
                                    </td>
                                </tr>
                                <tr><td>

                                    </td><td></td></tr>
                            </tbody>
                        </table>


                    </div>
                    <div class="bottom">
                        <!--							<div class="remember"><input type="checkbox" /><span>ข้อมูลถูกต้อง</span></div>-->
                        <input type="button" value="บันทึกข้อมูล"  name="savebutton" onclick="doSubmit()" disabled="true"></input>
                        <div class="clear"></div>
                    </div>
                </form>

            </div>
            <div class="clear"></div>
        </div>
    </div>
</c:forEach>
<script type="text/javascript">
    function checkmode(selectedmode){
        var mode = selectedmode;
        // alert(mode);
        if(mode=='view'){
            document.forms["updateForm"].fname.disabled=true; 
            
            document.forms["updateForm"].lname.disabled=true; 
            document.forms["updateForm"].room.disabled=true; 
            document.forms["updateForm"].telno.disabled=true; 
            document.forms["updateForm"].currentyear.disabled=true; 
            document.forms["updateForm"].facebook.disabled=true; 
            document.forms["updateForm"].twitter.disabled=true; 
            document.forms["updateForm"].savebutton.disabled=true;
            
            
            

              
        }else{
            var ans = confirm('กรุณากรอกข้อมูลด้วยความถูกต้องและเป็นจริงเพื่อประโยชน์ในการรับข่าวสารของท่าน');
            if(ans != false){
                document.forms["updateForm"].fname.disabled=false; 
                document.forms["updateForm"].lname.disabled=false; 
                document.forms["updateForm"].room.disabled=false; 
                document.forms["updateForm"].savebutton.disabled=false;


            }else{
                document.getElementById("modeview").checked='checked';
            }
              
        }
       
    }
    function doSubmit(){
        var ans = confirm('ข้อมูลดังกล่าวถูกต้องและทำการตรวจสอบแล้ว ?');
        if(ans == true){
            document.forms["updateForm"].submit();
        }
    }
</script>
