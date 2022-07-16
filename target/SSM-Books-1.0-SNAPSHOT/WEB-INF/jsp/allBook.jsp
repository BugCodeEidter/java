<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HUAWEI
  Date: 2022/7/13
  Time: 18:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>书籍展示</title>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <script>
        function confirmDelete(bookID) {
            if (window.confirm("你确定要删除吗?")) {
                location.href = "${pageContext.request.contextPath}/book/deleteBook/" + bookID;
            }
        }
    </script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="span12">
            <div class="container">
                <div class="row clearfix">
                    <div class="col-md-8 column">
                        <div class="page-header">
                            <h1>
                                <small>书籍列表─────────────显示所有书籍</small>
                            </h1>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row form-inline">
                <div class="col-md-4 column">
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/toAddBook">添加书籍</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a class="btn btn-info" href="${pageContext.request.contextPath}/book/pageBook">查看所有书籍</a>
                </div>
                <div class="col-md-4 column">
                    <form class="form-inline" action="${pageContext.request.contextPath}/book/queryBook" method="post">
                        <div class="form-group">
                            <label class="sr-only" for="exampleInputAmount"></label>
                            <div class="input-group">
                                <div class="input-group-addon">查询书籍:</div>
                                <input type="text" name="queryBookName" class="form-control" id="exampleInputAmount"
                                       placeholder="请输入书名">
                            </div>
                            <input type="hidden" name="currentPage" value="1">
                        </div>
                        <button type="submit" style="width: 80px" class="btn btn-primary">查询</button>
                    </form>
                </div>
            </div>

            <div class="row clearfix">
                <div class="col-md-12 column">
                    <c:if test="${message==false}">
                        <div class="alert alert-danger" role="alert">尊敬的用户,没有你想要查的书籍</div>
                    </c:if>
                    <table class="table table-hover table-striped">
                        <thead>
                        <tr>
                            <th>书籍编号</th>
                            <th>书籍名称</th>
                            <th>书籍数目</th>
                            <th>书籍详情</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="book" items="${bookPage.bookList}">
                            <tr>
                                <td>${book.bookID}</td>
                                <td>${book.bookName}</td>
                                <td>${book.bookCounts}</td>
                                <td>${book.detail}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/book/toUpdateBook?bookID=${book.bookID}"
                                       class="btn btn-primary">修改</a> &nbsp;|&nbsp;
                                    <a href="javascript:confirmDelete(${book.bookID})" class="btn btn-danger">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <c:if test="${message!=false}">
                    <nav aria-label="Page navigation" style="text-align: center">
                        <ul class="pagination pagination-lg">
                            <li class="active">
                                <a href="${pageContext.request.contextPath}/book/pageBook?currentPage=1" aria-label="Previous">
                                    <span aria-hidden="true" >首页</span>
                                </a>
                            </li>
                            <c:if test="${bookPage.currentPage==1}">
                                <li class="disabled">
                                    <a href="${pageContext.request.contextPath}/book/pageBook?currentPage=1" aria-label="Previous">
                                        <span aria-hidden="true" >上一页</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${bookPage.currentPage!=1}">
                                <li>
                                    <a  href="${pageContext.request.contextPath}/book/pageBook?currentPage=${bookPage.currentPage-1}" aria-label="Previous">
                                        <span aria-hidden="true" ><-上一页</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:forEach begin="${bookPage.start}" end="${bookPage.end}" var="i">
                                <c:if test="${bookPage.currentPage==i}">
                                    <li class="active"><a href="${pageContext.request.contextPath}/book/pageBook?currentPage=${i}">${i}</a></li>
                                </c:if>
                                <c:if test="${bookPage.currentPage!=i}">
                                    <li><a href="${pageContext.request.contextPath}/book/pageBook?currentPage=${i}">${i}</a></li>
                                </c:if>
                            </c:forEach>
                            <c:if test="${bookPage.currentPage==bookPage.toTalPage}">
                                <li class="disabled">
                                    <a href="${pageContext.request.contextPath}/book/pageBook?currentPage=${bookPage.toTalPage}" aria-label="Next">
                                        <span aria-hidden="true" >下一页-></span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${bookPage.currentPage!=bookPage.toTalPage}">
                                <li>
                                    <a  href="${pageContext.request.contextPath}/book/pageBook?currentPage=${bookPage.currentPage+1}" aria-label="Next">
                                        <span aria-hidden="true" >下一页-></span>
                                    </a>
                                </li>
                            </c:if>
                            <li class="active">
                                <a  href="${pageContext.request.contextPath}/book/pageBook?currentPage=${bookPage.toTalPage}" aria-label="Next">
                                    <span aria-hidden="true" >尾页</span>
                                </a>
                            </li>
                        </ul>
                        <h1 style="text-align: right">
                            <small>总共${bookPage.toTalPage}页,${bookPage.toTalCounts}条数据,每页${bookPage.rowPage}条数据</small>
                        </h1>
                    </nav>
                </c:if>
            </div>
        </div>
    </div>
</div>

</body>
</html>
