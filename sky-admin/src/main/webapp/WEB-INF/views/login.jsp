<%--
  Created by IntelliJ IDEA.
  User: wz
  Date: 2017/10/16
  Time: 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<html>

<head>
    <title>登录</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="icon" href="${basePath}/resources/layuicms2.0/favicon.ico">
    <link rel="stylesheet" href="${basePath}/resources/layuicms2.0/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="${basePath}/resources/layuicms2.0/css/public.css" media="all" />
</head>
<body class="loginBody">

<form class="layui-form" method="post" action="login">
    <div class="login_face"><img src="${basePath}/resources/layuicms2.0/images/face.jpg" class="userAvatar"></div>
    <div class="layui-form-item input-item">
        <label for="userName">用户名</label>
        <input type="text" placeholder="请输入用户名" autocomplete="off" id="userName" name="username" class="layui-input" lay-verify="required">
    </div>
    <div class="layui-form-item input-item">
        <label for="password">密码</label>
        <input type="password" placeholder="请输入密码" autocomplete="off" id="password" name="password" class="layui-input" lay-verify="required">
    </div>
    <%--<div class="layui-form-item input-item" id="imgCode">
        <label for="code">验证码</label>
        <input type="text" placeholder="请输入验证码" autocomplete="off" id="code" class="layui-input">
        <img src="${basePath}/resources/layuicms2.0/images/code.jpg">
    </div>--%>
    <div class="layui-form-item">
        <button type="submit" class="layui-btn layui-block" lay-filter="login" lay-submit>登录</button>
    </div>
    <%--<div class="layui-form-item layui-row">
        <a href="javascript:;" class="seraph icon-qq layui-col-xs4 layui-col-sm4 layui-col-md4 layui-col-lg4"></a>
        <a href="javascript:;" class="seraph icon-wechat layui-col-xs4 layui-col-sm4 layui-col-md4 layui-col-lg4"></a>
        <a href="javascript:;" class="seraph icon-sina layui-col-xs4 layui-col-sm4 layui-col-md4 layui-col-lg4"></a>
    </div>--%>
</form>
<script type="text/javascript" src="${basePath}/resources/layuicms2.0/layui/layui.js"></script>
<script type="text/javascript" src="${basePath}/resources/layuicms2.0/page/login/login.js"></script>
<script type="text/javascript" src="${basePath}/resources/layuicms2.0/js/cache.js"></script>
</body>
</html>
