<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"
%><%
	request.setCharacterEncoding("utf-8");
    // TODO: redirect to orgin page
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
    String name = request.getParameter("name");
    String pwd = request.getParameter("pwd");
    StringBuilder rstable = new StringBuilder("");
	try{
      if(request.getParameter("login") != null) {
		response.sendRedirect("login.jsp");
	  } // if(request.getParameter("login") != null)
      if (request.getParameter("register") != null) {
        Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(connectString, "user", "123");
		PreparedStatement stmt=con.prepareStatement("select * from " + tableName + " where s_id = ?");
        stmt.setString(1, id);
        ResultSet rs=stmt.executeQuery();
		if (rs.next()) {
            rstable.append("<text>学号: " + rs.getString("s_id") + " 已存在！请登录！ </text>");
        } // if (rs.next())
        else {
            PreparedStatement stmt2=con.prepareStatement("insert into " + tableName + " (s_id, name, password) values (?, ?, ?)");
            stmt2.setString(1, id);
            stmt2.setString(2, name);
            stmt2.setString(3, pwd);
            stmt2.executeUpdate();
		    stmt2.close();
            rstable.append("<text> 学号：" + id + " 姓名：" + name + " 注册成功！</text>");
            rstable.append("<text> 登录成功！</text>");
            session.setAttribute("userid", id);
            session.setAttribute("username", name);
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
    <title>用户注册</title>
    <base target="_self">
    <%@ include file="common/header.jsp" %>
</head>

<body>
    <main class="container">
    </main>
    <div id="main">
        <div id="mainbody">
        <div id="field">
            <br/>
            <h1>注册<h1/>
            <form action="register.jsp" method="post">
                <div class="grid">
                    <label for="id">学号<input type="text" id="id" name="id" placeholder="请输入学号" pattern="\d*" title="Numbers only" required=""  value="${param.id}"></label> 
                    <label for="name">姓名<input type="text" id="name" name="name" placeholder="请输入姓名" required=""  value="${param.name}"></label>
                </div>
                <label for="pwd">密码</label> <input type="password" id="pwd" name="pwd" placeholder="请输入密码" required="">
                <label for="pwd">确认密码</label> <input type="password" id="repwd" name="repwd" placeholder="请重复密码" required="">
                <label name="rs"><%=rstable%><%=msg%></label>  
                <button name="register" type="submit" aria-label="Example button">注册</button>
                <button name="login" type="submit" aria-label="Example button" class="secondary" onclick="location='login.jsp'">已有账号</button>
            </form>
            <script>
                var repass = document.getElementById("repwd");
                var id = document.getElementById("id");
                id.addEventListener("input",
                    function(e){
                        if(e.target.value.length < 5){
                            e.target.setCustomValidity("学号不能少于5位数！");
                        }
                        else{
                            e.target.setCustomValidity("");
                        }
                },false)
                repass.addEventListener("input",
                    function(e){
                        var pass = document.getElementById("pwd");
                        if(e.target.value.length < 6) {
                            e.target.setCustomValidity("密码不能少于6位！");
                        }
                        else if(e.target.value===pass.value){
                            e.target.setCustomValidity("");
                        }
                        else{
                            e.target.setCustomValidity("两次输入的密码不同！");
                        }
                },false)
            </script>
        <!--<fieldset id="filed">
            <form action="login.jsp" method="post">
                <p><label for="title" style="font-size: 24px;">学号: </label>
                    <input name="id" type="text" maxlength=16 placeholder="请输入学号" value="${param.id}" onblur="" style="font-size: 24px;">
                </p>
                <p><label for="title" style="font-size: 24px;">姓名: </label>
                    <input name="name" type="text" maxlength=20 placeholder="请输入姓名" value="${param.name}" style="font-size: 24px;">
                </p>
                <p><label for="keywords" style="font-size: 24px;">密码: </label>
                    <input name="pwd" type="password" maxlength=32 placeholder="请输入密码" value="${param.pwd}" style="font-size: 24px;">
                </p>
                <p>
                    &nbsp;
                </p>
                <p>
                    <button name="login" type="submit" value="登录" style="float: left;width: 240px;height: 36px;margin-left: 60px;font-size: 22px;">登录</button>
                    <button name="register" type="submit" value="注册" style="float: right;width: 240px;height: 36px;margin-right: 30px;font-size: 22px;">注册</button>
                </p>
                <p>
                    &nbsp;
                </p>
                <div style="margin-top: 30px; font-size: 22px;">
                    <%=rstable%><br>
                    <%=msg%><br>
                </div>
            </form>
        </fieldset> -->      
        </div>
        <!--mainbody end-->
    </div>
    </div>
    <!--main end-->

    <%@ include file="common/footer.html" %>

</body>

</html>