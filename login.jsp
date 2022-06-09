<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"
%><%
	request.setCharacterEncoding("utf-8");
    // TODO: session and cookie
    if(session.getAttribute("userid") == null) {
        // TODO: try auto login 
    } else {
        // String sectionUserID = (String)session.getAttribute("userid");
        response.sendRedirect("index.jsp");
    }

	String msg ="";
    String tableName = "student"; // db table
	String connectString = "jdbc:mysql://172.18.187.253:3306/boke19335016"
					+ "?autoReconnect=true&useUnicode=true"
					+ "&characterEncoding=UTF-8"; 
	String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
    StringBuilder rstable=new StringBuilder("");
	try{
      if (request.getParameter("id") == null || request.getParameter("id").isEmpty()) {
        rstable.append("<br><text> 学号不可为空！</text><br>"); // TODO: judge and show in frontend 
      }
      else if (request.getParameter("pwd") == null || request.getParameter("pwd").isEmpty()) {
        rstable.append("<br><text> 密码不可为空！</text><br>");
      }
	  else if(request.getParameter("login") != null) {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(connectString, "user", "123");
		PreparedStatement stmt=con.prepareStatement("select * from " + tableName + " where s_id = ? and password = ?");
        stmt.setString(1, id);
        stmt.setString(2, pwd);
        // using PreparedStatement 
		//ResultSet rs=stmt.executeQuery("select * from " + tableName + " where id = '" + id + "' and pwd = '" + pwd + "'");
        ResultSet rs=stmt.executeQuery();
		if (rs.next()) {
            rstable.append("<br><text> 登录成功！</text><br>");
            session.setAttribute("userid", id);
            response.sendRedirect("index.jsp");
        } // if (rs.next())
        else {
            rstable.append("<br><text> 学号或密码错误！</text><br>");
        }
		rs.close();
		stmt.close();
		con.close();
	  } // if(request.getParameter("login") != null)
      else if (request.getParameter("register") != null) { // TODO
        Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(connectString, "user", "123");
		PreparedStatement stmt=con.prepareStatement("select * from " + tableName + " where s_id = ?");
        stmt.setString(1, id);
        ResultSet rs=stmt.executeQuery();
		if (rs.next()) {
            rstable.append("<br><text>学号: " + rs.getString("s_id") + " 已存在！请登录！ </text><br>");
        } // if (rs.next())
        else {
            PreparedStatement stmt2=con.prepareStatement("insert into " + tableName + " (s_id, password) values (?, ?)");
            stmt2.setString(1, id);
            stmt2.setString(2, pwd);
            stmt2.executeUpdate();
		    stmt2.close();
            rstable.append("<br><text> 学号：" + id + " 注册成功！</text><br>");
            rstable.append("<br><text> 登录成功！</text><br>");
            session.setAttribute("userid", id);
            response.sendRedirect("index.jsp");
        } // else
		rs.close();
		stmt.close();
		con.close();
      }
	}
	catch (Exception e){
	  msg = e.getMessage();
	}
%><!DOCTYPE HTML>
<meta charset="UTF-8">
<html>
<head>
    <title>用户登录 </title>
    <base target="_self">
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
        .form-control:focus {
            border-color: #66afe9;
            outline: 0;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px rgba(102, 175, 233, .6);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px rgba(102, 175, 233, .6)
        }

        input[type="text"],
        textarea {
            color: grey
        }

        input[type="text"],
        input[type="password"],
        input[type="submit"] {
            width: 500px;

        }

        [for="content"] {
            vertical-align: top;
        }

        fieldset {
            width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #FCFCFF;
            font-size: 18px;
        }

        input {
            height: 50px;
        }

        textarea:focus,
        input:focus {

            border-color: #66afe9;
            outline: 0;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px rgba(102, 175, 233, .6);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px rgba(102, 175, 233, .6)
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

        #mainbody {
            width: 998px;
            height: 700px;
            margin: 0px auto;
            padding: 2px;
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
        <a href="booking-center.html"><span class="sp" id="tag3"
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
            <div id="indexline" style="height: 400px; background-color: #FFFFFF;">
                <fieldset id="filed" style="background-color: #03437b;">
                    <form action="login.jsp" method="post">
                        <p><label for="title" style="color: #FFFFFF; font-size: 24px;">学号: </label>
                            <input name="id" type="text" maxlength=16 placeholder="请输入学号" value="${param.id}" style="font-size: 24px;">
                        </p>
                        <p>
                            &nbsp;
                        </p>
                        <p><label for="keywords" style="color: #FFFFFF; font-size: 24px;">密码: </label>
                            <input name="pwd" type="password" maxlength=32 placeholder="请输入密码" value="${param.pwd}" style="font-size: 24px;">
                        </p>
                        <p>
                            &nbsp;
                        </p>
                        <p>
                            <button name="login" type="submit" value="登录" style="float: left;width: 240px;height: 36px;margin-left: 60px;font-size: 22px;">登录</button>
                            <button name="register" type="submit" value="注册" style="float: right;width: 240px;height: 36px;margin-right: 30px;font-size: 22px;">注册</button>
                        </p>
                        <!-- TODO: use cookie to enable auto login -->
                        <p>
                            &nbsp;
                        </p>
                        <div style="margin-top: 30px; font-size: 22px; color: #FFFFFF">
                            <%=rstable%><br>
                            <%=msg%><br>
                        </div>
                        <!-- <input name="exit" type="submit" value="退出"> &nbsp;&nbsp; -->
                        <!-- <button name="clear" type="reset" disabled>复位</button> </p> -->
                    </form>
                </fieldset>
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