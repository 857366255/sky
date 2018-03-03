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

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登入</title>
    <link rel="shortcut icon" href="${basePath}/resources/sky/favicon.ico">
    <link href="${basePath}/resources/sky/css/bootstrap.min.css" rel="stylesheet">
    <link href="${basePath}/resources/sky/css/font-awesome.min.css" rel="stylesheet">
    <link href="${basePath}/resources/sky/css/animate.min.css" rel="stylesheet">
    <link href="${basePath}/resources/sky/css/style.min.css" rel="stylesheet">
    <link href="${basePath}/resources/sky/css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <script>if(window.top !== window.self){ window.top.location = window.location;}</script>
<body class="gray-bg">

<div class="middle-box text-center loginscreen  animated fadeInDown">
    <div>
        <div>

            <h1 class="logo-name">Sky</h1>

        </div>
        <h3>欢迎使用 Sky</h3>
        <form class="m-t" role="form" method="post" action="login">
            <div class="form-group">
                <input type="text" name="username" class="form-control" placeholder="用户名" required="">
            </div>
            <div class="form-group">
                <input type="password" name="password" class="form-control" placeholder="密码" required="">
            </div>
            <button type="submit" class="btn btn-primary block full-width m-b">登 录</button>


            <%--<p class="text-muted text-center"> <a href="login.html#"><small>忘记密码了？</small></a> | <a href="register.html">注册一个新账号</a>--%>
            </p>

        </form>
    </div>
</div>
<script src="${basePath}/resources/sky/js/jquery.min.js?v=2.1.4"></script>
<script src="${basePath}/resources/sky/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${basePath}/resources/sky/js/plugins/toastr/toastr.min.js"></script>
<script src="${basePath}/resources/sky/js/sky/toastrInit.js"></script>

<script>

    $(function(){
        toastr["${toastrType}"]("${toastrMessage}", "${toastrTitle}");
    });
</script>
</body>

</html>
