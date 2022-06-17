<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"
%><%
	request.setCharacterEncoding("utf-8");
    String msg ="";
    if(session.getAttribute("userid") == null) {
        // TODO: try auto login include file = "autologin.jsp"
    } else {
        try {
            // String sectionUserID = (String)session.getAttribute("userid");
            if(request.getParameter("logout") != null) {
                session.setAttribute("userid", null);
                session.removeAttribute("userid");
                session.setAttribute("username", null);
                session.removeAttribute("username");
                response.sendRedirect("index.jsp");
            }
        } catch (Exception e){
	      msg = e.getMessage();
	    }
    }

%><!DOCTYPE HTML>
<meta charset="UTF-8">
<html>

<head>
    <title>大山中学体育场馆预约系统</title>
    <base target="_self">
    <%@ include file="common/header.jsp" %>
</head>

<body style="overflow:auto;">
    <div id="main">
        <div id="mainbody">
                <!--<div id="indexline">
                    <div id="box">
                        <img src="images/basketball.jpg" alt="篮球场" width="228" height="300" >
                    </div>
                    <div id="content_main">
                        <a>
                            <img src="images/badminton.jpeg" alt="羽毛球场" width="770" height="300">
                        </a>
                    </div>
                </div>-->
                <!-- indexline end -->
                
                <div id="slideMain">
                    <div class="slides">
                        <img class="slide" src="images/basketball.jpg">
                        <img class="slide" src="images/badminton.jpeg">
                        <img class="slide" src="images/basketball.jpg">
                        <img class="slide" src="images/badminton.jpeg">
                        <img class="slide" src="images/basketball.jpg">
                    </div>
                </div>

                <div class="cols">
                    <div class="colsleft">
                        <div class="cols01">
                            <div class="channel_shadow">
                                <div class="channel">
                                    <h3>
                                        <span class="newsmore"><a href="announcement.jsp">更多&gt;&gt;</a></span>通知公告
                                    </h3>
                                    <div id="newslist01" class="">
                                        <ul id="xsyg01">
                                            <li>
                                                <a href="announce1.html" target="_blank" title="羽毛球场">
                                                    公告1
                                                    ·····································································6-6
                                                </a>
                                            </li>
                                            <li>
                                                <a href="announce2.html" target="_blank" title="篮球场">
                                                    公告2
                                                    ·····································································6-6
                                                </a>
                                            </li>
                                            <li>
                                                <a href="announce3.html" target="_blank" title="乒乓球场">
                                                    公告3
                                                    ·····································································6-6
                                                </a>
                                            </li>
                                            <li>
                                                <a href="announce4.html" target="_blank" title="游泳馆">
                                                    公告4
                                                    ·····································································6-6
                                                </a>
                                            </li>
                                            <li>
                                                <a href="announce5.html" target="_blank" title="足球场">
                                                    公告5
                                                    ·····································································6-6
                                                </a>
                                            </li>
                                            <li>
                                                <a href="announce6.html" target="_blank" title="网球场">
                                                    公告6
                                                    ·····································································6-6
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="cols01">
                            <div class="channel_shadow">
                                <div class="channel">
                                    <h3>
                                        <span class="newsmore"><a href="booking-center.jsp">更多&gt;&gt;</a></span>预约入口
                                    </h3>
                                    <div id="newslist03">
                                        <ul id="xsyg01">
                                            <li>
                                                <a href="booking-badminton.jsp" target="_blank" title="羽毛球场">羽毛球场</a>
                                            </li>
                                            <li>
                                                <a href="booking-basketball.jsp" target="_blank" title="篮球场">
                                                    篮球场
                                                </a>
                                            </li>
                                            <li>
                                                <a href="booking-table-tennis.jsp" target="_blank"
                                                   title="乒乓球场">乒乓球场</a>
                                            </li>
                                            <li><a href="booking-swimming.jsp" target="_blank" title="游泳馆">游泳馆</a></li>
                                            <li>
                                                <a href="booking-football.jsp" target="_blank" title="足球场">足球场</a>
                                            </li>
                                            <li>
                                                <a href="booking-tennis.jsp" target="_blank" title="网球场">网球场</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="clear"></div>
                        <div class="channel gonggao">
                            <h3><span class="newsmore"><a href="introduction-center.jsp">更多&gt;&gt;</a></span>场馆简介</h3>
                            <p class="commontext">
                                <a href="introduction-badminton.html">羽毛球场</a>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="introduction-basketball.html">篮球场</a>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="introduction-table-tennis.html">乒乓球场</a>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="introduction-swimming.html">游泳馆</a>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="introduction-football.html">足球场</a>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="introduction-tennis.html">网球场</a>
                            </p>
                        </div>
                    </div>
                    <!-- colsleft end -->

                </div>
                <!-- cols end -->
            </div>
            <!--mainbody end-->


    </div>
    <!--main end-->

    <%@ include file="common/footer.html" %>
    <!--footer end-->

</body>

</html>
