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
        <base target="_self">
    <%@ include file="common/header.jsp" %>
    </style>
</head>

<body link="#FFFFFF" alink="FFFFFF" vlink="FFFFFF">
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

    <%@ include file="common/footer.html" %>
    <!--footer end-->

</body>

</html>