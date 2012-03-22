
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
            <li>สถานะของคุณคือ <b>ผู้ติดต่อภายนอก</b></li>
            <li>|</li>
            <li><a id="toggleLogin" >
                    <img src="images/loginpane/button_login.jpg" width="45" height="20" alt="button_login" onclick="doLogout()" style="margin-top: 9px"/>
                </a></li>
        </ul> <!-- / login -->
    </div> <!-- / top -->

    <div class="clearfix"></div>

</div>

