<%--
  Created by IntelliJ IDEA.
  User: wz
  Date: 2017/10/23
  Time: 12:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String basePath = request.getContextPath();
%>
<c:forEach items="${menuList}" var="m">
    <li>
        <%--<a href="#"><i class="fa fa-table"></i> <span class="nav-label">系统管理</span><span
                class="fa arrow"></span></a>
        <ul class="nav nav-second-level">
            <li><a class="J_menuItem" href="${pageContext.request.contextPath}/list/s_menu">列表</a></li>
            <li><a class="J_menuItem" href="${pageContext.request.contextPath}/add/s_menu">新增</a></li>
            <li><a class="J_menuItem" href="${pageContext.request.contextPath}/update/s_menu/1">修改</a></li>
        </ul>--%>
        <c:choose>
            <c:when test="${m.getMenuList().size() == 0}">
                <li>
                    <a href="#">
                        <i class="fa ${m.getIcon()}"></i>
                        <span class="nav-label">${m.getName()}</span><span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-third-level">
                        <li><a class="J_menuItem" href="${pageContext.request.contextPath}/list/${m.getUrl()}">列表</a></li>
                        <li><a class="J_menuItem" href="${pageContext.request.contextPath}/add/${m.getUrl()}">新增</a></li>
                        <li><a class="J_menuItem" href="${pageContext.request.contextPath}/update/${m.getUrl()}/1">修改</a></li>
                    </ul>
                </li>
            </c:when>
            <c:otherwise>
     <a href="#">
         <i class="fa ${m.getIcon()}"></i>
         <span class="nav-label">${m.getName()}</span>
         <span class="fa arrow"></span>
     </a>
     <c:set var="menuList" value="${m.getMenuList()}" scope="request" /><!-- 注意此处，子列表覆盖treeList，在request作用域 -->
     <ul class="nav nav-${number==0 ? 'second' : 'third'}-level">
         <c:if test="${m.getUrl() != null}">
             <li>
                 <a class="J_menuItem" href="${m.getUrl()}/${m.getUrl()}">
                     <i class="fa ${m.getIcon()}"></i>
                     <span class="nav-label">${m.getName()}</span>
                 </a>
             </li>
         </c:if>
         <c:set var="number" value="${number+1}" scope="request" />
         <c:import url="menu.jsp" /><!-- 这就是递归了 -->
     </ul>
 </c:otherwise>
</c:choose>
    </li>
</c:forEach>
