<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 
    Document   : userUpdateProfile.jsp
    Created on : Sep 5, 2011, 11:05:50 PM
    Author     : IT KMITL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="css/cssForStudentViewProfilePage.css" rel="stylesheet" type="text/css">
<sql:query var="result" dataSource="db">
    SELECT* FROM user where id = '${param.id}'
</sql:query>

<div class="wrapper">
    <c:forEach var="item" items="${result.rows}">

        <div class="content">
            <div id="form_wrapper" class="form_wrapper">					
                <form class="login active" name ="updateForm" action="/IDS/adminUpdateStudentProfileServlet" method="GET">
                   
                    <center><h3>ข้อมูลของฉัน <br>
                            <input type="radio" name="mode" id="modeview" value="view" onchange ="checkmode('view')" checked="checked"/>ดูข้อมูล
                            <input type="radio" name="mode" id="modeedit" value="edit" onchange ="checkmode('edit')"/>แก้ไขข้อมูล
                        </h3></center>
                    <div>
                         <input type="hidden" name="id" value="${param.id}"></input>
                        <table border="0">
                            <font style="color: RED;">(*)</font> เป็นข้อมูลที่จำเป็นที่ต้องกรอก
                            <tbody>
                                <tr>
                                    <td><label>ชื่อ: <font style="color: RED">(*)</font></label>
                                        <input type="text" name="fname" id="fname" placeholder="" value="${item.fname}" disabled="true" autofocus="autofocus"/></td>
                                    <td><label>นามสกุล: <font style="color: RED">(*)</font></label>
                                        <input type="text" name="lname" placeholder="" value="${item.lname}" disabled="true"/></td>
                                </tr>
                                <tr>
                                    <td><label>อีเมลล์: <font style="color: RED">(*)</font></label>
                                        <input type="text" name="email" placeholder="" disabled="true" value="${item.email}"/>
                                    </td>
                                    <td><label>เบอร์โทรศัพท์มือถือ: <font style="color: RED">(*)</font></label>
                                        <input type="text" name="telno" placeholder="" disabled="true" value="${item.telno}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td><label>ชั้นปีปัจจุบัน(เก่า): </label>
                                        <input type="text" name="showstatus" placeholder="" disabled="true" value="ชั้นปีที่ ${item.status}"/>

                                    </td>
                                    <td><label id="textcurrentyear">ชั้นปีปัจจุบัน: <font style="color: RED">(*)</font></label><select name="currentyear" disabled="true" id="currentyear">
                                            <option value="0">โปรดระบุ</option>
                                            <option value="1">ชั้นปีที่ 1</option>
                                            <option value="2">ชั้นปีที่ 2</option>
                                            <option value="3">ชั้นปีที่ 3</option>
                                            <option value="4">ชั้นปีที่ 4</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><label>Facebook: </label>
                                        <input type="text" name="facebook" placeholder="http://www.facebook.com/userProfileName" disabled="true" value="${item.fbacc}"/></td>
                                    <td><label>Twitter: </label>
                                        <input type="text" name="twitter" placeholder="@yourTwitterAccount" disabled="true" value="${item.twitacc}"/></td>
                                </tr>
                                <tr><td></td><td></td></tr>
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
            document.forms["updateForm"].email.disabled=true; 
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
                document.forms["updateForm"].email.disabled=false; 
                document.forms["updateForm"].telno.disabled=false; 
                document.forms["updateForm"].currentyear.disabled=false; 
                document.forms["updateForm"].facebook.disabled=false; 
                document.forms["updateForm"].twitter.disabled=false; 
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
