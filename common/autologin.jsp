<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"
%><%if(session.getAttribute("userid") == null) { %>
    <div id="loginbutton">
        <a href="login.jsp" target="_self" role="button"> 登录 </a>
    </div>
    <% } else { %>
    <div id="searchbox" style = "width: 200px; font-size: 18px; color: #FFFFFF;">
        欢迎您, <text style = "font-size: 20px;"><%=session.getAttribute("username")%></text> &nbsp;
    <form action="index.jsp" method="post" style = "float: right">
        <button name="logout" type="submit" id="logout">注销</button>
    </form>
    </div>
<% } %>