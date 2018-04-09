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
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<c:set var="typePath" value="producttype"/>
<html>

<head>
    <title>编辑</title>
    <link rel="stylesheet" href="${basePath}/UI/layuiSky/layui/css/layui.css"  media="all">
</head>
<body>

<form:form class="layui-form layui-form-pan" action="${basePath}/${typePath}/edit" method="POST" modelAttribute="productType" >
    <c:if test="${productType.id != null }">
        <form:hidden path="id" />
        <input type="hidden" name="_method" value="PUT" />
    </c:if>
    <div class="layui-form-item">
        <label class="layui-form-label">产品ID</label>
        <div class="layui-input-inline">
            <form:input type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" path="productType"></form:input>
           <%-- <form:input lay-verify="title" autocomplete="off" placeholder="请输入" type="text" path="name" class="layui-input layui-field-box" ></form:input>--%>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">授权秘钥</label>
        <div class="layui-input-inline">
            <form:input type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" path="productKey"></form:input>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">名称</label>
        <div class="layui-input-inline">
            <form:input type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" path="name"></form:input>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">打包/解包字符集</label>
        <div class="layui-input-inline">
            <form:input type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" path="dataPointUnpack"></form:input>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">数据点名称列表</label>
        <div class="layui-input-inline">
            <form:input type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" path="dataPointName"></form:input>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">技术方案</label>
        <div class="layui-input-inline">
            <form:input type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" path="technical"></form:input>
        </div>
    </div>
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