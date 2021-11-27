<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <%@ include file="header.jsp" %>
</head>
<body>
<div id="app">
    <template>
        <el-row>
            <el-col span="4" offset="10">
                <!--登录-->
                <el-form label-width="80px" status-icon :model="loginForm" :rules="loginRules">
                    <el-form-item label="用户名" prop="username">
                        <el-input v-model="loginForm.username"></el-input>
                    </el-form-item>
                    <el-form-item label="密码" prop="password">
                        <el-input v-model="loginForm.password"></el-input>
                    </el-form-item>
                    <el-form-item>
                        <el-button type="primary" @click="loginSubmit('loginForm')">登录</el-button>
                    </el-form-item>
                </el-form>
            </el-col>
        </el-row>
    </template>
</div>
</body>
<script type="text/javascript">
    new Vue({
        el: "#app",
        data(){
            return{
                loginForm:{
                    username: '',
                    password: '',
                },
                loginRules: {
                    username: [
                        {
                            required: true,
                            message: '请输入用户名',
                            trigger: 'blur',
                        },
                        {
                            min: 6,
                            max: 16,
                            message: '长度在 6 到 16 个字符',
                            trigger: 'blur',
                        },
                    ],
                    password: [
                        {
                            required: true,
                            message: '请输入密码',
                            trigger: 'blur',
                        },
                        {
                            min: 6,
                            max: 16,
                            message: '长度在 6到16个字符',
                            trigger: 'blur',
                        }
                    ],
                }
            }
        },
        methods:{
            loginSubmit(formName){
                $.ajax({
                    type: "POST",
                    url: "/user/logins",
                    dataType: "json",
                    data: this.loginForm,
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
            }
        },
    });
</script>
</html>
