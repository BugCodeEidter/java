<%--
  Created by IntelliJ IDEA.
  User: HUAWEI
  Date: 2022/7/15
  Time: 22:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>注册页面</title>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <link rel="stylesheet" href="../../css/bootstrap-theme.css">
    <script type="text/javascript">
        var isCommit;
        function myFunctionName(){
            var name=document.getElementById("name").value;
            var repName=new RegExp("^[\u0000-\u00ff]{5,20}$");
            var testName=repName.test(name);
            if(testName){
                document.getElementById("nameSpan").style.color='green';
                document.getElementById("nameSpan").innerText="√ 格式正确";
                isCommit=true;
            }else {
                document.getElementById("nameSpan").style.color='red';
                document.getElementById("nameSpan").innerText="× 格式错误,请输入5到20位的非中文字符";
                isCommit=false;
            }
        }
        function myFunctionPwd(){
            var pwd=document.getElementById("pwd").value;
            var repPwd=new RegExp("^[a-zA-Z]+[^a-zA-Z0-9]+[0-9]+$");
            var testPwd=repPwd.test(pwd);
            if(testPwd){
                if(pwd.length>=6){
                    document.getElementById("pwdSpan").style.color='green';
                    document.getElementById("pwdSpan").innerText="√ 格式正确";
                    isCommit=true;
                }else {
                    document.getElementById("pwdSpan").style.color='red';
                    document.getElementById("pwdSpan").innerText="× 长度不能小于6";
                    isCommit=false;
                }
            }else {
                document.getElementById("pwdSpan").style.color='red';
                document.getElementById("pwdSpan").innerText="× 格式错误,请输入以英文,特殊字符,数字的顺序组合的密码";
                isCommit=false;
            }
        }

        function myFunctionTest(){
            if(isCommit==false){
                alert("请检查数据的输入的格式!");
            }
            return isCommit;
        }
    </script>
</head>
<body>
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
<form class="form-horizontal" action="${pageContext.request.contextPath}/user/register" onsubmit="return myFunctionTest()">
    <div class="form-group">
        <label for="name" class="col-sm-2 control-label">账号:</label>
        <div class="col-sm-10">
            <input type="text" name="username" class="form-control" id="name" onblur="myFunctionName()" placeholder="请输入账号">
            <h4 id="nameSpan"></h4>
        </div>
    </div>
    <div class="form-group">
        <label for="pwd" class="col-sm-2 control-label">密码:</label>
        <div class="col-sm-10">
            <input type="password" name="password" class="form-control" id="pwd" onblur="myFunctionPwd()" placeholder="请输入密码">
            <h4 id="pwdSpan"></h4>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <div class="checkbox">
                <label>
                    <input type="checkbox"> 记住我
                </label>
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default">提交</button>
        </div>
    </div>
</form>
</body>
</html>
