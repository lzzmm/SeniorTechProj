<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"
%><!DOCTYPE HTML>
<meta charset="UTF-8">
<html>

<head>
    <title>预订中心</title>
    <base target="_self">
    <%@ include file="common/header.html" %>

</head>

<body>
    <div id="header">

        <div id="version">
            <a href="index.jsp">
                <img src="images/header1.png" alt="体育场馆在线预约系统" border="0">
            </a>
        </div>
        <%@ include file="common/autologin.jsp" %>
    </div>
    <!--header end-->

    <div id="nav">
        <!-- <a href="index.htm"><span class="home">&nbsp;</span></a> -->
        <a href="index.jsp">
            <span class="sp" id="tag2"
                  onmouseover="switchTag('tag2','subnav2');this.blur();">首页</span>
        </a> |
        <a href="booking-center.jsp">
            <span class="sp" id="tag3"
                  onmouseover="switchTag('tag3','subnav3');this.blur();">预订中心</span>
        </a> |
        <a href="introduction-center.jsp">
            <span class="sp" id="tag5"
                  onmouseover="switchTag('tag5','subnav5');this.blur();">场馆简介</span>
        </a> |
        <a href="announcement.jsp">
            <span class="sp" id="tag6"
                  onmouseover="switchTag('tag6','subnav6');this.blur();">通知公告</span>
        </a> |
        <a href="profile.jsp">
            <span class="sp" id="tag4"
                  onmouseover="switchTag('tag4','subnav4');this.blur();">个人中心</span>
        </a>
    </div>
    <!--nav end-->



    <div id="main">
        <div id="mainbody">
            <p>
                &nbsp;&nbsp;
            </p>
            <table style="margin: auto;">

                <tr>

                    <td id="field_table">
                        <a href="booking-badminton.jsp">
                            <img src="images/small-badminton.webp" id="field">
                            <p id="field">
                                羽毛球场
                            </p>
                        </a>
                    </td>

                    <td id="field_table">
                        <a href="booking-basketball.jsp">
                            <img src="images/small-basketball.jpg" id="field">
                            <p id="field">
                                篮球场
                            </p>
                        </a>
                    </td>

                    <td id="field_table">
                        <a href="booking-tennis.jsp">
                            <img src="images/small-tennis.webp" id="field">
                            <p id="field">
                                网球场
                            </p>
                        </a>
                    </td>
                </tr>

                <tr></tr>
                <td id="field_table">
                    <a href="booking-table-tennis.jsp">
                        <img src="images/small-table-tennis.webp" id="field">
                        <p id="field">
                            乒乓球场
                        </p>
                    </a>
                </td>

                <td id="field_table">
                    <a href="booking-swimming.jsp">
                        <img src="images/small-swimming-pool.webp" id="field">
                        <p id="field">
                            游泳馆
                        </p>
                    </a>
                </td>

                <td id="field_table">
                    <a href="booking-football.jsp">
                        <img src="images/small-football.webp" id="field">
                        <p id="field">
                            足球场
                        </p>
                    </a>
                </td>
                </tr>


            </table>

        </div>
        <!--mainbody end-->


    </div>
    <!--main end-->

    <%@ include file="common/footer.html" %>
    <!--footer end-->

</body>

</html>
