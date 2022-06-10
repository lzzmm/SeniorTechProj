<%@ page language="java" import="java.util.*,java.sql.*,java.util.Date,java.text.SimpleDateFormat" 
         contentType="text/html; charset=utf-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%
	String msg = "";
    String year = "";
    String month  = "";
    String day = "";
    int showTable = 1;
    int max=8;

	String connectString = "jdbc:mysql://172.18.187.253:3306/boke19335016"
					+ "?autoReconnect=true&useUnicode=true"
					+ "&characterEncoding=UTF-8"; 

    StringBuilder table=new StringBuilder("");
		
	if(request.getParameter("query") != null){

        year = request.getParameter("year");
        month = request.getParameter("month");
        day = request.getParameter("day");

        if(day.equals("31")){
            if(month.equals("04")||month.equals("06")||month.equals("09")||month.equals("11")){
                msg="无效日期";
                showTable=0;
            }
        }
        if(month.equals("02")){
            if(day.equals("29")||day.equals("30")||day.equals("31")){
                msg="无效日期";
                showTable=0;
            }
        }

        String date1 = year + month + day;
        java.text.SimpleDateFormat formatter = new SimpleDateFormat( "yyyyMMdd ");
        String today = formatter.format(new Date());

        if(date1.compareTo(today) <= 0) {
            msg="请选择未来的日期";
            showTable=0;
        }

        if(showTable==1){

	    try{

        String s="select count(*) from booking where time = ? and type = 'badminton' and year = '" 
            + year +"' and month ='" + month +"' and day = '" + day + "'";
            
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(connectString, "user", "123");
        PreparedStatement stmt=con.prepareStatement(s);

        table.append("<table border= '1'>");
        table.append("<tr><th>时间段</th><th>剩余数量</th><th>操作</th></tr>");

        String[] timearray ={"10:00 - 11:00", "11:00 - 12:00", "14:00 - 15:00", "15:00 - 16:00", "16:00 - 17:00", "17:00 - 18:00", "18:00 - 19:00", "19:00 - 20:00", "20:00 - 21:00"};
        
        for(int i=0;i<9;i++){
        table.append("<tr><td>"+timearray[i]+"</td>");
        stmt.setString(1, timearray[i]);
        ResultSet rs=stmt.executeQuery();
		if(rs.next()) {
            String nums =  rs.getString("count(*)");
            int numi = Integer.valueOf(nums).intValue();
            numi= max - numi;
            nums = String.valueOf(numi);
            table.append("<td>" + nums + "</td>");
            if(numi>0){
                String url = "booking.jsp?type=badminton&time="+timearray[i]+"&year="+year+"&month="+month+"&day="+day;
                table.append("<td><a href='" + url + "'>点击预约</a> </td></tr>");
            }
            else{
                table.append("<td id ='full'> 位置已满 </td></tr>");
            }
		} 
        rs.close();           
        }    

	    table.append("</table>");
	    stmt.close();
	    con.close();
	}
	catch (Exception e){
	    msg = e.getMessage();
	}
    }
    }
    else{
        msg="请输入预约日期";
    }
%>

<!DOCTYPE HTML>
<meta charset="UTF-8">
<html>

<head>
    <title>羽毛球场预约</title>
    <base target="_self">
    <%@ include file="common/header.html" %>
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
        <a href="booking-center.jsp"><span class="sp" id="tag3"
                onmouseover="switchTag('tag3','subnav3');this.blur();">预订中心</span></a> |
        <a href="introduction-center.jsp"><span class="sp" id="tag5"
                onmouseover="switchTag('tag5','subnav5');this.blur();">场馆简介</span></a> |
        <a href="announcement.jsp"><span class="sp" id="tag6"
                onmouseover="switchTag('tag6','subnav6');this.blur();">通知公告</span></a> |
        <a href="profile.jsp"><span class="sp" id="tag4"
                onmouseover="switchTag('tag4','subnav4');this.blur();">个人中心</span></a>
    </div>
    <!--nav end-->


    <div id="main">
        <div id="mainbody" style="height: 550px;">
            <div id="indexline" style="height: 550px; ">
                <h2 id="secondheader">羽 毛 球 场 预 约</h2>
                <form action="booking-badminton.jsp" method="post" name="f" id="inputbox">
                    <label> &nbsp; 预约日期: &nbsp; </label>
                    <select name="year">
                        <option value="2022"  <%=month.equals("2022")?"selected":""%>>2022</option>
                     </select>
                     年 &nbsp;
                     <select name="month">
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
                     月 &nbsp;
                     <select name="day">
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
                     日 &nbsp;
                     <input name="query" type="submit" value="查询">
                </form> 
                <p id="messagebox"> <%=msg%> </p><br>
                <%=table%>

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
