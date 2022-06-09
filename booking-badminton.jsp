<%@ page language="java" import="java.util.*" 
         contentType="text/html; charset=utf-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%
	String msg = "";
    String year = "";
    String month  = "";
    String day = "";

    String connectString = "jdbc:mysql://172.18.187.253:3306/boke19335016"
    + "?autoReconnect=true&useUnicode=true"
    + "&characterEncoding=UTF-8"; 

    StringBuilder table=new StringBuilder("");

		
	if(request.getParameter("query") != null){

        year = request.getParameter("year");
        if (year == null) {
            year="";
        } 
        month = request.getParameter("month");
        if (month == null) {
            month="";
        }
        day = request.getParameter("day");
        if (day == null) {
            day="";
        }

	try{
		//Class.forName("com.mysql.jdbc.Driver");
		//Connection con=DriverManager.getConnection(connectString, 
        //                "user", "123");
		//Statement stmt=con.createStatement();

        table.append("<table border= '1'><caption>羽毛球场预约 &nbsp;"+year+"年"+month+"月"+day+"日</caption>");
        table.append("<tr><th>时间段</th><th>剩余数量</th><th>操作</th></tr>");
        table.append("<tr><td>10:00 - 11:00</td>");

		String s="select 10 - count(*) from booking where time = '10001100' and type = 'badminton' and year = '" 
            + year +"' and month ='" + month +"' and day = '" + day + "'";

		//ResultSet rs=stmt.executeQuery(s);

		//if(rs.next()) {
            //String nums =  rs.getString("count(*)");
            String nums ="0";
			table.append("<td>" + nums + "</td>");
            int numi = Integer.valueOf(nums).intValue();
            if(numi>0){
                String url = "booking.jsp?type=badminton&time=10001100&year="+year+"&month="+month+"&day="+day;
                table.append("<td><a href='" + url + "'>点击预约</a> </td></tr>");
            }
            else{
                table.append("<td id ='full'> 位置已满 </td></tr>");
            }


		//}
	    table.append("</table>");

	    //rs.close();
	    //stmt.close();
	    //con.close();
	}
	catch (Exception e){
	    msg = e.getMessage();
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
        table {
            /* border-collapse: collapse */
            border-color: #FFFFFF;
            color: #FFF;
            margin: 0 auto;
        }

        td,
        th {
            height: 40px;
            width: 240px;
            text-align: center
        }

        caption {
            font-size: 20px;
            font-weight: bold;
        }

        p {
            margin: 0px;
            padding: 0px;
        }

        a{
            color: #FFF;
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

        #indexline{
            margin:auto;
            color: #FFF;
        }
        
        #full{
            color: gray;
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
        <a href="profile.html"><span class="sp" id="tag4"
                onmouseover="switchTag('tag4','subnav4');this.blur();">个人中心</span></a>
    </div>
    <!--nav end-->


    <div id="main">
        <div id="mainbody" style="height: 550px;">
            <div id="indexline" style="height: 550px; ">
                <form action="booking-badminton.jsp" method="post" name="f">
                    <label> &nbsp; 预约日期: &nbsp; </label>
                    <select name="year">
                        <option value="2022"  <%=month.equals("2022")?"selected":""%>>2022</option>
                     </select>
                     年 &nbsp;
                     <select name="month">
                        <option value="1" <%=month.equals("1")?"selected":""%>>1</option>
                        <option value="2" <%=month.equals("2")?"selected":""%>>2</option>
                        <option value="3" <%=month.equals("3")?"selected":""%>>3</option>
                        <option value="4" <%=month.equals("4")?"selected":""%>>4</option>
                        <option value="5" <%=month.equals("5")?"selected":""%>>5</option>
                        <option value="6" <%=month.equals("6")?"selected":""%>>6</option>
                        <option value="7" <%=month.equals("7")?"selected":""%>>7</option>
                        <option value="8" <%=month.equals("8")?"selected":""%>>8</option>
                        <option value="9" <%=month.equals("9")?"selected":""%>>9</option>
                        <option value="10" <%=month.equals("10")?"selected":""%>>10</option>
                        <option value="11" <%=month.equals("11")?"selected":""%>>11</option>
                        <option value="12" <%=month.equals("12")?"selected":""%>>12</option>
                     </select>
                     月 &nbsp;
                     <select name="day">
                        <option value="1" <%=day.equals("1")?"selected":""%>>1</option>
                        <option value="2" <%=day.equals("2")?"selected":""%>>2</option>
                        <option value="3" <%=day.equals("3")?"selected":""%>>3</option>
                        <option value="4" <%=day.equals("4")?"selected":""%>>4</option>
                        <option value="5" <%=day.equals("5")?"selected":""%>>5</option>
                        <option value="6" <%=day.equals("6")?"selected":""%>>6</option>
                        <option value="7" <%=day.equals("7")?"selected":""%>>7</option>
                        <option value="8" <%=day.equals("8")?"selected":""%>>8</option>
                        <option value="9" <%=day.equals("9")?"selected":""%>>9</option>
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
                        <option value="18" <%=day.equals("25")?"selected":""%>>25</option>
                        <option value="19" <%=day.equals("26")?"selected":""%>>26</option>
                        <option value="20" <%=day.equals("27")?"selected":""%>>27</option>
                        <option value="21" <%=day.equals("28")?"selected":""%>>28</option>
                        <option value="22" <%=day.equals("29")?"selected":""%>>29</option>
                        <option value="23" <%=day.equals("30")?"selected":""%>>30</option>
                        <option value="24" <%=day.equals("31")?"selected":""%>>31</option>
                     </select>
                     日 &nbsp;
                     <input name="query" type="submit" value="查询">
                </form> 
                <%=msg%>
                <%=table%>

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
