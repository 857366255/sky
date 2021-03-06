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
    <title>后台管理 </title>
    <link rel="stylesheet" href="${basePath}/UI/layuiSky/layui/css/layui.css">
    <link rel="stylesheet" href="${basePath}/UI/layuiSky/sky/css/index.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">admin 后台管理</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <%--<ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="javascript:;">控制台</a></li>
            <li class="layui-nav-item"><a href="javascript:;">商品管理</a></li>
            <li class="layui-nav-item"><a href="javascript:;">用户</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;">邮件管理</a></dd>
                    <dd><a href="javascript:;">消息管理</a></dd>
                    <dd><a href="javascript:;">授权管理</a></dd>
                </dl>
            </li>
        </ul>--%>
       <%-- <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    贤心
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;">基本资料</a></dd>
                    <dd><a href="javascript:;">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="javascript:;">退了</a></li>
        </ul>--%>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item"><a data-url="${basePath}/devicetype/list">设备类型(完成)</a></li>
                <li class="layui-nav-item"><a data-url="${basePath}/section/list">工段(完成)</a></li>
                <li class="layui-nav-item"><a data-url="${basePath}/process/list">工序(完成)</a></li>
                <li class="layui-nav-item"><a data-url="${basePath}/supplies/list">物资(完成)</a></li>
                <li class="layui-nav-item"><a data-url="${basePath}/bom/list">BOM(完成)</a></li>
                <li class="layui-nav-item"><a data-url="${basePath}/bomdetail/list">Bom明细(完成)</a></li>
                <li class="layui-nav-item"><a data-url="${basePath}/suppliesprocess/list">产品工艺(完成)</a></li>
                <li class="layui-nav-item"><a data-url="${basePath}/devicecapacitydetail/list">设备产能明细(完成)</a></li>
                <li class="layui-nav-item"><a data-url="${basePath}/production/list">生产单(完成)</a></li>
                <li class="layui-nav-item"><a data-url="${basePath}/processflow/list">工艺流程(未完成)</a></li>
                <%--<li class="layui-nav-item"><a data-url="${basePath}/personnel/list">人员(未完成)</a></li>
                <li class="layui-nav-item"><a data-url="${basePath}/schedule/list">日程安排(未完成)</a></li>--%>
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