<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"
%><!DOCTYPE HTML>
<meta charset="UTF-8">
<html>

<head>
    <title>预订中心</title>
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

        #field {
            width: 200px;
            height: 150px;
            text-align: center;
        }

        #field_table {
            width: 250px;
        }

        /* frame end */
    </style>
</head>

<body>
    <div id="header">

        <div id="version">
            <a href="index.jsp">
                <img src="images/header1.png" alt="体育场馆在线预约系统" border="0">
            </a>
        </div>
        <%@ include file="./autologin.jsp" %>
    </div>
    <!--header end-->

    <div id="nav">
        <!-- <a href="index.htm"><span class="home">&nbsp;</span></a> -->
        <a href="index.jsp"><span class="sp" id="tag2"
                onmouseover="switchTag('tag2','subnav2');this.blur();">首页</span></a> |
        <a href="booking-center.jsp"><span class="sp" id="tag3"
                onmouseover="switchTag('tag3','subnav3');this.blur();">预订中心</span></a> |
        <a href="introduction-center.html"><span class="sp" id="tag5"
                onmouseover="switchTag('tag5','subnav5');this.blur();">场馆简介</span></a> |
        <a href="announcement.html"><span class="sp" id="tag6"
                onmouseover="switchTag('tag6','subnav6');this.blur();">通知公告</span></a> |
        <a href="profile.jsp"><span class="sp" id="tag4"
                onmouseover="switchTag('tag4','subnav4');this.blur();">个人中心</span></a>
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

    <div id="footer">
        <div class="bottomcontact_cn">通讯地址: GZ市大山中学体育馆 邮编: 111111<br>
            电话: 020-7777-7777</div>
        <div class="bottomcontact_en">
            Address: Big Mountain Middle School Gym, GZ市, 111111, P. R. China<br>
            TEL: +86-20-84112828
        </div>
        <div class="clear"></div>
        <div class="copyright">大山中学版权所有 COPYRIGHT &copy; 1573 - 2022 , BMSG - <a href="#">联系我们</a> - <a
                href="#">网站地图</a>
            -
            <a href="#">粤ICP备12345678号</a>
        </div>
    </div>
    <!--footer end-->

</body>

</html>
