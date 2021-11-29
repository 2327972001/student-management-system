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
<a href="/user/logout" class="btn btn-primary mb-2">退出登录</a>
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
<div id="app">
    <template>
        <el-button type="danger" @click="userListDelete()">批量删除</el-button>
        <el-button type="primary" @click="dialogVisible2 = true">添加用户</el-button>
        <el-table :data="UserListData" style="width: 100%" stripe @selection-change="handleSelectionChange" v-loading="loading" slot="empty" empty-text="暂无数据">
            <el-table-column type="selection" label="多选" align="center"> </el-table-column>
            <el-table-column type="index" label="编号" align="center"> </el-table-column>
            <el-table-column prop="name" label="姓名" align="center"> </el-table-column>
            <el-table-column prop="username" label="用户名" align="center"> </el-table-column>
            <el-table-column prop="sex" label="性别" align="center"> </el-table-column>
            <el-table-column prop="squad" label="班级" align="center"> </el-table-column>
            <el-table-column prop="teacher" label="是否为老师" align="center"> </el-table-column>
            <el-table-column prop="teacher" label="操作" align="center">
                <template slot-scope="scope">
                    <el-button size="mini" @click="userEdit(UserListData[scope.$index].id)">编辑</el-button>
                </template>
            </el-table-column>
        </el-table>

        <el-dialog title="编辑用户" :visible.sync="dialogVisible" width="30%" center>
            <el-form label-width="100px" status-icon :model="updateForm" :rules="updateRules">
                <el-form-item prop="id">
                    <el-input type="hidden" v-model="updateForm.id"></el-input>
                </el-form-item>
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

        <el-dialog title="添加用户" :visible.sync="dialogVisible2" width="30%" center>
            <el-form label-width="100px" status-icon :model="addForm" :rules="updateRules">
                <el-form-item label="姓名" prop="name">
                    <el-input v-model="addForm.name"></el-input>
                </el-form-item>
                <el-form-item label="用户名" prop="username">
                    <el-input v-model="addForm.username"></el-input>
                </el-form-item>
                <el-form-item label="密码" prop="password">
                    <el-input v-model="addForm.password"></el-input>
                </el-form-item>
                <el-form-item label="性别" prop="sex">
                    <el-select v-model="addForm.sex" placeholder="请选择男或女">
                        <el-option label="男" value="男"></el-option>
                        <el-option label="女" value="女"></el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="班级" prop="squad">
                    <el-input v-model="addForm.squad"></el-input>
                </el-form-item>
                <el-form-item label="是否为老师" prop="teacher">
                    <el-select v-model="addForm.teacher" placeholder="请选择是或否">
                        <el-option label="是" value="1"></el-option>
                        <el-option label="否" value="0"></el-option>
                    </el-select>
                </el-form-item>
            </el-form>
            <template slot="footer">
                <span class="dialog-footer">
                  <el-button type="primary" @click="addSubmit('addForm')">添加</el-button>
                </span>
            </template>
        </el-dialog>
    </template>
</div>
<script type="text/javascript">
    new Vue({
        el: '#app',
        data(){
            return{
                UserListData: [],
                dialogVisible: false,
                dialogVisible2: false,
                updateForm:{
                    id: '',
                    name: '',
                    username: '',
                    password: '',
                    sex: '',
                    squad: '',
                    teacher: '',
                },
                updateRules:{
                    name: [{ required: true, message: '请输入姓名', trigger: 'blur' }],
                    username: [{ required: true, message: '请输入用户名', trigger: 'blur' }],
                    password: [{ required: true, message: '请输入密码', trigger: 'blur' }],
                    squad: [{ required: true, message: '请输入班级', trigger: 'blur' }],
                },
                multipleSelection: [],
                deleteUserId: [],
                addForm:{
                    name: '',
                    username: '',
                    password: '',
                    sex: '',
                    squad: '',
                    teacher: '',
                },
                loading: true,
            }
        },
        mounted(){
            this.selectAll();
        },
        methods: {
            selectAll(){
                var _this = this;
                $.ajax({
                    type: "GET",
                    url: "/user/userList",
                    dataType: "json",
                    success: function (ajaxRequest){
                        _this.UserListData = ajaxRequest.data;
                    },
                    error : function() {
                        _this.$message.error('获取数据异常！');
                    }
                });
                _this.loading = false;
            },
            handleSelectionChange(val) {
                var _this = this;
                _this.multipleSelection = val;
            },
            userEdit(val){
                this.dialogVisible = true;
                var _this = this;
                $.ajax({
                    type: "GET",
                    url: "/user/update/"+val,
                    dataType: "json",
                    success: function (ajaxRequest){
                        _this.updateForm = ajaxRequest.data;
                    },
                    error : function() {
                        _this.$message.error('获取数据异常！');
                    }
                });
            },
            updateSubmit(formName){
                var _this = this;
                $.ajax({
                    type: "POST",
                    url: "/user/updateuser",
                    dataType: "json",
                    data: _this.updateForm,
                    success: function (ajaxRequest){
                        if(ajaxRequest.success){
                            _this.selectAll();
                            _this.dialogVisible = false;
                            _this.$message({
                                message: '修改成功！',
                                type: 'success'
                            });
                        }
                    },
                    error : function() {
                        _this.$message.error('修改异常！');
                    }
                });
            },
            userDel(val){
                var _this = this;
                $.ajax({
                    type: "POST",
                    url: "/user/deleteUser",
                    data: {
                        id: val,
                    },
                    dataType: "json",
                    success: function (ajaxRequest){
                        if(ajaxRequest.success){
                            _this.selectAll();
                            _this.$message({
                                message: '删除成功！',
                                type: 'success'
                            });
                        }
                    },
                    error : function() {
                        _this.$message.error('删除异常！');
                    }
                });
            },
            addSubmit(formName){
                var _this = this;
                $.ajax({
                    type: "POST",
                    url: "/user/adduservalue",
                    dataType: "json",
                    data: _this.addForm,
                    success: function (ajaxRequest){
                        if(ajaxRequest.success){
                            _this.selectAll();
                            _this.dialogVisible2 = false;
                            _this.addForm = {
                                name: '',
                                username: '',
                                password: '',
                                sex: '',
                                squad: '',
                                teacher: '',
                            };
                            _this.$message({
                                message: '添加成功！',
                                type: 'success'
                            });
                        }
                    },
                    error : function() {
                        _this.$message.error('添加异常！');
                    }
                });
            },
            userListDelete(){
                var _this = this;
                for (let i = 0; i < this.multipleSelection.length; i++) {
                    this.deleteUserId[i] = this.multipleSelection[i].id;
                }
                $.ajax({
                    type: "POST",
                    url: "/user/deleteUserList",
                    traditional: true,
                    data: {
                        "deletelist": _this.deleteUserId,
                    },
                    dataType:"json",
                    success: function (ajaxRequest){
                        if(ajaxRequest.success){
                            _this.selectAll();
                            _this.$message({
                                message: '删除成功！',
                                type: 'success'
                            });
                        }
                    },
                    error : function() {
                        _this.$message.error('删除异常！');
                    }
                });
            },
        }
    });
</script>
</body>
</html>
