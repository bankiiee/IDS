<%-- 
    Document   : addAttachmentPage
    Created on : Mar 23, 2012, 6:26:40 PM
    Author     : bankiiee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String ct = this.getServletContext().getContextPath();%>
<!DOCTYPE html>
<link href="<%=ct%>/css/fileuploader.css" rel="stylesheet" type="text/css">	
<link href="<%=ct%>/css/style.css" rel="stylesheet" type="text/css">
<script src="<%=ct%>/scripts/fileuploadChecker.js" type="text/javascript"></script>
<script src="<%=ct%>/scripts/fileuploader.js" type="text/javascript"></script>



<div>
    <form class="">
    <div id="file-uploader-demo1" style="">	
        
        <br>
    </form>
        </div>
        <input type="button" onClick="done()" value="Done, and Close this popup"/>
        <input type="text" value="" id="filename" style="visibility: hidden"/>
        <script>
            function createUploader(){            
                var uploader = new qq.FileUploader({
                    element: document.getElementById('file-uploader-demo1'),
                    action: '<%=ct%>/OctetStreamReader',
                    debug: true,
                    onComplete: function(file, response) {
                        document.getElementById("filename").value = 'attachments/'+response;
                       var path = escape(response);
                        window.returnValue ='attachments/'+path;
                        window.close();
                    }
                });       
                
            }
        
            // in your app create uploader as soon as the DOM is ready
            // don't wait for the window to load  
            window.onload = createUploader;   
            
            function done(){
                
                var returnname = document.getElementById("filename").value;
//                alert(returnname);
                //window.returnValue="Value changed.." 
                window.returnValue = returnname;
              //  alert(55555+document.re);
                window.close() 
            }
        </script>

