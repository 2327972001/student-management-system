<%--
  Created by IntelliJ IDEA.
  User: ZouYangMing
  Date: 2021-11-10
  Time: 21:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.css" rel="stylesheet">
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>序号</th>
                        <th>用户名</th>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>班级</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${userList}" var="user">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.username}</td>
                        <td>${user.name}</td>
                        <td>${user.sex}</td>
                        <td>${user.squad}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/user/deleteUser/${user.id}">删除</a>
                            <a href="${pageContext.request.contextPath}/user/update/${user.id}">修改</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <a href="javascript:window.history.go(-1);"><button type="button" class="btn btn-primary">返回</button></a>
        </div>
    </div>
</div>
</body>
</html>
