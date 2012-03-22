<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

        <title>Home | ${username}</title>
    </head>
    <body>
        <c:choose>
            <c:when test="${username != null}">
                <!-- Home page screen -->
                <div data-role="page" data-add-back-btn="true" data-theme="e" id="home">
                    <div data-role="header">
                        <a href="./logoutDialog.jsp" data-icon="back"  data-rel="dialog" class="ui-btn-left">Logout</a>
                        <a href="" data-icon="gear" data-transition="pop" class="ui-btn-right">Setting</a>
                        <h1 id="homename">Home | ${username}</h1>
                    </div>

                    <div data-role="content">

                        <!-- The following menu is for Tablet OS only (ignored by Smartphone) -->
                        <button>News</button>
                        <button>Academic News</button>

                    </div>
                </c:when>
                <c:otherwise>

                </c:otherwise>
            </c:choose>








        </div>



    </body>

</html>