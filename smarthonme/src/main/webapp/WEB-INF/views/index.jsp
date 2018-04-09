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
    <title>后台管理 </title>
    <link rel="stylesheet" href="${basePath}/UI/layuiSky/layui/css/layui.css">
    <link rel="stylesheet" href="${basePath}/UI/layuiSky/sky/css/index.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">smarthonme</div>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <%--<li class="layui-nav-item"><a data-url="${basePath}/devicelist/list">设备列表</a></li>--%>
                <li class="layui-nav-item"><a data-url="${basePath}/producttype/list">产品</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div class="layui-tab layui-tab-card" lay-filter="tab" lay-allowclose="true">
            <ul class="layui-tab-title">
                <li class="layui-this" >首页</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">
                    1. 我个人比较喜欢卡片风格的，所以你发现又是以卡片的风格举例
                    2. 删除功能适用于所有风格
                </div>
            </div>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
<script src="${basePath}/UI/layuiSky/layui/layui.js"></script>
<script src="${basePath}/UI/layuiSky/sky/js/index.js"></script>
</body>
</html>