<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%
	String msg = "";
    String year = "";
    String month  = "";
    String day = "";
    String type = "";
    String time = "";
    String s_id = "";
    int isbook=1;
    int max = 0;

    String connectString = "jdbc:mysql://172.18.187.253:3306/boke19335016"
    + "?autoReconnect=true&useUnicode=true"
    + "&characterEncoding=UTF-8"; 


    year = request.getParameter("year");

    month = request.getParameter("month");

    day = request.getParameter("day");

    time = request.getParameter("time");

    type = request.getParameter("type");

    s_id = (String) session.getAttribute("userid");

    if (year == null || month == null || day == null || time == null || type == null){
        msg="内部错误";
    }
    else if(s_id == null){
        msg="用户未登录";
        // response.sendRedirect("login.jsp");
    }
    else{
        if(type.equals("badminton")){
            max=8;
        }
        else if(type.equals("basketball")){
            max=12;
        }
        else if(type.equals("table-tennis")){
            max=16;
        }   
        else if(type.equals("tennis")){
            max=6;
        }   
        else if(type.equals("football")){
            max=4;
        }   
        else if(type.equals("swimming")){
            max=20;
        }   
        
	try{

        Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(connectString, 
                        "user", "123");
		Statement stmt=con.createStatement();


        String s="select count(*) from booking where time = '" +time+ "' and type = '"
            +type+ "' and year = '" + year +"' and month ='" + month +"' and day = '" + day + "'";

        ResultSet rs=stmt.executeQuery(s);

        if(rs.next()) {
            String nums =  rs.getString("count(*)");
            int numi = Integer.valueOf(nums).intValue();
            numi = 10-numi;
            if(numi<=0){
                msg="预约失败，该时段场馆位置已满";
                isbook=0;
            }
        }

        s += " and s_id='" + s_id +"'";
        rs=stmt.executeQuery(s);
        if(rs.next()) {
            String nums1 =  rs.getString("count(*)");
            int numi1 = Integer.valueOf(nums1).intValue();
            if(numi1>0){
                msg="请勿重复预约";
                isbook=0;
            }
        }

        if(isbook==1){
            s = "insert into booking(type, time, year, month, day, s_id) values('" + type + "', '" 
                + time + "', '" + year + "', '" + month + "', '" + day + "', '" + s_id + "')";
            int rs2=stmt.executeUpdate(s);
            if(rs2>0){
                msg = "预约成功!";
            }
            else{
                msg="预约失败";
            }
        }
        
        rs.close();
	    stmt.close();
	    con.close();
    }
	catch (Exception e){
	    msg = e.getMessage();
	}

    }
%>

<!DOCTYPE HTML>
<meta charset="UTF-8">
<html>

<head>
    <title>体育场馆在线预约系统</title>
    <%@ include file="common/header.jsp" %>
    <style>

        p {
            text-align: center;
        }

    </style>
</head>

<body>
    <div id="main">
        <div id="mainbody" style="height: 550px;">
                <p><h1 id="secondheader">在线预约</h1></p>
                <br>
                <p id="messagebox"> <%=msg%> </p>
                <p><a href="index.jsp">返回首页</a></p>
            </div>
            <!--mainbody end-->
    </div>
    <!--main end-->
    <%@ include file="common/footer.html" %>
    <!--footer end-->

</body>

</html>
