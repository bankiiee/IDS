<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<% String ct = this.getServletContext().getContextPath();%>
<%-- 
    Document   : manageFeed
    Created on : Jan 14, 2012, 12:02:38 AM
    Author     : Servlets
--%>
<link href="<%=ct%>/css/fileuploader.css" rel="stylesheet" type="text/css">	
<link href="<%=ct%>/css/style.css" rel="stylesheet" type="text/css">	

<sql:query var="row" dataSource="db">
    SELECT * FROM usergroup;
</sql:query>
<sql:query var="row2" dataSource="db">
    SELECT * FROM newstype;
</sql:query>
<sql:query var="row3" dataSource="db">
    SELECT * FROM media;
</sql:query>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE html>

<div class="addFeed" style="font-size: 16px;">
    <h1>ส่งข่าวสารเข้าสู่ระบบ</h1>
    <h3>* กรุณากรอกข้อมูลตามความเป็นจริงและถูกต้อง *</h3>
<form name="addFeed" action="<%=ct%>/addNewsServlet" method="GET">
    <fieldset>
        <table>
            <tr>
                <td style="width:40%;">หัวข้อข่าว</td>
                <td><input type="text" name="headline" value="" size="50%" placeholder="หัวข้อข่าวที่ต้องการประกาศ" autofocus="autofocus" /></td>

            </tr>
            <tr>
                <td style="width:40%;">รายละเอียด</td>
                <td><textarea name="story" rows="7" cols="50%" spellcheck="checked" placeholder="รายละเอียดของข่าว"></textarea></td>

            </tr>
            <tr>
                <td style="width:40%;">วันที่เริ่มประกาศ</td>
                <td><input type="date" name="fromdate" value="2012-01-17" size="50%" placeholder="yyyy-mm-dd"  /></td>

            </tr>
            <tr>
                <td style="width:40%;">วันที่สิ้นสุดการประกาศ</td>
                <td><input type="date" name="todate" value="2012-01-20" size="50%" placeholder="yyyy-mm-dd"  /></td>

            </tr>
            <tr>
                <td style="width:40%;">กลุ่มผู้รับข่าวสาร</td>
                <td><select name="forusergroupid">
                        <c:forEach var="item" items="${row.rows}">
                            <option value="${item.id}">${item.name}</option>
                        </c:forEach>
                    </select>
                </td>

            </tr>
            <tr>
                <td style="width:40%;">ประเภทของข่าว</td>
                <td><select name="newstypeid">
                        <c:forEach var="item" items="${row2.rows}">
                            <option value="${item.id}">${item.name}</option>
                        </c:forEach>
                    </select>
                </td>

            </tr>
            <tr>
                <td style="width:40%;">รับข่าวสารมาจากสื่อใด</td>
                <td><select name="mediaid">
                        <c:forEach var="item" items="${row3.rows}">
                            <option value="${item.id}">${item.name}</option>
                        </c:forEach>
                    </select>
                </td>

            </tr>
<!--            <tr >
                <td>Attachments</td>
                <td>
                    
                    <div id="file-uploader-demo1" style="visibility: hidden">	
                        
                    </div>
               </td>

            </tr>-->
<!--            <tr>
                <td>News Status</td>
                <td>-->
                    <input type="hidden" name="status" value="inactive"/>
<!--                </td>
            </tr>-->
            <tr>
                <td style="width:40%;">หมายเหตุ</td>
                <td><textarea name="remark" rows="7" cols="50%" spellcheck="checked" placeholder="รายละเอียดเพิ่มเติม"></textarea></td>

            </tr>
        </table>
        <input type="button" onClick="doSubmit();" value="ส่งข่าวสารเดี๋ยวนี้" />
    </fieldset>
</form>
</div>
<script src="scripts/fileuploadChecker.js" type="text/javascript"></script>

<script src="scripts/fileuploader.js" type="text/javascript"></script>
<script>
    function createUploader(){            
        var uploader = new qq.FileUploader({
            element: document.getElementById('file-uploader-demo1'),
            action: '../OctetStreamReader',
            debug: true
        });           
    }
        
    // in your app create uploader as soon as the DOM is ready
    // don't wait for the window to load  
    window.onload = createUploader;     
    
    function doSubmit(){
        var ans = confirm("ท่านได้ตรวจสอบข้อมูลเรียบร้อยแล้ว ?");
        if(ans){
            document.forms["addFeed"].submit();
        }
    }
</script>  