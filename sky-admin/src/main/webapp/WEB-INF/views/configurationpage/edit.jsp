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
<html>

<head>
    <title>编辑</title>
    <link rel="stylesheet" href="${basePath}/UI/test/layuiSky/layui/css/layui.css"  media="all">
</head>
<body>

<form:form class="layui-form" action="${basePath}/configurationpage/edit" method="POST" modelAttribute="configurationpage" >
    <c:if test="${configurationpage.id != null }">
        <form:hidden path="id" />
        <input type="hidden" name="_method" value="PUT" />
    </c:if>
    <div class="layui-form-item">
        <label class="layui-form-label">名称</label>
        <div class="layui-input-block">
            <form:input lay-verify="title" autocomplete="off" placeholder="请输入" class="layui-input" type="text" path="name"></form:input>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">表名称</label>
        <div class="layui-input-inline">
            <form:select items="${databaseTables}" lay-verify="required" itemLabel="tableEn" itemValue="tableEn"  path="tableEn"></form:select>
            <%--<select name="tableEn" lay-verify="required" lay-search="">
                <option value="">直接选择或搜索选择</option>
                <option value="1">layer</option>
                <option value="2">form</option>
                <option value="3">layim</option>
                <option value="4">element</option>
                <option value="5">laytpl</option>
                <option value="6">upload</option>
                <option value="7">laydate</option>
                <option value="8">laypage</option>
                <option value="9">flow</option>
                <option value="10">util</option>
                <option value="11">code</option>
                <option value="12">tree</option>
                <option value="13">layedit</option>
                <option value="14">nav</option>
                <option value="15">tab</option>
                <option value="16">table</option>
                <option value="17">select</option>
                <option value="18">checkbox</option>
                <option value="19">switch</option>
                <option value="20">radio</option>
            </select>--%>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button id="submit" class="btn btn-primary" type="submit" style="display: none;">立即提交</button>
            <%--<button type="reset" class="layui-btn layui-btn-primary">重置</button>--%>
        </div>
    </div>
</form:form>

<script src="${basePath}/UI/test/layuiSky/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;



        /*  //监听提交
         form.on('submit(demo1)', function(data){
         layer.alert(JSON.stringify(data.field), {
         title: '最终的提交信息'
         })
         return false;
         });*/


    });
</script>

</body>
</html>