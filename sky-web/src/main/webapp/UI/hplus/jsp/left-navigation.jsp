<%--
  Created by IntelliJ IDEA.
  User: wz
  Date: 2017/6/22
  Time: 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--左侧导航开始-->
<nav class="navbar-default navbar-static-side" role="navigation">
    <div class="nav-close"><i class="fa fa-times-circle"></i>
    </div>
    <div class="sidebar-collapse">
        <ul class="nav" id="side-menu">
            <li class="nav-header">
                <div class="dropdown profile-element">
                    <span><img alt="image" class="img-circle" src="<%=basePath%>/UI/hplus/img/profile_small.jpg" /></span>
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <span class="clear">
                            <span class="block m-t-xs"><strong class="font-bold">Beaut-zihan</strong></span>
                            <span class="text-muted text-xs block">超级管理员<b class="caret"></b></span>
                        </span>
                    </a>
                    <ul class="dropdown-menu animated fadeInRight m-t-xs">
                        <li><a class="J_menuItem" href="<%=basePath%>/UI/hplus/html/form_avatar.html">修改头像</a></li>
                        <li><a class="J_menuItem" href="<%=basePath%>/UI/hplus/html/profile.html">个人资料</a></li>
                        <li><a class="J_menuItem" href="<%=basePath%>/UI/hplus/html/contacts.html">联系我们</a></li>
                        <li><a class="J_menuItem" href="<%=basePath%>/UI/hplus/html/mailbox.html">信箱</a></li>
                        <li class="divider"></li>
                        <li><a href="signout">安全退出</a></li>
                    </ul>
                </div>
                <div class="logo-element">H+</div>
            </li>
            <li>
                <a href="#"><i class="glyphicon glyphicon-user"></i> <span class="nav-label">用户</span><span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li><a class="J_menuItem" href="user/goList">用户列表</a></li>
                    <li><a class="J_menuItem" href="user/goCreate">新增用户</a></li>
                </ul>
            </li>

        </ul>
    </div>
</nav>
<!--左侧导航结束-->


