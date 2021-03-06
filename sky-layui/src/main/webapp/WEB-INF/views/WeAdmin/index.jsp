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
    <title>后台管理-WeAdmin Frame型后台管理系统-WeAdmin 1.0</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/UI/test/WeAdmin/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/UI/test/WeAdmin/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/UI/test/WeAdmin/static/css/weadmin.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/UI/test/WeAdmin/lib/layui/layui.js" charset="utf-8"></script>
</head>
<body>
<!-- 顶部开始 -->
<div class="container">
    <div class="logo">
        <a href="${pageContext.request.contextPath}/UI/test/WeAdmin/index.html">WeAdmin v1.0</a>
    </div>
    <div class="left_open">
        <i title="展开左侧栏" class="iconfont">&#xe699;</i>
    </div>
    <ul class="layui-nav left fast-add" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;">+新增</a>
            <dl class="layui-nav-child">
                <!-- 二级菜单 -->
                <dd>
                    <a onclick="WeAdminShow('资讯','https://www.youfa365.com/')"><i class="iconfont">&#xe6a2;</i>资讯</a>
                </dd>
                <dd>
                    <a onclick="WeAdminShow('图片','http://www.baidu.com')"><i class="iconfont">&#xe6a8;</i>图片</a>
                </dd>
                <dd>
                    <a onclick="WeAdminShow('用户','https://www.youfa365.com/')"><i class="iconfont">&#xe6b8;</i>用户</a>
                </dd>
            </dl>
        </li>
    </ul>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;">Admin</a>
            <dl class="layui-nav-child">
                <!-- 二级菜单 -->
                <dd>
                    <a onclick="WeAdminShow('个人信息','http://www.baidu.com')">个人信息</a>
                </dd>
                <dd>
                    <a onclick="WeAdminShow('切换帐号','./login.html')">切换帐号</a>
                </dd>
                <dd>
                    <a class="loginout" href="${pageContext.request.contextPath}/UI/test/WeAdmin/login.html">退出</a>
                </dd>
            </dl>
        </li>
        <li class="layui-nav-item to-index">
            <a href="/">前台首页</a>
        </li>
    </ul>

</div>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6b8;</i>
                    <cite>基本页面</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="${pageContext.request.contextPath}/TestWeAdmin/list">
                            <%--<i class="iconfont">&#xe6a7;</i>--%>
                            <cite>列表</cite>
                        </a>
                    </li>
                    <%--<li>
                        <a _href="${pageContext.request.contextPath}/UI/test/WeAdmin/pages/member/del.html">
                            &lt;%&ndash;<i class="iconfont">&#xe6a7;</i>&ndash;%&gt;
                            <cite>会员删除</cite>
                        </a>
                    </li>--%>

                </ul>
            </li>
        </ul>
    </div>
</div>
<!-- <div class="x-slide_left"></div> -->
<!-- 左侧菜单结束 -->
<!-- 右侧主体开始 -->
<div class="page-content">
    <div class="layui-tab tab" lay-filter="wenav_tab" id="WeTabTip"  lay-allowclose="true">
        <ul class="layui-tab-title">
            <li>我的桌面</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='${pageContext.request.contextPath}/UI/test/WeAdmin/pages/welcome.html' frameborder="0" scrolling="yes" class="weIframe"></iframe>
            </div>
        </div>
    </div>
</div>
<div class="page-content-bg"></div>
<!-- 右侧主体结束 -->
<!-- 中部结束 -->
<!-- 底部开始 -->
<div class="footer">
    <div class="copyright">Copyright ©2018 WeAdmin v1.0 All Rights Reserved</div>
</div>
<!-- 底部结束 -->
<script type="text/javascript">
    layui.config({
        base: '${pageContext.request.contextPath}/UI/test/WeAdmin/static/js/'
        ,version: '101100'
    }).use('admin');
</script>
</body>
<!--Tab菜单右键弹出菜单-->
<ul class="rightMenu" id="rightMenu">
    <li data-type="fresh">刷新</li>
    <li data-type="current">关闭当前</li>
    <li data-type="other">关闭其它</li>
    <li data-type="all">关闭所有</li>
</ul>

</html>