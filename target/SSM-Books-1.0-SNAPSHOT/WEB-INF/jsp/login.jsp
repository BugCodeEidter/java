<%--
  Created by IntelliJ IDEA.
  User: HUAWEI
  Date: 2022/7/15
  Time: 7:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>管理员登录</title>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <script src="../../js/jQuery-3.6.0.js"></script>
    <script>
        function checkName() {
            var username = document.getElementById("username").value;
            var user={
                username:username,
                password:""
            }
            var strJson = JSON.stringify(user);
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/user/checkName",
                data:strJson,
                dataType:"json",
                contentType:"application/json;charset=UTF-8",
                success:function (data) {
                    var usernameTest = document.getElementById("usernameTest");
                    if(data=="√用户存在"){
                        usernameTest.innerHTML=data;
                        usernameTest.style.color="green";
                    }else {
                        usernameTest.innerHTML=data;
                        usernameTest.style.color="red";
                    }
                }
            })
        }
    </script>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-8 column">
            <div class="page-header">
                <h1>
                    <small>登录界面</small>
                </h1>
            </div>
        </div>
    </div>
</div>
<form  action="${pageContext.request.contextPath}/user/userLogin" method="post">
    <div class="form-group">
        <label for="username">账号:</label>
        <input type="text" name="username" class="form-control" id="username" aria-describedby="emailHelp" onblur="checkName()" placeholder="请输入账号">
        <h4 id="usernameTest" class="form-text text-muted"></h4>
    </div>
    <div class="form-group">
        <label for="password">密码:</label>
        <input type="password" name="password" class="form-control" id="password" placeholder="请输入密码">
    </div>
    <button type="submit" class="btn btn-primary">登录</button>
</form>
<div class="alert alert-warning alert-dismissible" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <strong>${message}</strong>
</div>

</body>
</html>
