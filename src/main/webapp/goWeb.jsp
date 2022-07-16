<%--
  Created by IntelliJ IDEA.
  User: HUAWEI
  Date: 2022/7/15
  Time: 22:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>主页面</title>
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <link href="./css/bootstrap-theme.css" rel="stylesheet">
    <link href="./css/bootstrap-theme.min.css" rel="stylesheet">
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
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">
            <div class="container">
                <div class="row clearfix">
                    <div class="col-md-12 column">
                        <div class="page-header">
                            <h1>
                                <small>欢迎来到书籍管理系统</small>
                            </h1>
                        </div>
                    </div>
                </div>
            </div>
            <h3>
                <a style="text-decoration: none" href="${pageContext.request.contextPath}/user/goUserLogin">管理员登录</a>
            </h3>
            <h3>
                <a style="text-decoration: none" href="${pageContext.request.contextPath}/user/goUserRegister">管理员信息注册</a>
            </h3>
        </div>
    </div>
</div>

</body>
</html>
