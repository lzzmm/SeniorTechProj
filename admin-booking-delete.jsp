<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"
%><%
	request.setCharacterEncoding("utf-8");
	String msg ="";
    String userid = (String)session.getAttribute("userid");
    String deleteid = request.getParameter("id");

	String connectString = "jdbc:mysql://172.18.187.253:3306/boke19335016"
					+ "?autoReconnect=true&useUnicode=true"
					+ "&characterEncoding=UTF-8"; 
    
    if(userid == null){
        msg="用户未登录";
    }
    else if(!userid.equals("000000")){
        msg="权限不足";
    }
    else{

	try{
	  Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection(connectString, 
	                 "user", "123");
	  Statement stmt=con.createStatement();

        String s = "delete from booking where b_id='" + deleteid + "'";
        int rs = stmt.executeUpdate(s);
        if(rs>0){
		    msg = "删除成功";
        }
        else{
          msg="错误";
        }	
	  stmt.close();
	  con.close();
    }
	catch (Exception e){
	  msg = e.getMessage();
	}
    }
%>
<!DOCTYPE HTML>
<head>
   <title>预约记录管理系统</title>
   <style>
     a:link,a:visited {color:blue}
     .container{  
    	margin:0 auto; 
    	width:500px;  
    	text-align:center;  
     } 
   </style>
</head>
<body>
  <div class="container">
    <h1>预约记录管理系统</h1>
	<%=msg%><br/><br/>
	<a href='admin-booking.jsp'>返回</a>
  </div>
</body>
</html>
