<%-- 
    Document   : logoutDialog
    Created on : Dec 19, 2011, 9:49:41 PM
    Author     : Bankiiee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- 
    Document   : index
    Created on : Sep 19, 2011, 8:10:58 PM
    Author     : IT KMITL
--%>


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

        <title></title>
    </head>
    <body>

        <!-- Home page screen -->




        <div data-role="page" data-add-back-btn="true" data-theme="e" id="logout-dialog">
            <div data-role="header">
                <h1>Logout</h1>
                <a href="#home" data-icon="home" data-transition="slide" class="ui-btn-right">Back</a>
            </div>

            <div data-role="content">	
                <div id="logout">
                    <div data-role="fieldcontain">
                        <label for="question">Are you sure to <b>Logout</b> from the system? </label>
                        <button onClick="doLogout()">Yes</button>
                        <button onClick="$('.ui-dialog').dialog('close')">No</button>                     </div>
                </div>
            </div>
        </div>


    </div>



</body>

</html>