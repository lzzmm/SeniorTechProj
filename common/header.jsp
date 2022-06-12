<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"
%><html>
<head>
    <script src="js/menu.js"></script>
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/nav.css">
    <link rel="stylesheet" href="css/subnav.css">
    <link rel="stylesheet" href="css/indexline.css">
    <link rel="stylesheet" href="css/colsleft.css">
    <link rel="stylesheet" href="css/cols02.css">
    <link rel="stylesheet" href="css/quicklinks.css">
    <link rel="stylesheet" href="css/sublinks.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/body.css">
    <link rel="stylesheet" href="css/pico.css">
</head>
<body>
    <div id="header">
        <div id="version">
            <a href="index.jsp">
                <img src="images/header1.png" alt="体育场馆在线预约系统" border="0">
                <!--<h1> 大山中学体育场馆预约系统 </h1>-->
            </a>
        </div>
        <%  String uri=request.getRequestURI();   
            uri=uri.substring(uri.lastIndexOf("/")+1);
            String loginPage = "login.jsp";
            if(!uri.equals(loginPage)) { %>
                <%@ include file="autologin.jsp" %>
        <%  } %>
    </div>
    <!--header end-->

    <div id="nav">
        <a href="index.jsp">
            <span class="sp" id="tag2"
                  onmouseover="switchTag('tag2','subnav2');this.blur();">首页</span>
        </a> |
        <a href="booking-center.jsp">
            <span class="sp" id="tag3"
                  onmouseover="switchTag('tag3','subnav3');this.blur();">预订中心</span>
        </a> |
        <a href="introduction-center.jsp">
            <span class="sp" id="tag5"
                  onmouseover="switchTag('tag5','subnav5');this.blur();">场馆简介</span>
        </a> |
        <a href="announcement.jsp">
            <span class="sp" id="tag6"
                  onmouseover="switchTag('tag6','subnav6');this.blur();">通知公告</span>
        </a> |
        <a href="profile.jsp">
            <span class="sp" id="tag4"
                  onmouseover="switchTag('tag4','subnav4');this.blur();">个人中心</span>
        </a>
    </div>
    <!--nav end-->
</body>
</html>
