<%@ page language="java" import="java.util.*,java.sql.*,java.util.Date,java.text.SimpleDateFormat" 
         contentType="text/html; charset=utf-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%
	String msg = "";
    String year = "";
    String month  = "";
    String day = "";
    String type = "";
    String itype = "";

    int showTable = 1;
    int max = 0;
    int timenum = 0;
    int timeindex = 0;

	String connectString = "jdbc:mysql://172.18.187.253:3306/boke19335016"
					+ "?autoReconnect=true&useUnicode=true"
					+ "&characterEncoding=UTF-8"; 

    StringBuilder table=new StringBuilder("");

    itype = request.getParameter("itype");
    if(itype!=null){
        type=itype;
    }
		
	if(request.getParameter("query") != null){

        type = request.getParameter("type");
        year = request.getParameter("year");
        month = request.getParameter("month");
        day = request.getParameter("day");
        

        if(day.equals("31")){
            if(month.equals("04")||month.equals("06")||month.equals("09")||month.equals("11")){
                msg="错误日期";
                showTable=0;
            }
        }
        if(month.equals("02")){
            if(day.equals("29")||day.equals("30")||day.equals("31")){
                msg="错误日期";
                showTable=0;
            }
        }

        String date1 = year + month + day;
        java.text.SimpleDateFormat formatter = new SimpleDateFormat( "yyyyMMdd ");
        String today = formatter.format(new Date());

        if(showTable == 1 && date1.compareTo(today) <= 0) {
            msg="日期已失效，请提前一天进行预约";
            showTable=0;
        }

        if(showTable==1){

            String[][] timearray = {{"10:00 - 11:00", "11:00 - 12:00", "14:00 - 15:00", "15:00 - 16:00", 
                "16:00 - 17:00", "17:00 - 18:00", "18:00 - 19:00", "19:00 - 20:00", "20:00 - 21:00"},
                {"10:00 - 12:00", "14:00 - 16:00", "16:00 - 18:00", "19:00 - 21:00"},
                {"10:00 - 12:00", "14:00 - 18:00", "19:00 - 21:00"}};

            if(type.equals("badminton")){
                max=8;
                timenum = 9;
            }
            else if(type.equals("basketball")){
                max=12;
                timenum = 9;
            }
            else if(type.equals("table-tennis")){
                max=16;
                timenum = 9;
            }   
            else if(type.equals("tennis")){
                max=6;
                timenum = 9;
            }   
            else if(type.equals("football")){
                max=4;
                timeindex = 1;
                timenum = 4;
            }   
            else if(type.equals("swimming")){
                max=20;
                timeindex = 2;
                timenum = 3;
            }

	    try{

        String s="select count(*) from booking where time = ? and type = '" + type + "' and year = '" 
                    + year +"' and month ='" + month +"' and day = '" + day + "'";
            
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(connectString, "user", "123");
        PreparedStatement stmt=con.prepareStatement(s);

        table.append("<table role=\"grid\">");
        table.append("<thead><tr><th>时间段</th><th>剩余数量</th><th>操作</th></tr></thead>");
        
        for(int i=0;i<timenum;i++){
        table.append("<tr><td>"+timearray[timeindex][i]+"</td>");
        stmt.setString(1, timearray[timeindex][i]);
        ResultSet rs=stmt.executeQuery();
		if(rs.next()) {
            String nums =  rs.getString("count(*)");
            int numi = Integer.valueOf(nums).intValue();
            numi= max - numi;
            nums = String.valueOf(numi);
            table.append("<td>" + nums + "</td>");
            if(numi>0){
                String url = "booking.jsp?type=" + type +"&time="+timearray[timeindex][i]+"&year="+year+"&month="+month+"&day="+day;
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
        msg="请选择场馆类型和日期";
    }
%>

<!DOCTYPE HTML>
<meta charset="UTF-8">
<html>

<head>
    <title>体育场馆在线预约系统</title>
    <base target="_self">
    <%@ include file="common/header.jsp" %>
    <style>
        form{
            float:left;
        }
        table{
            float:right;
            width: 500px;
            
        }
        th,td{
            text-align: center;
        }
        #full{
            color: grey;
        }
        #messagebox{
            text-align: center;
        }
    </style>
</head>

<body>
    <div id="main">
        <div id="mainbody" style="height: 550px;">
        <main class="container">
                <p><h1>在线预约</h1></p>
                <form action="booking-center.jsp" method="post" name="f" id="inputbox">
                    <label>场馆类型</label>
                    <select name="type">
                        <option value="badminton" <%=type.equals("badminton")?"selected":""%>>羽毛球场</option>
                        <option value="basketball" <%=type.equals("basketball")?"selected":""%>>篮球球场</option>
                        <option value="football" <%=type.equals("football")?"selected":""%>>足球场</option>
                        <option value="swimming" <%=type.equals("swimming")?"selected":""%>>游泳馆</option>
                        <option value="table-tennis" <%=type.equals("table-tennis")?"selected":""%>>乒乓球场</option>
                        <option value="tennis" <%=type.equals("tennis")?"selected":""%>>网球场</option>
                     </select>
                     &nbsp;
                    <label>日期</label>
                    <select name="year">
                        <option value="2022"  <%=year.equals("2022")?"selected":""%>>2022年</option>
                     </select>
                     <select name="month">
                        <option value="01" <%=month.equals("01")?"selected":""%>>1月</option>
                        <option value="02" <%=month.equals("02")?"selected":""%>>2月</option>
                        <option value="03" <%=month.equals("03")?"selected":""%>>3月</option>
                        <option value="04" <%=month.equals("04")?"selected":""%>>4月</option>
                        <option value="05" <%=month.equals("05")?"selected":""%>>5月</option>
                        <option value="06" <%=month.equals("06")?"selected":""%>>6月</option>
                        <option value="07" <%=month.equals("07")?"selected":""%>>7月</option>
                        <option value="08" <%=month.equals("08")?"selected":""%>>8月</option>
                        <option value="09" <%=month.equals("09")?"selected":""%>>9月</option>
                        <option value="10" <%=month.equals("10")?"selected":""%>>10月</option>
                        <option value="11" <%=month.equals("11")?"selected":""%>>11月</option>
                        <option value="12" <%=month.equals("12")?"selected":""%>>12月</option>
                     </select>
                     <select name="day">
                        <option value="01" <%=day.equals("01")?"selected":""%>>1日</option>
                        <option value="02" <%=day.equals("02")?"selected":""%>>2日</option>
                        <option value="03" <%=day.equals("03")?"selected":""%>>3日</option>
                        <option value="04" <%=day.equals("04")?"selected":""%>>4日</option>
                        <option value="05" <%=day.equals("05")?"selected":""%>>5日</option>
                        <option value="06" <%=day.equals("06")?"selected":""%>>6日</option>
                        <option value="07" <%=day.equals("07")?"selected":""%>>7日</option>
                        <option value="08" <%=day.equals("08")?"selected":""%>>8日</option>
                        <option value="09" <%=day.equals("09")?"selected":""%>>9日</option>
                        <option value="10" <%=day.equals("10")?"selected":""%>>10日</option>
                        <option value="11" <%=day.equals("11")?"selected":""%>>11日</option>
                        <option value="12" <%=day.equals("12")?"selected":""%>>12日</option>
                        <option value="13" <%=day.equals("13")?"selected":""%>>13日</option>
                        <option value="14" <%=day.equals("14")?"selected":""%>>14日</option>
                        <option value="15" <%=day.equals("15")?"selected":""%>>15日</option>
                        <option value="16" <%=day.equals("16")?"selected":""%>>16日</option>
                        <option value="17" <%=day.equals("17")?"selected":""%>>17日</option>
                        <option value="18" <%=day.equals("18")?"selected":""%>>18日</option>
                        <option value="19" <%=day.equals("19")?"selected":""%>>19日</option>
                        <option value="20" <%=day.equals("20")?"selected":""%>>20日</option>
                        <option value="21" <%=day.equals("21")?"selected":""%>>21日</option>
                        <option value="22" <%=day.equals("22")?"selected":""%>>22日</option>
                        <option value="23" <%=day.equals("23")?"selected":""%>>23日</option>
                        <option value="24" <%=day.equals("24")?"selected":""%>>24日</option>
                        <option value="25" <%=day.equals("25")?"selected":""%>>25日</option>
                        <option value="26" <%=day.equals("26")?"selected":""%>>26日</option>
                        <option value="27" <%=day.equals("27")?"selected":""%>>27日</option>
                        <option value="28" <%=day.equals("28")?"selected":""%>>28日</option>
                        <option value="29" <%=day.equals("29")?"selected":""%>>29日</option>
                        <option value="30" <%=day.equals("30")?"selected":""%>>30日</option>
                        <option value="31" <%=day.equals("31")?"selected":""%>>31日</option>
                     </select>
                     &nbsp;
                     <input name="query" type="submit" value="查询">
                </form> 
                <p id="messagebox"> <%=msg%> </p><br>
                
                <%=table%>
            </main>
        </div>
        <!--mainbody end-->
    </div>
    <!--main end-->

    <%@ include file="common/footer.html" %>
    <!--footer end-->

</body>

</html>
