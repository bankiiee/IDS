<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to IDS Application</title>
        <link href="css/cssForIndexPage.css" rel="stylesheet" type="text/css">
        <script src="scripts/scriptForIndex.js" type="text/javascript"></script>
        <script src="scripts/cufon-yui.js" type="text/javascript"></script>
        <script src="scripts/ChunkFive_400.font.js" type="text/javascript"></script>
        <script type="text/javascript" src="scripts/jquery-1.6.2.js"></script>
        <script type="text/javascript">
			Cufon.replace('h1',{ textShadow: '1px 1px #fff'});
			//Cufon.replace('h2',{ textShadow: '1px 1px #fff'});
			//Cufon.replace('h3',{ textShadow: '1px 1px #000'});
			Cufon.replace('.back');
	</script>

    </head>
    <div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_GB/all.js#xfbml=1&appId=225348954190713";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

    <body>
        
        
        <div class="container"> 
            <div class="header">
                <a href="#" >Feedback</a>
                <div class="header" id="header-label">Welcome to IDS Application</div>
                                    <div class="fb-like" data-send="true" data-width="450" data-show-faces="true" data-font="segoe ui"></div>

                                    
                                   

                                    
                <!-- end .header -->
            </div>
            <div class="content">
                <div class="wrapper">
                    <center><h1>Welcome to IDS Application</h1></center>
                    <h2>
                        <center>
                            <label ><a href="about.jsp">About Us</a></label> &nbsp; &nbsp;&nbsp;&nbsp;                 
                    <label><a href="login.jsp">Login</a></label>
                        </center>
                    </h2>
                    <div class="fromSlideShow">
                    <jsp:include page="_slideShowPage.jsp"/>
                    </div>
                </div>
                <!-- end .content --></div>
            <div class="footer">
                <center>
                    <p><a href="http://www.it.kmitl.ac.th"><h2>คณะเทคโนโลยีสารสนเทศ<br>
                    สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง</a></h2></p>
                </center>
            </div>
        </div>
    </body>
</html>