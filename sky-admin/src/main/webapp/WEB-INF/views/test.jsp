<%--
  Created by IntelliJ IDEA.
  User: wz
  Date: 2017/10/16
  Time: 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<html>

<head>
    <title>步骤测试</title>
    <link rel="stylesheet" href="${basePath}/UI/layuiSky/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${basePath}/UI/layuiSky/layui/extend/steps/style.css">
</head>
<body>
<div id="step_demo" class="step-body">
    <div class="step-header" style="width:80%;overflow: hidden;">
        <ul>
            <li>
                <span class="step-name">填写申请表</span>
            </li>
            <li>
                <span class="step-name">上传资料</span>
            </li>
            <li>
                <span class="step-name">待确认</span>
            </li>
            <li>
                <span class="step-name">已确认</span>
            </li>
            <li>
                <span class="step-name">待受理</span>
            </li>
            <li>
                <span class="step-name">已受理</span>
            </li>
            <li>
                <span class="step-name">预约完成</span>
            </li>
            <li>
                <span class="step-name">签证单已发放</span>
            </li>
        </ul>
    </div>
    <div class="step-content">
        <div class="step-list">填写申请表</div>
        <div class="step-list">上传资料</div>
        <div class="step-list">待确认</div>
        <div class="step-list">已确认</div>
        <div class="step-list">待受理</div>
        <div class="step-list">已受理</div>
        <div class="step-list">预约完成</div>
        <div class="step-list">签证单已发放</div>
        <div class="step-list">完成</div>
    </div>
    <button id="preBtn">上一步</button>
    <button id="nextBtn">下一步</button>
    <button id="goBtn">跳转的指定的步骤</button>
</div>
<script src="${basePath}/UI/layuiSky/layui/layui.js" charset="utf-8"></script>
<script src="${basePath}/UI/layuiSky/layui/config.js" charset="utf-8"></script>
<script>
    /*layui.config({
        base: '/UI/layuiSky/layui/extend/'
    }).extend({
        steps:"steps/steps"
    });*/
    layui.use(['jquery', 'steps'], function(){

        var $ = layui.$;

        var $step= $("#step_demo").step();

        $("#preBtn").click(function(event) {
            $step.preStep();//上一步
        });
        $("#nextBtn").click(function(event) {
            $step.nextStep();//下一步
        });
        $("#goBtn").click(function(event) {
            $step.goStep(3);//到指定步
        });
        function nextBtn(){
            var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
            $step.nextStep();//下一步
        }
    });
    function hwz(){
        alert(123456);
    }
</script>
</body>
</html>
