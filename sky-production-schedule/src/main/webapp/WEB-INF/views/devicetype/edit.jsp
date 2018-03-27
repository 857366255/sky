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
<c:set var="typePath" value="devicetype"/>
<html>

<head>
    <title>编辑</title>
    <link rel="stylesheet" href="${basePath}/UI/layuiSky/layui/css/layui.css"  media="all">
</head>
<body>


<script src="${basePath}/UI/layuiSky/layui/layui.js" charset="utf-8"></script>
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