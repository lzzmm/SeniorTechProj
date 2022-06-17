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
            table.append("<table role=\"grid\"><thead>");
		    table.append("<tr><th>预订编号</th><th>场馆类型</th><th>预约日期</th><th>预约时间段</th></tr></thead><tbody>");
            String startTime = "";
            String endTime = "";
		    while (rs.next()) {
                table.append("<tr>");
		        table.append("<td>" + rs.getString("b_id") + "</td>");
		        table.append("<td>" + rs.getString("type") + "</td>");
		        table.append("<td>" + rs.getString("year") + "年" + rs.getString("month") + "月" + rs.getString("day") + "日" + "</td>");
                table.append("<td>" + rs.getString("time") + "</td>");
		        table.append("</tr>");    
            } // while (rs.next())
            table.append("</tbody></table>");
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
        <base target="_self">
    <%@ include file="common/header.jsp" %>
    </style>
</head>

<body>
    <div id="main">
        <div id="mainbody">
        <main class="container">
        <p>
        <h1>个人中心</h1>
        </p>
        <p>
            <h4>姓名：<%=name%> &nbsp; 学号：<%=id%></h4>
        </p>
        <section>
            <h2>预订记录</h2>
            <figure><%=table%></figure>
        </section>
        </main>
        </div>
        <!--mainbody end-->
    </div>
    <!--main end-->
    <%@ include file="common/footer.html" %>
    <!--footer end-->

</body>

</html>