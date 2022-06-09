<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"
%><%
	request.setCharacterEncoding("utf-8");
    String msg  = "";
    String id   = (String)session.getAttribute("userid");
    String name = (String)session.getAttribute("username");
    StringBuilder table=new StringBuilder("");
    if(id == null || id.isEmpty()) {
        // TODO: try auto login include file = "autologin.jsp"
        response.sendRedirect("login.jsp");
    } else {
	    String connectString = "jdbc:mysql://172.18.187.253:3306/boke19335016"
					    + "?autoReconnect=true&useUnicode=true"
					    + "&characterEncoding=UTF-8"; 
        try{
		    Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection(connectString, "user", "123");
		    PreparedStatement stmt=con.prepareStatement("select * from booking where s_id = ?");
            stmt.setString(1, id);
            ResultSet rs=stmt.executeQuery();
            //table.append("<table>");
		    table.append("<tr><th>预定编号</th><th>场馆类型</th><th>预约日期</th><th>预约时间段</th></tr>");
            String startTime = "";
            String endTime = "";
		    while (rs.next()) {
                table.append("<tr colspan=\"2\">");
		        table.append("<td>" + rs.getString("b_id") + "</td>");
		        table.append("<td>" + rs.getString("type") + "</td>");
		        table.append("<td>" + rs.getString("year") + "年" + rs.getString("month") + "月" + rs.getString("day") + "日" + "</td>");
                table.append("<td>" + rs.getString("time") + "</td>");
		        table.append("</tr>");    
            } // while (rs.next())
            //table.append("</table>");
		    rs.close();
		    stmt.close();
		    con.close();
	    }
        catch (Exception e){
	        msg = e.getMessage();
	    }
    }
%><!DOCTYPE HTML>
<meta charset="UTF-8">
<html>

<head>
    <title>个人中心</title>
    <script src="js/menu.js"></script>
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/nav.css">
    <link rel="stylesheet" href="css/subnav.css">
    <link rel="stylesheet" href="css/indexline.css">
    <link rel="stylesheet" href="css/colsleft.css">
    <!-- <link rel="stylesheet" href="css/cols02.css"> -->
    <link rel="stylesheet" href="css/quicklinks.css">
    <link rel="stylesheet" href="css/sublinks.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/body.css">
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

        /* frame end */
    </style>
</head>

<body link="#FFFFFF" alink="FFFFFF" vlink="FFFFFF">
    <div id="header">
        <!-- <div id="logo">
            <img src="images/logo.jpg" alt="中山大学">
        </div> -->
        <div id="version">
            <a href="index.jsp">
                <img src="images/header1.png" alt="体育场馆在线预约系统" border="0"></a>
        </div>
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
        <div id="mainbody" style="height: 400px;">
            <div id="indexline" style="height: 400px;">
                
                <table border="1">
                    <caption>个人中心</caption>
                    <thead>
                        <tr>
                            <th>姓名：</th>
                            <th><%=name%></th>
                        </tr>
                        <tr>
                            <th>学号：</th>
                            <th><%=id%></th>
                        </tr>
                        <tr>
                            <th colspan="2">订单记录</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%=table%>
                    </tbody>
                </table>
                
            </div>
            <!--mainbody end-->

        </div>
        <!--mainbody end-->


    </div>
    <!--main end-->

    <div id="footer">
        <!-- <div class="bottomlogo">
            <img src="images/logo-bottom.jpg">
        </div> -->
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