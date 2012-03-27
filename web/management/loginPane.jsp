<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<div id="container">
    <div id="top">
        <!-- login -->
        <ul class="login">
            <li class="left">&nbsp;</li>
            <li>ยินดีต้อนรับ <b>คุณ${username}</b></li>
            <li>|</li>
            <li>สถานะของคุณคือ <b>
                    <c:choose>
                        <c:when test="${department == 'sa'}">
                            ฝ่ายกิจการนักศึกษา
                        </c:when>
                        <c:when test="${department == 'reg'}">
                            ฝ่ายทะเบียนและประมวลผล
                        </c:when>
                        <c:when test="${department == 'grad'}">
                            ฝ่ายทะเบียนและประมวลผล
                        </c:when>
                        <c:when test="${isAdmin == true}">
                            Root Admin
                        </c:when>
                        <c:otherwise>
                        </c:otherwise>
                    </c:choose>


                </b></li>
            <li>|</li>
            <li><a id="toggleLogin" >
                    <img src="images/loginpane/button_login.jpg" width="45" height="20" alt="button_login" onclick="doLogout()" style="margin-top: 9px"/>
                </a></li>
        </ul> <!-- / login -->
    </div> <!-- / top -->

    <div class="clearfix"></div>

</div>

