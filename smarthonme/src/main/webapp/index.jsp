<%--
  Created by IntelliJ IDEA.
  User: wz
  Date: 2017/10/16
  Time: 9:26
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<html>

<head>
    <title>TEST</title>
    <link rel="stylesheet" href="${basePath}/UI/layuiSky/layui/css/layui.css" media="all">
</head>
<body>
    <li>
        <ul><a href="${basePath}/index">登入</a></ul>
    </li>
</body>
<script src="${basePath}/UI/layuiSky/layui/layui.js" charset="utf-8"></script>
</html>