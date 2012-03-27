<%-- 
    Document   : sendNews
    Created on : Oct 4, 2011, 11:52:24 PM
    Author     : ITKMITL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link href="css/cssForLoginPage.css" rel="stylesheet" type="text/css">

   <div class="content">
                        <div id="form_wrapper" class="form_wrapper">					
                            <form class="login active" action="TempLoginServlet" method="post">
                                <h3>ส่งข่าวสารสู่ระบบ</h3>
                                <div>
                                    <label>หัวข้อข่าว:</label>
                                    <input type="text" name="topic" placeholder="หัวข้อข่าว"/>
                                </div>
                                <div>
                                    <label>เนื้อความข่าว: </label>
                                    <textarea name="story" cols="50" rows="10" placeholder="รายละเอียดข่าว">

                                    </textarea>
                                </div>
                                <div>
                                    <label>ประเภทของข่าว: </label>
                                    <select name="catagory">
                                    <option value="" >ข่าวการรับสมัครงาน</option>
                                    <option value="" >ข่าวสำหรับการรับนักศึกษาฝึกงาน</option>
                                    <option value="" >ข่าวประกาศแข่งขัน</option>
                                    <option value="" >ข่าวทุนการศึกษา</option>
                                    <option value="" >ข่าวประชาสัมพันธ์</option>
                                    </select>

                                </div>
                                
                                <div class="bottom">

                                    <input type="submit" value="ส่งข่าว"></input>
                                    <div class="clear"></div>
                                </div>
                            </form>

                        </div>
                        <div class="clear"></div>
                    </div>