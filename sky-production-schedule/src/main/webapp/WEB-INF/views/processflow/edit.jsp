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
<c:set var="typePath" value="processflow"/>
<html>

<head>
    <title>编辑</title>
    <link rel="stylesheet" href="${basePath}/UI/layuiSky/layui/css/layui.css"  media="all">
</head>
<body>

<form:form class="layui-form" action="${basePath}/${typePath}/edit" method="POST" modelAttribute="processflow" >
    <c:if test="${processflow.id != null }">
        <form:hidden path="id" />
        <input type="hidden" name="_method" value="PUT" />
    </c:if>
    <div class="layui-form-item">
        <fieldset class="layui-elem-field">
            <legend>物资名称</legend>
            <form:select items="${supplies}"  lay-verify="required" itemLabel="name" itemValue="id"  path="suppliesid"  class="layui-field-box" ></form:select>
        </fieldset>
        <fieldset class="layui-elem-field">
            <legend>从(类型)</legend>
            <form:select items="${fromandtotypes}"  lay-verify="required" itemLabel="name" itemValue="id"  path="fromtype"  class="layui-field-box" lay-filter="fromid"></form:select>
        </fieldset>
        <fieldset class="layui-elem-field">
            <legend>从</legend>
            <form:select items="${fromids}"  lay-verify="required" itemLabel="name" itemValue="id"  path="fromid"  class="layui-field-box" id="fromid"></form:select>
        </fieldset>
        <fieldset class="layui-elem-field">
            <legend>到(类型)</legend>
            <form:select items="${fromandtotypes}"  lay-verify="required" itemLabel="name" itemValue="id"  path="totype"  class="layui-field-box" lay-filter="toid"></form:select>
        </fieldset>
        <fieldset class="layui-elem-field">
            <legend>到</legend>
            <form:select items="${toids}"  lay-verify="required" itemLabel="name" itemValue="id"  path="toid"  class="layui-field-box" id="toid"></form:select>
        </fieldset>
       <%-- <fieldset class="layui-elem-field">
            <legend>工序</legend>
            <form:input lay-verify="title" autocomplete="off" placeholder="请输入" type="text" path="name" class="layui-input layui-field-box" ></form:input>
        </fieldset>--%>
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
            ,laydate = layui.laydate
            , $ = layui.jquery;
        form.on('select(fromid)', function(data){
           // selectOption(data.value,"fromid");
            $.getJSON("${basePath}/${typePath}/select/"+data.value, function(data){
                var optionstring = "";
                $.each(data.data, function(i,item){
                    optionstring += "<option value=\"" + item.code + "\" >" + item.name + "</option>";
                });
                $("#"+"fromid").html('<option value=""></option>' + optionstring);
                form.render("select"); //这个很重要
            });
        });
        form.on('select(toid)', function(data){
            $.getJSON("${basePath}/${typePath}/select/"+data.value, function(data){
                var optionstring = "";
                $.each(data.data, function(i,item){
                    optionstring += "<option value=\"" + item.code + "\" >" + item.name + "</option>";
                });
                $("#"+"toid").html('<option value=""></option>' + optionstring);
                form.render("select"); //这个很重要
            });
            //selectOption(data.value,"toid");
        });
        function selectOption(dataValue,selectId){
            $.getJSON("${basePath}/${typePath}/select/"+dataValue, function(data){
                var optionstring = "";
                $.each(data.data, function(i,item){
                    optionstring += "<option value=\"" + item.code + "\" >" + item.name + "</option>";
                });
                $("#"+selectId).html('<option value=""></option>' + optionstring);
               // form.render("#"+selectId); //这个很重要
            });
        }
    });
</script>

</body>
</html>