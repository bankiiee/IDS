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
    <center>
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
                SELECT * FROM inputmedia;
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
                        
                        document.addFeed.topic.value = document.getElementById('txttopic').value;
                       
                        document.addFeed.remark.value = document.getElementById('txtremark').value;
                      
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
                    document.getElementById("attachment").value= window.returnValue;
                }
          
            </script>

            <form class="login active" action="/IDS/toLCDServlet" method="POST">
                <div class="form_wrapper" id="form_wrapper">

                    <input type="hidden" name="id" value="${param.newsid}">
                    <!--                    <input type="hidden" name ="remark" value="">-->


                    <h1>ส่งข้อมูลข่าวสารสู่จอ LCD</h1>
<!--                    <h3>* กรุณากรอกข้อมูลตามความเป็นจริงและถูกต้อง *</h3>-->


                    <c:forEach var="row" items="${item.rows}">
                        <table >
                            <tr>
                                <td style="width:30%;">Topic</td>
                                <td><input type="text" name="topic"  value="${row.topic}" disable="true"/></td>
                            </tr>


                            <tr>
                                <td style="width:40%;">LCD Confirmation</td>
                                <td><select name="remark"  autofocus="autofocus" >
                                        <option value="LCD">LCD</option>
                                        <option value="cancel">Cancel</option>
                                    </select></td>

                            </tr>

                            <td>Attachments</td>
                            <td>
                                <label style="color:crimson">*ชื่อไฟล์ต้องไม่มีช่องว่าง*</label>
                                <sql:query var="pic" dataSource="db">
                                    select * from picture where newsid = ${row.id}
                                </sql:query>
                                <c:forEach var="picrow" items="${pic.rows}">
                                     <input type="text" name="attachment" value="${picrow.path}" id="attachment" onClick="openChild()" placeholder="Click to open upload window"/>	

                                </c:forEach>
                            </td>
                        </table>
                        <div class="">
                            <center><input type="submit"value="SEND" /></center>
                        </div>
                    </c:forEach>
                </div>
            </form>

        </div>
    </center>
    </body>
</html>
