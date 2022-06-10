<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"
%><%
	request.setCharacterEncoding("utf-8");
	String msg ="";
    String que = "";
    String userid = (String)session.getAttribute("userid");
	
	String connectString = "jdbc:mysql://172.18.187.253:3306/boke19335016"
					+ "?autoReconnect=true&useUnicode=true"
					+ "&characterEncoding=UTF-8"; 

        StringBuilder table=new StringBuilder("");
    
    if(userid == null){
        msg="用户未登录";
    }
    else if(!userid.equals("admin")){
        msg="权限不足";
    }
    else{


	if(request.getParameter("sub") != null){

        que = request.getParameter("query");
        if (que == null) {
            que = "";
        }

		try{
		  Class.forName("com.mysql.jdbc.Driver");
		  Connection con=DriverManager.getConnection(connectString, 
		                 "user", "123");
		  Statement stmt=con.createStatement();

		  String s="select * from student where s_id like '%" + que + "%' or name like '%" + que +"%'";
		  ResultSet rs=stmt.executeQuery(s);

		  table.append("<table>");
			table.append("<tr><th>学号</th><th>姓名</th><th>操作</th></tr>");
			while(rs.next()) {
				table.append("<tr>");
				table.append("<td>" + rs.getString("s_id") + "</td>");
				table.append("<td>" + rs.getString("name") + "</td>");
				table.append("<td>");
				String url2 = "admin-student-delete.jsp?id=" + rs.getString("s_id");
				table.append("<a href='" + url2 + "'>删除</a></td>");
				table.append("</tr>");
		}
	table.append("</table");
	  rs.close();
	  stmt.close();
	  con.close();
	}
	catch (Exception e){
	  msg = e.getMessage();
	}
}
}
%>
<!DOCTYPE HTML>
<html>
<head>
<title>学生名单管理系统</title>
<style>
   table{
          border-collapse: collapse;
          border: none;
          width: 500px;
   }
   td,th{
          border: solid grey 1px;            
          margin: 0 0 0 0;
          padding: 5px 5px 5px 5px 
  }
  .c1 {
    width:100px
  }
  .c2 {
    width:200px
  }
  a:link,a:visited {
    color:blue
  }
  
  .container{  
    margin:0 auto;   
    width:500px;  
    text-align:center;  
  }  
  p {text-align:left;  }
</style>
</head>
<body>
  <div class="container">
	  <h1>学生名单管理系统</h1> 
	<form action="admin-student.jsp" method="post" name="f">
		输入关键词查询:<input id="query" name="query" type="text" value="<%=que%>">		                     
		<input type="submit" name="sub" value="查询">
		 <br><br>
	</form> 
    <%=msg%>
    <%=table%>
	  <br><br>
      <a href="profile.jsp">返回</a>
      <br>
  </div>
</body>
</html>

