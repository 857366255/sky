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
<c:set var="typePath" value="tableRelevance"/>
<html>

<head>
    <title>编辑</title>
    <link rel="stylesheet" href="${basePath}/UI/layuiSky/layui/css/layui.css"  media="all">
</head>
<body>

<form:form class="layui-form" action="${basePath}/${typePath}/edit" method="POST" modelAttribute="tableRelevance" >
    <c:if test="${tableRelevance.id != null }">
        <form:hidden path="id" />
        <input type="hidden" name="_method" value="PUT" />
    </c:if>
    <form:input type="hidden" path="tableid"></form:input>
    <form:input type="hidden" path="tableRelevanceid"></form:input>
    <div class="layui-form-item">
        <c:if test="${tableRelevance.tableid != null }">
        <div class="layui-inline">
            <label class="layui-form-label">父级表字段</label>
            <div class="layui-input-inline">
                <form:select items="${tableidFieldEns}"  lay-verify="required" itemLabel="fieldEn" itemValue="fieldEn"  path="tableidFieldEn"  class="layui-field-box" ></form:select>
            </div>
        </div>
        </c:if>
        <c:if test="${tableRelevance.tableRelevanceid != null }">
        <div class="layui-inline">
            <label class="layui-form-label">上级表字段</label>
            <div class="layui-input-inline">
                <form:select items="${tableRelevanceidFieldEns}"  lay-verify="required" itemLabel="fieldEn" itemValue="fieldEn"  path="tableRelevanceidFieldEn"  class="layui-field-box" ></form:select>
            </div>
        </div>
        </c:if>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">表</label>
            <div class="layui-input-inline">
                <form:select lay-filter="fieldEn" items="${databaseTables}"  lay-verify="required" itemLabel="tableEn" itemValue="tableEn"  path="tableEn"  class="layui-field-box" ></form:select>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">字段</label>
            <div class="layui-input-inline">
                <form:select items="${databaseFields}"  lay-verify="required" itemLabel="fieldEn" itemValue="fieldEn"  path="fieldEn"  class="layui-field-box" ></form:select>
            </div>
        </div>
    </div>
    <%--<form:select items="${fromids}"  lay-verify="required" itemLabel="name" itemValue="id"  path="fromid"  class="layui-field-box" id="fromid"></form:select>--%>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button id="submit" class="btn btn-primary" type="submit" style="display: none;">立即提交</button>
            <%--<button type="reset" class="layui-btn layui-btn-primary">重置</button>--%>
        </div>
    </div>
</form:form>

<script src="${basePath}/UI/layuiSky/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            , $ = layui.jquery
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;

        form.on('select(fieldEn)', function(data){
            $.getJSON("${basePath}/database/field/"+data.value, function(data){
                var optionstring = "";
                $.each(data.data, function(i,item){
                    var fieldEn = item.fieldEn;
                    if(fieldEn==null){
                        fieldEn="";
                    }
                    optionstring += "<option value=\"" + fieldEn + "\" >" + fieldEn + "</option>";
                });
                $("#"+"fieldEn").html('<option value=""></option>' + optionstring);
                form.render("select"); //这个很重要
            });
        });


    });
</script>

</body>
</html>