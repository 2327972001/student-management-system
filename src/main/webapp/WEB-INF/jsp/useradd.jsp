<%--
  User: ZouYangMing
  Date: 2021-11-11
  Time: 15:03
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@ include file="header.jsp" %>
</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-4">
            <form>
                <div class="form-group">
                    <label>姓名:</label>
                    <input type="text" class="form-control" id="user_name" value="">
                </div>
                <div class="form-group">
                    <label>用户名:</label>
                    <input type="text" class="form-control" id="user_username" value="">
                </div>
                <div class="form-group">
                    <label>密码:</label>
                    <input type="text" class="form-control" id="user_password" value="">
                </div>
                <div class="form-group">
                    <label>性别:</label>
                    <input type="text" class="form-control" id="user_sex" value="">
                </div>
                <div class="form-group">
                    <label>班级:</label>
                    <input type="text" class="form-control" id="user_squad" value="">
                </div>
                <div class="form-group">
                    <label>是否为老师:</label>
                    <select class="form-control" id="user_teacher">
                        <option value="1">是</option>
                        <option value="0">否</option>
                    </select>
                </div>
                <input type="button" id="user_submit" class="btn btn-primary" value="增加">
                <a href="javascript:window.history.go(-1);"><button type="button" class="btn btn-primary">返回</button></a>
            </form>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $("#user_submit").click(function () {
        $.ajax({
            type: "POST",
            url: "/user/adduservalue",
            dataType: "json",
            data: {
                name: $("#user_name").val(),
                username: $("#user_username").val(),
                password: $("#user_password").val(),
                sex: $("#user_sex").val(),
                squad: $("#user_squad").val(),
                teacher: $("#user_teacher").val()
            },
            success: function (ajaxRequest){
                if(ajaxRequest.success){
                    layer.msg("添加成功！",{icon:6,time:3000},function (){
                        location.href="/user/list";
                    });
                }
            },
            error : function() {
                layer.msg("添加异常！");
            }
        });
    });
</script>
</html>
