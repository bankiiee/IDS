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
<link href="<%=ct%>/css/cssForSendNews.css" rel="stylesheet" type="text/css">

<sql:query var="row" dataSource="db">
    SELECT * FROM usergroup;
</sql:query>
<sql:query var="row2" dataSource="db">
    SELECT * FROM newstype;
</sql:query>
<sql:query var="row3" dataSource="db">
    SELECT * FROM media;
</sql:query>
<sql:query var="row4" dataSource="db">
    SELECT * FROM edunews;
</sql:query>
    <sql:query var="row5" dataSource="db">
    SELECT * FROM priority;
</sql:query>
    
<%@page contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE html>
<script type="text/javascript">
    $(function() {
        $( "#datepicker" ).datepicker({ dateFormat: 'yy-mm-dd' });
        $( "#datepicker2" ).datepicker({ dateFormat: 'yy-mm-dd' });
        edu2 =  document.getElementById("edu2");

        edu2.style.visibility = 'hidden';
    });
   
    
    function eduSubTypeSelect(){
        var edutype = document.getElementById("edu").value;
        //        var edusubtype = document.getElementById("edusubtype");
        alert(edutype);
        if(edutype == 1){
            edu2.style.visibility = 'visible';
        }
    }
</script>
<div class="form_wrapper" id="form_wrapper" style="font-size: 16px; margin-top: 50px;">
    <h1>ส่งข่าวสารเข้าสู่ระบบ</h1>
    <h3>* กรุณากรอกข้อมูลตามความเป็นจริงและถูกต้อง *</h3>
    <form name="addFeed" action="<%=ct%>/addNewsServlet" method="GET" class="login active">
        <fieldset>
            <table>
                <tr>
                    <td style="width:40%;">หัวข้อข่าว</td>
                    <td><input type="text" name="headline" value="" size="50%" placeholder="หัวข้อข่าวที่ต้องการประกาศ" autofocus="autofocus" /></td>

                </tr>
                <tr>
                    <td style="width:40%;">รายละเอียด</td>
                    <td><textarea name="story" rows="7" cols="50%" spellcheck="checked" placeholder="รายละเอียดของข่าว" ></textarea></td>

                </tr>
                <tr>
                    <td style="width:40%;">วันที่เริ่มประกาศ</td>
                    <td><input type="text" name="fromdate" value="2012-01-17" size="50%" placeholder="yyyy-mm-dd"  id="datepicker"/></td>

                </tr>
                <tr>
                    <td style="width:40%;">วันที่สิ้นสุดการประกาศ</td>
                    <td><input type="text" name="todate" value="2012-01-20" size="50%" placeholder="yyyy-mm-dd"  id="datepicker2"/></td>

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
                    <td><select name="newstypeid" onchange="eduSubTypeSelect()" id="edu">
                            <option >----โปรดระบุ----</option>
                            <c:forEach var="item" items="${row2.rows}">
                                <option value="${item.id}">${item.name}</option>
                            </c:forEach>
                        </select>
                    </td>

                </tr>

                <tr  id="edu2">
                    <td style="width:40%;">ประเภทของข่าวการเรียนการสอน</td>
                    <td><select name="edunewstypeid">
                            <c:forEach var="item" items="${row4.rows}">
                                <option value="${item.id}">${item.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr >
                <tr>
                    <td style="width:40%;">รับข่าวสารมาจากสื่อใด</td>
                    <td><select name="mediaid">
                            <c:forEach var="item" items="${row3.rows}">
                                <option value="${item.id}">${item.name}</option>
                            </c:forEach>
                        </select>
                    </td>

                </tr>
                
                <tr>
                    <td style="width:40%;">ความสำคัญ</td>
                    <td><select name="priority">
                            <c:forEach var="item" items="${row5.rows}">
                                <option value="${item.id}">${item.name}</option>
                            </c:forEach>
                        </select>
                    </td>

                </tr>
                            <tr >
                                <td>Attachments</td>
                                <td>
                                    
                                    <input type="text" name="attachment" value="" id="attachment" onClick="openChild()" placeholder="Click to open upload window"/>	
                                        
                                    </div>
                               </td>
                
<!--                            </tr>
                            <tr>
                                <td>News Status</td>
                                <td>-->
                <input type="hidden" name="status" value="inactive"/>
                 <input type="hidden" name="attachment" value="0"/>
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
    
    function openChild(){
         var retval=window.showModalDialog("addAttachmentPage.jsp");
//document.getElementById('filename').value;
    window.returnValue = retval;
document.getElementById("attachment").value= window.returnValue;
    }
</script>  