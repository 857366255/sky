<%--
  Created by IntelliJ IDEA.
  User: wz
  Date: 2017/10/18
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>后台管理框架 - 主页</title>

    <meta name="keywords" content="搜索,查询">
    <meta name="description" content="介绍">

    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="${basePath}/resources/sky/favicon.ico">
    <link href="${basePath}/resources/sky/css/bootstrap.min.css" rel="stylesheet">
    <link href="${basePath}/resources/sky/css/font-awesome.min.css" rel="stylesheet">
    <link href="${basePath}/resources/sky/css/animate.min.css" rel="stylesheet">
    <link href="${basePath}/resources/sky/css/style.css" rel="stylesheet">
    <link href="${basePath}/resources/sky/css/plugins/toastr/toastr.min.css" rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="nav-close"><i class="fa fa-times-circle"></i>
        </div>
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                </li>
                <%--<c:import url="menu.jsp"/>--%>
                <%--<li>
                    <a href="#"><i class="fa fa-table"></i> <span class="nav-label">系统管理</span><span
                            class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a class="J_menuItem" href="${pageContext.request.contextPath}/list/s_menu">列表</a></li>
                        <li><a class="J_menuItem" href="${pageContext.request.contextPath}/add/s_menu">新增</a></li>
                        <li><a class="J_menuItem" href="${pageContext.request.contextPath}/update/s_menu/1">修改</a></li>
                    </ul>
                </li>--%>
                <li>
                    <a href="#"><i class="fa fa-table"></i> <span class="nav-label">基础页面样式</span><span
                            class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a class="J_menuItem" href="${basePath}/resources/sky/table_bootstrap.html">表格</a></li>
                        <li><a class="J_menuItem" href="${basePath}/resources/sky/modal_window.html">模态窗口</a></li>
                        <li><a class="J_menuItem" href="${basePath}/resources/sky/form_basic.html">基本表单</a></li>
                        <li><a class="J_menuItem" href="${basePath}/resources/sky/sweetalert.html">SweetAlert</a></li>
                        <li><a class="J_menuItem" href="${basePath}/resources/sky/multiple_table_bootstrap.html">多个表格</a>
                        </li>
                        <li><a class="J_menuItem" href="${basePath}/resources/sky/toastr_notifications.html">Toastr通知</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i
                        class="fa fa-bars"></i> </a></div>
                <ul class="nav navbar-top-links navbar-right">
                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                            <i class="fa fa-envelope"></i> <span class="label label-warning"></span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="row content-tabs">
            <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
            </button>
            <nav class="page-tabs J_menuTabs">
                <div class="page-tabs-content">
                    <a href="javascript:;" class="active J_menuTab" data-id="index_v1.html">首页</a>
                </div>
            </nav>
            <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
            </button>
            <div class="btn-group roll-nav roll-right">
                <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>

                </button>
                <ul role="menu" class="dropdown-menu dropdown-menu-right">
                    <li class="J_tabShowActive"><a>定位当前选项卡</a>
                    </li>
                    <li class="divider"></li>
                    <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                    </li>
                    <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                    </li>
                </ul>
            </div>
            <a href="#" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
        </div>
        <div class="row J_mainContent" id="content-main">
            <iframe class="J_iframe" name="iframe0" width="100%" height="100%"
                    src="${basePath}/resources//list/s_menu" frameborder="0"
                    data-id="index_v1.html" seamless></iframe>
        </div>
        <div class="footer"></div>
    </div>
</div>
<script src="${basePath}/resources/sky/js/jquery.min.js"></script>
<script src="${basePath}/resources/sky/js/bootstrap.min.js"></script>
<script src="${basePath}/resources/sky/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${basePath}/resources/sky/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="${basePath}/resources/sky/js/plugins/layer/layer.js"></script>
<script src="${basePath}/resources/sky/js/hplus.min.js"></script>
<script type="text/javascript" src="${basePath}/resources/sky/js/contabs.min.js"></script>
<script src="${basePath}/resources/sky/js/plugins/pace/pace.min.js"></script>
<script src="${basePath}/resources/sky/js/plugins/toastr/toastr.min.js"></script>
<script src="${basePath}/resources/sky/js/sky/toastrInit.js"></script>

<script>

    $(function(){
        toastr["${toastrType}"]("${toastrMessage}", "${toastrTitle}");
    });
</script>
</body>


</html>

