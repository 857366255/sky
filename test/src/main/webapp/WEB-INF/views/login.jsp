<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<html>

<head>
    <title>登录</title>
    <link rel="stylesheet" href="${basePath}/UI/layuiSky/layui/css/layui.css">
</head>
<body>
<form class="layui-form">
    <div class="layui-form-item input-item">
        <label for="userName">用户名</label>
        <input name="userName" type="text" placeholder="请输入用户名" autocomplete="off" id="userName" class="layui-input" lay-verify="user">
    </div>
    <div class="layui-form-item input-item">
        <label for="password">密码</label>
        <input name="password" type="password" placeholder="请输入密码" autocomplete="off" id="password" class="layui-input" lay-verify="pass">
    </div>
    <div class="layui-form-item">
        <button class="layui-btn layui-block" lay-filter="login" lay-submit>登录</button>
    </div>
</form>
<script src="${basePath}/UI/layuiSky/layui/layui.js"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer;
        //自定义验证规则
        form.verify({
            user: function(value){
                if(value.length < 0){
                    return '不为空';
                }
            }
            ,pass: [/(.+){6,20}$/, '密码必须6到20位']
        });

        //监听提交
        form.on('submit(login)', function(data){
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            });
            return false;
        });
    });
</script>
</body>
</html>
