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
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<html>

<head>
    <title>TEST</title>
    <link rel="stylesheet" href="${basePath}/UI/layuiSky/layui/css/layui.css" media="all">
</head>
<body>
    <li>
        <ul><a href="${basePath}/configurationPage/index">登入</a></ul>
    </li>
    <%--<div class="layui-btn-group demoTable">
        <button class="layui-btn" data-type="isAll" id="add">表单步骤测试</button>
    </div>--%>
</body>
<script src="${basePath}/UI/layuiSky/layui/layui.js" charset="utf-8"></script>
<script>

    layui.use(['table','layer','element'], function(){
        var $ = layui.jquery,layer = layui.layer,element = layui.element;

        //点击加号按钮时
        $("#add").click(function(){
            layer.tab({
                id:"layertab",
                area: ['60%', '60%'],
                tab: [{
                    title: 'TAB1',
                    content: '<iframe src="${basePath}/configurationPage/test"></iframe>'
                }, {
                    title: 'TAB2',
                    content: '${basePath}/configurationPage/test'
                }, {
                    title: 'TAB3',
                    content: '${basePath}/configurationPage/test'
                }]
                ,btn: ['上一步','下一步']
                ,btn1: function(index, layero){
                    alert(index);
                    element.tabChange('layertab', 'layid');
                    //window.frames["layui-layer-iframe"+index].document.getElementById("preBtn").click();
                    return false;
                },btn2: function(index, layero){
                    alert(index);
                   // window.frames["layui-layer-iframe"+index].document.getElementById("nextBtn").click();
                    return false;
                }
            });
            $("span").unbind();
            /*layer.open({
                type: 2,
                title: '新增',
                shade: 0,//遮罩shade: [0.8, '#393D49']
                maxmin: true,//放大和缩小
                tipsMore: true,//是否允许多个tips
                area: ['60%', '60%'],
                content: "${basePath}/configurationPage/test"//iframe的url
                ,end:function(layero, index){//销毁后触发的回调
                   // reload('skyList');//刷新数据
                }
                ,btn: ['上一步','下一步'] //可以无限个按钮
                ,btn1: function(index, layero){
                    window.frames["layui-layer-iframe"+index].document.getElementById("preBtn").click();
                    return false;
                },btn2: function(index, layero){
                    window.frames["layui-layer-iframe"+index].document.getElementById("nextBtn").click();
                    return false;
                }
            });*/
        });

    });

</script>
</html>