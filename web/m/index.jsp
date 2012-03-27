<%-- 
    Document   : index
    Created on : Sep 19, 2011, 8:10:58 PM
    Author     : IT KMITL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String ctx = this.getServletContext().getContextPath();

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,user-scalable=no,initial-scale=1.0">

        <link rel="stylesheet" href="css/jquery.mobile-1.0a4.1.min.css" />
        <script src="js/jquery-1.5.2.min.js"></script>
        <script src="js/jquery.mobile-1.0a4.1.min.js"></script>

        <link rel="stylesheet" type="text/css" href="css/styles.css"/>
        <script type="text/javascript" src="js/scripts.js"></script>

        <title>Welcome To IDS</title>
    </head>
    <body>

        <!-- Home page screen -->
        <div data-role="page" data-add-back-btn="true" data-theme="b" id="home">
            <div data-role="header">
                <a href="#sharegps" data-icon="info" data-transition="pop" class="ui-btn-left">About Us</a>
                <a href="#login" data-icon="grid" data-transition="pop" class="ui-btn-right">Login</a>
                <h1 id="homename">Welcome To IDS</h1>
            </div>

            <div data-role="content">

                <!-- The following menu is for Tablet OS only (ignored by Smartphone) -->
                <div id="tabletOSmenuBar">
                    <ul id="menuBarLinks">
                        <li onclick="openMaps()"> Open Maps </li>
                    </ul>
                    <ul id="menuBarButton">
                        <li onclick="hideMenuBar()"> Close Menu</li>
                    </ul>
                </div>

                <div id="currentGPS">
                    Retrieving GPS ...
                </div>
                <div>
                    <button id="btnUpdateGPS" onclick="refreshGPS()">Refresh GPS</button>
                </div>

            </div>

        </div>

        <!-- "Share GPS" page screen -->
        <div data-role="page" data-add-back-btn="true" data-theme="a" id="sharegps">
            <div data-role="header">
                <h1>Share GPS</h1>
                <a href="index.jsp#" data-icon="home" data-transition="flip" class="ui-btn-right">Home</a>
            </div>

            <div data-role="content">	
                Submit your location:
                <button id="btnShareGPS" onclick="shareGPSInfo()">Send</button>
            </div>

        </div>


        <div data-role="page" data-add-back-btn="true" data-theme="e" id="login">
            <div data-role="header">
                <h1>Login</h1>
                <a href="index.jsp#" data-icon="home" data-transition="flip" class="ui-btn-right">Home</a>
            </div>

            <form action="<%=ctx%>/LoginServlet" method="post" data-ajax="false" >
            <div data-role="content">	
                Sign in with your student account:
                <div data-role="fieldcontain">
                    <label for="name">ID:</label>
                    <input type="text" name="username" id="name" value="" placeholder="itxxxxxxx" />
                    <label for="name">Password:</label>
                    <input type="password" name="password" id="password" value=""  />
                    <label for="role" class="select">Role:</label>
                    <select name="role" id="role" data-native-menu="false">
                        <option value="student">Student</option>
                        <option value="lecturer">Lecturer</option>
                        <option value="staff">Staff</option>
                        <option value="external">External Source</option>
                    </select>
                </div>	
                <input type="hidden" name="mobile" value="yes"/>
                <input type="submit" value="Log Me In" />
            </div>
            </form>

        </div>
<!-- after login           -->
            
<div data-role="page" data-add-back-btn="true" data-theme="e" id="home">
            <div data-role="header">
                <a href="#logout-dialog" data-icon="" data-transition="pop"   class="ui-btn-left">Logout</a>
                <a href="" data-icon="gear" data-transition="pop" class="ui-btn-right">Setting</a>
                <h1 id="homename">Home | ${username}</h1>
            </div>

            <div data-role="content">

                <!-- The following menu is for Tablet OS only (ignored by Smartphone) -->
                <div id="tabletOSmenuBar">
                    <ul id="menuBarLinks">
                        <li onclick="openMaps()"> Open Maps </li>
                    </ul>
                    <ul id="menuBarButton">
                        <li onclick="hideMenuBar()"> Close Menu</li>
                    </ul>
                </div>

                <div id="currentGPS">
                    Retrieving GPS ...
                </div>
                <div>
                    <button id="btnUpdateGPS" onclick="refreshGPS()">Refresh GPS</button>
                </div>
                
            </div>


            
            

    </body>

</html>