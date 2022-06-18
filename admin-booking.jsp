<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"
%><%
	request.setCharacterEncoding("utf-8");
	String msg ="";
  
    String year = "";
    String month  = "";
    String day = "";
    String type = "";
    String s_id = "";
    String userid = (String)session.getAttribute("userid");
	
	String connectString = "jdbc:mysql://172.18.187.253:3306/boke19335016"
					+ "?autoReconnect=true&useUnicode=true"
					+ "&characterEncoding=UTF-8"; 

        StringBuilder table=new StringBuilder("");
    
    if(userid == null){
        msg="用户未登录";
    }
    else if(!userid.equals("000000")){
        msg="权限不足";
    }
    else{


	if(request.getParameter("sub") != null){

    type = request.getParameter("type");
    year = request.getParameter("year");
    month = request.getParameter("month");
    day = request.getParameter("day");
    s_id = request.getParameter("s_id");
    
    String s="select * from booking where year ='" + year + "'";

    if(!type.equals("")){
      s += "and type ='" + type + "'";
    }
    if(!month.equals("")){
      s += "and month ='" + month + "'";
    }
    if(!day.equals("")){
      s += "and day ='" + day + "'";
    }
    if(!s_id.equals("")){
      s += "and s_id ='" + s_id + "'";
    }

		try{
		  Class.forName("com.mysql.jdbc.Driver");
		  Connection con=DriverManager.getConnection(connectString, 
		                 "user", "123");
		  Statement stmt=con.createStatement();

		  ResultSet rs=stmt.executeQuery(s);

		  table.append("<table>");
			table.append("<tr><th>编号</th><th>类型</th><th>日期</th><th>时间段</th><th>学号</th><th>操作</th></tr>");
			while(rs.next()) {
				table.append("<tr>");
				table.append("<td>" + rs.getString("b_id") + "</td>");
        
				table.append("<td>" + rs.getString("type") + "</td>");
        table.append("<td>" + rs.getString("year") + "-" + rs.getString("month") + "-" + rs.getString("day") + "</td>");
        table.append("<td>" + rs.getString("time") + "</td>");
        table.append("<td>" + rs.getString("s_id") + "</td>");
				table.append("<td>");
				String url2 = "admin-booking-delete.jsp?id=" + rs.getString("b_id");
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
<title>预约记录管理系统</title>
<style>
   table{
          border-collapse: collapse;
          border: none;
          width: 500px;
          margin: auto;
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
    width:600px;  
    text-align:center;  
  }  
  p {text-align:left;  }

</style>
</head>
<body>
  <div class="container">
	  <h1>预约记录管理系统</h1> 
    <form action="admin-booking.jsp" method="post" name="f" id="inputbox">
      <label>类型: </label>
      <select name="type">
          <option value="" <%=type.equals("")?"selected":""%>>全部</option>
          <option value="badminton" <%=type.equals("badminton")?"selected":""%>>羽毛球场</option>
          <option value="basketball" <%=type.equals("basketball")?"selected":""%>>篮球球场</option>
          <option value="football" <%=type.equals("football")?"selected":""%>>足球场</option>
          <option value="swimming" <%=type.equals("swimming")?"selected":""%>>游泳馆</option>
          <option value="table-tennis" <%=type.equals("table-tennis")?"selected":""%>>乒乓球场</option>
          <option value="tennis" <%=type.equals("tennis")?"selected":""%>>网球场</option>
       </select>
       &nbsp;
      <label>日期: </label>
      <select name="year">
          <option value="2022" <%=year.equals("2022")?"selected":""%>>2022</option>
       </select>
       年
       <select name="month">
          <option value="" <%=month.equals("")?"selected":""%>>全部</option>
          <option value="01" <%=month.equals("01")?"selected":""%>>1</option>
          <option value="02" <%=month.equals("02")?"selected":""%>>2</option>
          <option value="03" <%=month.equals("03")?"selected":""%>>3</option>
          <option value="04" <%=month.equals("04")?"selected":""%>>4</option>
          <option value="05" <%=month.equals("05")?"selected":""%>>5</option>
          <option value="06" <%=month.equals("06")?"selected":""%>>6</option>
          <option value="07" <%=month.equals("07")?"selected":""%>>7</option>
          <option value="08" <%=month.equals("08")?"selected":""%>>8</option>
          <option value="09" <%=month.equals("09")?"selected":""%>>9</option>
          <option value="10" <%=month.equals("10")?"selected":""%>>10</option>
          <option value="11" <%=month.equals("11")?"selected":""%>>11</option>
          <option value="12" <%=month.equals("12")?"selected":""%>>12</option>
       </select>
       月
       <select name="day">
          <option value="" <%=day.equals("")?"selected":""%>>全部</option>
          <option value="01" <%=day.equals("01")?"selected":""%>>1</option>
          <option value="02" <%=day.equals("02")?"selected":""%>>2</option>
          <option value="03" <%=day.equals("03")?"selected":""%>>3</option>
          <option value="04" <%=day.equals("04")?"selected":""%>>4</option>
          <option value="05" <%=day.equals("05")?"selected":""%>>5</option>
          <option value="06" <%=day.equals("06")?"selected":""%>>6</option>
          <option value="07" <%=day.equals("07")?"selected":""%>>7</option>
          <option value="08" <%=day.equals("08")?"selected":""%>>8</option>
          <option value="09" <%=day.equals("09")?"selected":""%>>9</option>
          <option value="10" <%=day.equals("10")?"selected":""%>>10</option>
          <option value="11" <%=day.equals("11")?"selected":""%>>11</option>
          <option value="12" <%=day.equals("12")?"selected":""%>>12</option>
          <option value="13" <%=day.equals("13")?"selected":""%>>13</option>
          <option value="14" <%=day.equals("14")?"selected":""%>>14</option>
          <option value="15" <%=day.equals("15")?"selected":""%>>15</option>
          <option value="16" <%=day.equals("16")?"selected":""%>>16</option>
          <option value="17" <%=day.equals("17")?"selected":""%>>17</option>
          <option value="18" <%=day.equals("18")?"selected":""%>>18</option>
          <option value="19" <%=day.equals("19")?"selected":""%>>19</option>
          <option value="20" <%=day.equals("20")?"selected":""%>>20</option>
          <option value="21" <%=day.equals("21")?"selected":""%>>21</option>
          <option value="22" <%=day.equals("22")?"selected":""%>>22</option>
          <option value="23" <%=day.equals("23")?"selected":""%>>23</option>
          <option value="24" <%=day.equals("24")?"selected":""%>>24</option>
          <option value="25" <%=day.equals("25")?"selected":""%>>25</option>
          <option value="26" <%=day.equals("26")?"selected":""%>>26</option>
          <option value="27" <%=day.equals("27")?"selected":""%>>27</option>
          <option value="28" <%=day.equals("28")?"selected":""%>>28</option>
          <option value="29" <%=day.equals("29")?"selected":""%>>29</option>
          <option value="30" <%=day.equals("30")?"selected":""%>>30</option>
          <option value="31" <%=day.equals("31")?"selected":""%>>31</option>
       </select>
       日
       &nbsp;
       <label>学号: </label>
       <input  style="width:60px" name="s_id" type="text" value="<%=s_id%>">	
       &nbsp;
       <input type="submit" name="sub" value="查询">
  </form> 
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

