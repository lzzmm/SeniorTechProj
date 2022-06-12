<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"
%><!DOCTYPE HTML>
<meta charset="UTF-8">
<html>

<head>
    <title>场馆简介</title>
    <base target="_self">
    <%@ include file="common/header.jsp" %>
    <style>
        table {
            /* border-collapse: collapse */
            border-color: #FFFFFF;
            color: #FFF;
            margin: 0 auto;
        }

        td,
        th {
            height: 40px;
            width: 240px;
            text-align: center
        }

        caption {
            font-size: 20px;
            font-weight: bold;
        }
    </style>
</head>

<body link="#FFFFFF" alink="FFFFFF" vlink="FFFFFF">
    <div id="header">
        <!-- <div id="logo">
            <img src="images/logo.jpg" alt="中山大学">
        </div> -->
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
            <div id="indexline" style="height: 400px;">
                <table border="1">
                    <caption>场馆简介</caption>
                    <thead>
                        <tr>
                            <th>场馆</th>
                            <th>场馆简介</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>羽毛球场</td>
                            <td><a href="introduction-badminton.html">点此查看</a></td>
                        </tr>

                        <tr>
                            <td>篮球场</td>
                            <td><a href="introduction-basketball.html">点此查看</a></td>
                        </tr>

                        <tr>
                            <td>乒乓球场</td>
                            <td><a href="introduction-table-tennis.html">点此查看</a></td>
                        </tr>

                        <tr>
                            <td>游泳馆</td>
                            <td><a href="introduction-swimming.html">点此查看</a></td>
                        </tr>
                        <tr>
                            <td>足球场</td>
                            <td><a href="introduction-football.html">点此查看</a></td>
                        </tr>

                        <tr>
                            <td>网球场</td>
                            <td><a href="introduction-tennis.html">点此查看</a></td>
                        </tr>

                    </tbody>
                </table>
            </div>
            <!--mainbody end-->

        </div>
        <!--mainbody end-->


    </div>
    <!--main end-->
    <%@ include file="common/footer.html" %>
    <!--footer end-->

</body>

</html>