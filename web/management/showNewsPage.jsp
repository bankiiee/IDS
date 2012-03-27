<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<% String ct = this.getServletContext().getContextPath();%>
<%-- 
    Document   : showNewsPage
    Created on : Jan 19, 2012, 11:18:09 PM
    Author     : bankiiee
--%>
<!DOCTYPE html>
<html>
    <head>    
        <link href="/IDS/css/pepper-grinder/jquery-ui-1.8.18.custom.css" rel="stylesheet" type="text/css">
        <script src="/IDS/scripts/cufon-yui.js" type="text/javascript"></script>
        <script src="/IDS/scripts/ChunkFive_400.font.js" type="text/javascript"></script>
        <script type="text/javascript" src="<%=ct%>/scripts/jquery-1.6.2.js"></script>
        <script type="text/javascript" src="<%=ct%>/scripts/jquery.cycle.all.js"></script>
        <script type="text/javascript" src="<%=ct%>/scripts/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="<%=ct%>/scripts/jquery-ui-1.8.18.custom.min.js"></script>
        <script type="text/javascript" src="/IDS/scripts/scriptForMainPage.js"></script>
        <link type="text/css" href="/IDS/css/menu.css" rel="stylesheet" />
        <script type="text/javascript" src="/IDS/scripts/jquery.easing.1.3.js"></script>
        <script src="/IDS/scripts/slides.min.jquery.js"></script>
        <link rel="stylesheet" href="/IDS/css/cssForSlideNewsPage.css">
        <link rel="stylesheet" href="/IDS/css/style.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="/IDS/css/fx.slide.css" type="text/css" media="screen" />
        <link href="/IDS/css/stylesFeed.css" rel="stylesheet" type="text/css" />
        <script language="javascript" type="text/javascript" src="/IDS/scripts/jquery.jfeed.js"></script>
        <script language="javascript" type="text/javascript" src="/IDS/scripts/jquery.aRSSFeed.js"></script>
        <link rel="stylesheet" href="/IDS/css/demo_table.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="/IDS/css/demo_page.css" type="text/css" media="screen" />
        <script type="text/javascript" src="/IDS/scripts/jquery.dataTables.js"></script>        
        <script src="<%=ct%>/scripts/fileuploadChecker.js" type="text/javascript"></script>
        <script src="<%=ct%>/scripts/fileuploader.js" type="text/javascript"></script>
        <link href="<%=ct%>/css/fileuploader.css" rel="stylesheet" type="text/css">	
        <link href="<%=ct%>/css/style.css" rel="stylesheet" type="text/css">	
        <link href="<%=ct%>/css/cssForSendNews.css" rel="stylesheet" type="text/css"/>

        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <link href="<%=ct%>/css/cssForMainPage.css" rel="stylesheet" type="text/css"></link>
    </head>
    <body onload="init();">
        <div>


            <sql:query var="item" dataSource="db">
                SELECT * from news where id = ${param.newsid}
            </sql:query>
            <sql:query var="rowusergroup" dataSource="db">
                SELECT * FROM usergroup;
            </sql:query>
            <sql:query var="rowtype" dataSource="db">
                SELECT * FROM newstype;
            </sql:query>
            <sql:query var="rowmedia" dataSource="db">
                SELECT * FROM media;
            </sql:query>
            <sql:query var="rowedunews" dataSource="db">
                SELECT * FROM edunews;
            </sql:query>
            <sql:query var="rowpriority" dataSource="db">
                SELECT * FROM priority;
            </sql:query>

            <script>
                window.returnValue = 0
                // in your app create uploader as soon as the DOM is ready
                // don't wait for the window to load  
                window.onload = createUploader;     
                function init(){
                
                }
                
                $(document).ready( function() {
                    $('div.RSSAggrCont').aRSSFeed();

                    var now = new Date();
                    var hour        = now.getHours();
                    var minute      = now.getMinutes();
                    var second      = now.getSeconds();
                    var monthnumber = now.getMonth()+1;
                    var monthday    = now.getDate();
                    var year        = now.getFullYear();

                    //document.getElementById("datetime").innerHTML = "Today is "+monthday+"/"+monthnumber+"/"+year+", and It's now "+hour+":"+minute+":"+second;

                } );
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
                    }else{
                        edu2.style.visibility = 'hidden';
                    }
                }

                function createUploader(){            
                    var uploader = new qq.FileUploader({
                        element: document.getElementById('file-uploader-demo1'),
                        action: '../OctetStreamReader',
                        debug: true
                    });           
                }
        
    
                function doSubmit(){
                    var ans = confirm("ท่านได้ตรวจสอบข้อมูลเรียบร้อยแล้ว ?");
                    if(ans){
                        //document.forms["addFeed"].submit();
                        document.addFeed.story.value = document.getElementById('txtstory').value;
                        document.addFeed.topic.value = document.getElementById('txttopic').value;
                        document.addFeed.forusergroupid.value = document.getElementById('cmbforusergroupid').value;
                        document.addFeed.newstypeid.value = document.getElementById('edu').value;
                        document.addFeed.mediaid.value = document.getElementById('cmbmediaid').value;
                        document.addFeed.remark.value = document.getElementById('txtremark').value;
                        document.addFeed.priorityid.value = document.getElementById('cmbpriorityid').value;
                        document.addFeed.publisher.value = document.getElementById('txtpublisher').value;
                        document.addFeed.fromdate.value = document.getElementById('datepicker').value;
                        document.addFeed.todate.value = document.getElementById('datepicker2').value;
                        document.addFeed.attchpath.value = document.getElementById('txtattchpath').value;
                        //alert('story='+document.addFeed.story.value);
                        //alert('topic='+document.addFeed.topic.value);
                        //alert('forusergroupid='+document.addFeed.forusergroupid.value);
                        //alert('newstypeid='+document.addFeed.newstypeid.value);
                        //alert('mediaid='+document.addFeed.mediaid.value);
                        //alert('remark='+document.addFeed.remark.value);
                        //alert('priorityid='+document.addFeed.priorityid.value);
                        document.addFeed.submit();
                        window.returnValue = 1;
                    }
                }
        
                function openChild(){
                    var retval=window.showModalDialog("addAttachmentPage.jsp");
                    //document.getElementById('filename').value;
                    window.returnValue = retval;
                    document.getElementById("txtattchpath").value= window.returnValue;
                }
          
            </script>

            <form name="addFeed" class="login active" action="/IDS/updateNewsServlet" method="POST">
                <div class="form_wrapper" id="form_wrapper">

                    <input type="hidden" name="id" value="${param.newsid}">
                    <input type="hidden" name ="topic" value="">
                    <input type="hidden" name ="story" value="">
                    <input type="hidden" name ="forusergroupid" value="">
                    <input type="hidden" name ="newstypeid" value="">
                    <input type="hidden" name ="remark" value="">
                    <input type="hidden" name ="mediaid" value="">
                    <input type="hidden" name ="priorityid" value="">
                    <input type="hidden" name ="publisher" value="">
                    <input type="hidden" name ="fromdate" value="">
                    <input type="hidden" name ="todate" value="">
                    <input type="hidden" name ="attchpath" value="">


                    <h1>แก้ไขข่าวสาร</h1>
                    <h3>* กรุณากรอกข้อมูลตามความเป็นจริงและถูกต้อง *</h3>


                    <c:forEach var="row" items="${item.rows}">
                        <table >
                            <tr>
                                <td style="width:30%;">Topic</td>
                                <td><input type="text" id="txttopic"  value="${row.topic}" autofocus="autofocus" /></td>
                            </tr>
                            <tr>
                                <td style="width:30%;">Story</td>
                                <td><textarea id="txtstory"  rows="7" cols="50%" value="">${row.story}</textarea></td>
                            </tr>
                            <tr>
                                <td style="width:30%;">ผู้ประกาศข่าว</td>
                                <td><input type="text" id="txtpublisher"  value="${row.publisher}" /></td>
                            </tr>
                            <tr>
                                <td style="width:40%;">วันที่เริ่มประกาศ</td>
                                <td><input type="text" value="${row.fromdate}" size="50%" placeholder="yyyy-mm-dd"  id="datepicker"/></td>

                            </tr>
                            <tr>
                                <td style="width:40%;">วันที่สิ้นสุดการประกาศ</td>
                                <td><input type="text" value="${row.todate}" size="50%" placeholder="yyyy-mm-dd"  id="datepicker2"/></td>

                            </tr>
                            <tr>
                                <td style="width:40%;">กลุ่มผู้รับข่าวสาร</td>
                                <td><select  id="cmbforusergroupid">
                                        <c:forEach var="item" items="${rowusergroup.rows}">
                                            <option value="${item.id}">${item.name}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:40%;">ประเภทของข่าว</td>
                                <td><select onchange="eduSubTypeSelect()" id="edu">
                                        <option >----โปรดระบุ----</option>
                                        <c:forEach var="item" items="${rowtype.rows}">
                                            <option value="${item.id}">${item.name}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr  id="edu2" style="visibility: hidden;">
                                <td style="width:40%;">ประเภทของข่าวการเรียนการสอน</td>
                                <td><select id="cmbedunewstypeid" >
                                        <c:forEach var="item" items="${rowedunews.rows}">
                                            <option value="${item.id}">${item.name}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>

                            <tr>
                                <td style="width:40%;">รับข่าวสารมาจากสื่อใด</td>
                                <td><select id="cmbmediaid">
                                        <c:forEach var="item" items="${rowmedia.rows}">
                                            <option value="${item.id}">${item.name}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>

                                <td style="width:40%;">ความสำคัญ</td>
                                <td><select id="cmbpriorityid">
                                        <c:forEach var="item" items="${rowpriority.rows}">
                                            <option value="${item.id}">${item.name}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                             <tr >
                                <td>Attachments</td>
                                <td>
                                     <input type="text" id="txtattchpath" value="${row.attchpath}"  onClick="openChild()" placeholder="Attach a file with no whitespace"/>	                                  
                                </td>
                             </tr>
                            <tr>
                                <td style="width:40%;">หมายเหตุ</td>
                                <td><textarea id="txtremark" rows="7" cols="50%" spellcheck="checked">${row.remark}</textarea></td>

                            </tr>
                        </table>
                        <div class="">
                            <input type="button" onClick="doSubmit();" value="SAVE" />
                        </div>
                    </c:forEach>
                </div>
            </form>

        </div>
    </body>
</html>

