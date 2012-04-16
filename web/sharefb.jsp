<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : sharefb
    Created on : Mar 26, 2012, 11:53:48 PM
    Author     : bankiiee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <div id="fb-root">
     <label id="contentfb">${param.topic}<br>${param.story}</label>
 </div>
      <script>
          var content = document.getElementById("contentfb").textContent;
          //alert(content);
        window.fbAsyncInit = function() {
          FB.init({
            appId      : '225348954190713',
            status     : true, 
            cookie     : true,
            xfbml      : true,
            oauth      : true
          });

          FB.ui({ method: 'feed', 
              message: content});
        };

        (function(d){
           var js, id = 'facebook-jssdk'; if (d.getElementById(id)) {return;}
           js = d.createElement('script'); js.id = id; js.async = true;
           js.src = "//connect.facebook.net/en_US/all.js";
           d.getElementsByTagName('head')[0].appendChild(js);
         }(document));
      </script>
