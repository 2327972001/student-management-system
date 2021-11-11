<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.css" rel="stylesheet">
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-4">
            <form action="/user/login" method="post">
                <div class="form-group">
                    <label>用户名:</label>
                    <input type="text" class="form-control" name="username">
                </div>
                <div class="form-group">
                    <label>密码:</label>
                    <input type="password" class="form-control" name="password">
                </div>
                <button type="submit" class="btn btn-primary">登录</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
