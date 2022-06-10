﻿<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"
%><!DOCTYPE HTML>
<meta charset="UTF-8">
<html>

<head>
    <title>通知公告</title>
    <script src="js/menu.js"></script>
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/nav.css">
    <link rel="stylesheet" href="css/subnav.css">
    <link rel="stylesheet" href="css/indexline.css">
    <link rel="stylesheet" href="css/colsleft.css">
    <link rel="stylesheet" href="css/quicklinks.css">
    <link rel="stylesheet" href="css/sublinks.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/body.css">
    <style>
        p {
            margin: 0px;
            padding: 0px;
        }



        /* frame */
        #header {
            width: 998px;
            height: 108px;

            margin: 0px auto;
            position: relative;
            padding: 0px;
        }

        #subnav {
            width: 998px;
            height: 41px;

            font-size: 13px;
            margin: 0 auto;
            text-align: left;
            color: #006600;
            line-height: 40px;
        }

        #main {
            background-color: #FFFFFF;

            overflow: hidden;
            padding: 0px 0px 5px 0px;
        }

        #mainbody {
            height: 500px;
        }

        #quicklinks {
            width: 998px;
            height: 20px;

            font-size: 14px;
            color: #000000;
            background: #D1D1D1;

            padding: 12px 0px 7px 0px;
            margin: 0px auto;
            word-spacing: 5px;
            font-weight: bold;
        }

        #sublinks {
            width: 958px;
            height: 20px;

            font-size: 12px;
            color: #000000;
            background: #D1D1D1;

            padding: 10px 20px;
            margin: 0px auto;
            word-spacing: 6px;
        }


        #footer {
            width: 958px;
            height: 85px;

            font-size: 12px;
            color: #FFFFFF;

            padding: 20px 20px;
            margin: 0px auto;
            height: 105px;
        }

        /* frame end */
    </style>
</head>

<body>
    <div id="header">

        <div id="version">
            <a href="index.jsp">
                <img src="images/header1.png" alt="体育场馆在线预约系统" border="0"></a>
        </div>
        <%@ include file="common/autologin.jsp" %>
    </div>
    <!--header end-->

    <div id="nav">
        <!-- <a href="index.htm"><span class="home">&nbsp;</span></a> -->
        <a href="index.jsp"><span class="sp" id="tag2"
                onmouseover="switchTag('tag2','subnav2');this.blur();">首页</span></a> |
        <a href="booking-center.jsp"><span class="sp" id="tag3"
                onmouseover="switchTag('tag3','subnav3');this.blur();">预订中心</span></a> |
        <a href="introduction-center.jsp"><span class="sp" id="tag5"
                onmouseover="switchTag('tag5','subnav5');this.blur();">场馆简介</span></a> |
        <a href="announcement.jsp"><span class="sp" id="tag6"
                onmouseover="switchTag('tag6','subnav6');this.blur();">通知公告</span></a> |
        <a href="profile.jsp"><span class="sp" id="tag4"
                onmouseover="switchTag('tag4','subnav4');this.blur();">个人中心</span></a>
    </div>
    <!--nav end-->



    <div id="main">
        <div id="mainbody">
            <div id="mainbody">


                <div class="cols">
                    <div class="colsleft">
                        <div class="clear"></div>
                        <div class="channel gonggao">
                            <h3>通知公告</h3>
                            <div id="newslist01" class="">
                                <ul id="xsyg01">
                                    <li><a href="announce1.html" target="_blank" title="羽毛球场">省大运会 | 女甲排球队勇夺金牌，十年八冠再续辉煌
                                            ·····································································································6-6</a>
                                    </li>
                                    <li><a href="announce2.html" target="_blank" title="篮球场">省大运会 |
                                            我校体育部在广东省第十一届大学生运动会科学论文报告会获佳绩
                                            ····································································6-6
                                        </a></li>
                                    <li><a href="announce3.html" target="_blank" title="乒乓球场">省大运会 |
                                            喜讯！我校网球代表队斩获甲组团体总分第一
                                            ·······························································································6-6</a>
                                    </li>
                                    <li><a href="announce4.html" target="_blank" title="游泳馆">省大运会 | 4金4银1铜！我校武术队赛场奏响凯歌
                                            ·········································································································6-6</a>
                                    </li>
                                    <li><a href="announce5.html" target="_blank" title="足球场">体育部召开冠军一流课程建设推进会
                                            &nbsp;·························································································································6-6</a>
                                    </li>
                                    <li>
                                        <a href="announce6.html" target="_blank" title="网球场">2022年春季学期体能提高班圆满结束
                                            ·························································································································6-6</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- colsleft end -->

                </div>
                <!-- cols end -->
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