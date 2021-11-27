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
    <title>用户列表</title>
    <%@ include file="header.jsp" %>
</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <a href="/user/logout" class="btn btn-primary mb-2">退出登录</a>
            <a href="/user/adduser" class="btn btn-primary mb-2">增加</a>
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
            <form action="/user/showuser" method="post">
                <div class="custom-control-inline mr-0">
                    <select class="form-control" name="type">
                        <option value="0" selected>请选择您要查询的类型</option>
                        <option value="1">查序号</option>
                        <option value="2">查姓名</option>
                        <option value="3">查用户名</option>
                        <option value="4">查性别</option>
                        <option value="5">查班级</option>
                    </select>
                </div>
                <div class="custom-control-inline mr-0">
                    <input type="text" class="form-control" name="value" value="">
                </div>
                <div class="custom-control-inline">
                    <input type="submit" class="btn btn-primary" value="查询">
                </div>
            </form>
        </div>
    </div>
</div>
<div id="app">
    <template>
        <el-table :data="UserListData" style="width: 100%" stripe>
            <el-table-column prop="name" label="姓名" align="center"> </el-table-column>
            <el-table-column prop="username" label="用户名" align="center"> </el-table-column>
            <el-table-column prop="sex" label="性别" align="center"> </el-table-column>
            <el-table-column prop="squad" label="班级" align="center"> </el-table-column>
            <el-table-column prop="teacher" label="是否为老师" align="center"> </el-table-column>
            <el-table-column prop="teacher" label="操作" align="center">
                <el-button size="mini" @click="dialogVisible = true">编辑</el-button>
                <el-button size="mini" type="danger" @click="handleDelete(scope.$index, scope.row)">删除</el-button>
            </el-table-column>
        </el-table>

        <el-dialog :data="UserListData" title="编辑用户" :visible.sync="dialogVisible" width="30%" center>
            <el-form label-width="100px" status-icon :model="updateForm" :rules="updateRules">
                <el-form-item label="姓名" prop="name">
                    <el-input v-model="updateForm.name"></el-input>
                </el-form-item>
                <el-form-item label="用户名" prop="username">
                    <el-input v-model="updateForm.username"></el-input>
                </el-form-item>
                <el-form-item label="密码" prop="password">
                    <el-input v-model="updateForm.password"></el-input>
                </el-form-item>
                <el-form-item label="性别" prop="sex">
                    <el-select v-model="updateForm.sex" placeholder="请选择男或女">
                        <el-option label="男" value="男"></el-option>
                        <el-option label="女" value="女"></el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="班级" prop="squad">
                    <el-input v-model="updateForm.squad"></el-input>
                </el-form-item>
                <el-form-item label="是否为老师" prop="teacher">
                    <el-select v-model="updateForm.teacher" placeholder="请选择是或否">
                        <el-option label="是" value="1"></el-option>
                        <el-option label="否" value="0"></el-option>
                    </el-select>
                </el-form-item>
            </el-form>
            <template slot="footer">
                <span class="dialog-footer">
                  <el-button type="primary" @click="updateSubmit('updateForm')">修改</el-button>
                </span>
            </template>
        </el-dialog>
    </template>
</div>
<script type="text/javascript">
    new Vue({
        el: '#app',
        mounted(){
            var _this = this;
            $.ajax({
                type: "GET",
                url: "/user/userList",
                dataType: "json",
                data: this.loginForm,
                success: function (ajaxRequest){
                    _this.UserListData = ajaxRequest.data;
                },
                error : function() {
                    layer.msg("获取数据异常！");
                }
            });
            //修改 未完成
            $.ajax({
                type: "GET",
                url: "/user/update/1",
                dataType: "json",
                data: this.loginForm,
                success: function (ajaxRequest){
                    _this.UserListData = ajaxRequest.data;
                },
                error : function() {
                    layer.msg("获取数据异常！");
                }
            });
        },
        data(){
            return{
                UserListData: [],
                dialogVisible: false,
                updateForm:{
                    name: '',
                    username: '',
                    password: '',
                    sex: '',
                    squad: '',
                    teacher: '',
                },
                updateRules:{
                    name: [
                        { required: true, message: '请输入姓名', trigger: 'blur' },
                    ],
                    username: [
                        { required: true, message: '请输入用户名', trigger: 'blur' },
                    ],
                    password: [
                        { required: true, message: '请输入密码', trigger: 'blur' },
                    ],
                    squad: [
                        { required: true, message: '请输入班级', trigger: 'blur' },
                    ],
                },
            }
        }
    });
</script>
</body>
</html>
