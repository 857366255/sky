<%--
  Created by IntelliJ IDEA.
  User: wz
  Date: 2017/10/16
  Time: 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<c:set var="typePath" value="devicecapacitydetail"/>
<html>

<head>
    <title>编辑</title>
    <link rel="stylesheet" href="${basePath}/UI/layuiSky/layui/css/layui.css"  media="all">
</head>
<body>

<form:form class="layui-form" action="${basePath}/${typePath}/edit" method="POST" modelAttribute="devicecapacitydetail" >
    <c:if test="${devicecapacitydetail.id != null }">
        <form:hidden path="id" />
        <input type="hidden" name="_method" value="PUT" />
    </c:if>
    <fieldset class="layui-elem-field">
        <legend>设备</legend>
        <form:select items="${devicetypes}"  lay-verify="required" itemLabel="name" itemValue="id"  path="devucetypeid"  class="layui-field-box" ></form:select>
            <%--<form:select items="${databaseTables}"  lay-verify="required" itemLabel="tableEn" itemValue="tableEn"  path="tableEn"  class="layui-field-box" ></form:select>--%>
    </fieldset>
    <fieldset class="layui-elem-field">
        <legend>工段</legend>
        <form:select items="${sections}"  lay-verify="required" itemLabel="name" itemValue="id"  path="sectionid"  class="layui-field-box" ></form:select>
            <%--<form:select items="${databaseTables}"  lay-verify="required" itemLabel="tableEn" itemValue="tableEn"  path="tableEn"  class="layui-field-box" ></form:select>--%>
    </fieldset>

    <fieldset class="layui-elem-field">
        <legend>工序</legend>
        <form:select items="${processs}"  lay-verify="required" itemLabel="name" itemValue="id"  path="processid"  class="layui-field-box" ></form:select>
    </fieldset>
    <fieldset class="layui-elem-field">
        <legend>产能</legend>
        <form:input lay-verify="title" autocomplete="off" placeholder="请输入" type="text" path="capacity" class="layui-input layui-field-box" ></form:input>
    </fieldset>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button id="submit" class="btn btn-primary" type="submit" style="display: none;">立即提交</button>
        </div>
    </div>
</form:form>

<script src="${basePath}/UI/layuiSky/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;

    });
</script>

</body>
</html>