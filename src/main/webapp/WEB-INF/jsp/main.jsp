<%--
  Created by IntelliJ IDEA.
  User: HUAWEI
  Date: 2022/7/13
  Time: 18:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>书籍展示</title>
    <style>
        a{
            text-decoration: none;
            color:black;
            font-size: 18px;
        }
        h3{
            width: 180px;
            height: 38px;
            margin: 100px auto;
            text-align: center;
            line-height: 38px;
            background: deepskyblue;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <h3><a href="${pageContext.request.contextPath}/book/pageBook">进入图书展示页面</a></h3>
</body>
</html>
