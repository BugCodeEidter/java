<%--
  Created by IntelliJ IDEA.
  User: HUAWEI
  Date: 2022/7/14
  Time: 23:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="../../css/bootstrap.min.css"/>
    <style>
        input{
            width: 300px;
        }
        .btn-group{
            position: relative;
            left: 400px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="page-header">
                    <h1>
                        <small>新添书籍</small>
                    </h1>
                </div>
            </div>
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/book/addBook" method="post">
        <div class="input-group">
            <span class="input-group-addon" id="basic-addon1">书籍名称:</span>
            <input type="text" name="bookName" class="form-control" placeholder="请输入书籍名称" aria-describedby="basic-addon1" required>
        </div>
        <h1></h1>
        <div class="input-group">
            <span class="input-group-addon" id="basic-addon2">书籍数量:</span>
            <input type="text" name="bookCounts" class="form-control" placeholder="请输入书籍数量" aria-describedby="basic-addon1" required>
        </div>
        <h1></h1>
        <div class="input-group">
            <span class="input-group-addon" id="basic-addon3">书籍详情:</span>
            <input type="text" name="detail" class="form-control" placeholder="请输入书籍的简略" aria-describedby="basic-addon1" required>
        </div>
        <h1></h1>
        <div class="btn-group" role="group" aria-label="...">
            <input type="submit" class="btn btn-primary" value="提交"/>
        </div>
    </form>

</body>
</html>
