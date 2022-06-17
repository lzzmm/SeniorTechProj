<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"
%><!DOCTYPE HTML>
<meta charset="UTF-8">
<html>

<head>
    <title>场馆简介</title>
    <base target="_self">
    <%@ include file="common/header.jsp" %>
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
    </style>
</head>

<body link="#FFFFFF" alink="FFFFFF" vlink="FFFFFF">
    <div id="main">
        <div id="mainbody">
            <div id="indexline" style="height: 400px;">
                <table border="1">
                    <caption>场馆简介</caption>
                    <thead>
                        <tr>
                            <th>场馆</th>
                            <th>场馆简介</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>羽毛球场</td>
                            <td><a href="introduction-badminton.html">点此查看</a></td>
                        </tr>

                        <tr>
                            <td>篮球场</td>
                            <td><a href="introduction-basketball.html">点此查看</a></td>
                        </tr>

                        <tr>
                            <td>乒乓球场</td>
                            <td><a href="introduction-table-tennis.html">点此查看</a></td>
                        </tr>

                        <tr>
                            <td>游泳馆</td>
                            <td><a href="introduction-swimming.html">点此查看</a></td>
                        </tr>
                        <tr>
                            <td>足球场</td>
                            <td><a href="introduction-football.html">点此查看</a></td>
                        </tr>

                        <tr>
                            <td>网球场</td>
                            <td><a href="introduction-tennis.html">点此查看</a></td>
                        </tr>

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