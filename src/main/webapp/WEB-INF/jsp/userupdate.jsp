<%--
  Created by IntelliJ IDEA.
  User: ZouYangMing
  Date: 2021-11-11
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.css" rel="stylesheet">
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-4">
            <form action="/user/updateuser/${user.id}" method="post">
                <div class="form-group">
                    <label>姓名:</label>
                    <input type="text" class="form-control" name="name" value="${user.name}">
                </div>
                <div class="form-group">
                    <label>用户名:</label>
                    <input type="text" class="form-control" name="username" value="${user.username}">
                </div>
                <div class="form-group">
                    <label>密码:</label>
                    <input type="text" class="form-control" name="password" value="${user.password}">
                </div>
                <div class="form-group">
                    <label>性别:</label>
                    <input type="text" class="form-control" name="sex" value="${user.sex}">
                </div>
                <div class="form-group">
                    <label>班级:</label>
                    <input type="text" class="form-control" name="squad" value="${user.squad}">
                </div>
                <button type="submit" class="btn btn-primary">修改</button>
                <a href="javascript:window.history.go(-1);"><button type="button" class="btn btn-primary">返回</button></a>
            </form>
        </div>
    </div>
</div>
</body>
</html>
