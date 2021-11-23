<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <%@ include file="header.jsp" %>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-4">
            <form>
                <div class="form-group">
                    <label>用户名:</label>
                    <input type="text" class="form-control" id="user_username">
                </div>
                <div class="form-group">
                    <label>密码:</label>
                    <input type="password" class="form-control" id="user_password">
                </div>
                <button type="button" id="login_submit" class="btn btn-primary">登录</button>
            </form>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $("#login_submit").click(function () {
        $.ajax({
            type: "POST",
            url: "/user/logins",
            dataType: "json",
            data: {
                username: $("#user_username").val(),
                password: $("#user_password").val()
            },
            success: function (ajaxRequest){
                if(ajaxRequest.success){
                    layer.msg("登录成功！",{icon:6,time:3000},function (){
                        location.href="/user/list";
                    });
                }else{
                    layer.msg("用户名或密码错误！",{icon:5,time:3000});
                }
            },
            error : function() {
                layer.msg("登录异常！");
            }
        });
    });
</script>
</html>
