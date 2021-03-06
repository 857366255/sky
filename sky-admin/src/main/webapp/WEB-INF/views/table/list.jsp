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
<c:set var="typePath" value="table"/>
<html>

<head>
    <title>列表</title>
    <link rel="stylesheet" href="${basePath}/UI/layuiSky/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${basePath}/UI/layuiSky/sky/css/edit-list.css" media="all">
</head>
<body style="height: 100%;">
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    <a class="layui-btn layui-btn-xs" lay-event="tableRelevanceAdd">添加关联表</a>
</script>

<div class="layui-btn-group demoTable">
    <button class="layui-btn" data-type="isAll" id="add">新增</button>
</div>

<table id="skyList" lay-filter="skyList"></table>

<script src="${basePath}/UI/layuiSky/layui/layui.js" charset="utf-8"></script>
<script>
    layui.use(['table'], function(){
        var table = layui.table, $ = layui.jquery,layer = window.parent.layer;
        renderOne();
        //监听工具条
        table.on('tool(skyList)', function(obj){
            var data = obj.data;
            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    del(data.id);
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                layer.open({
                    type: 2,
                    title: '编辑'+data.name,
                    shade: 0,//遮罩shade: [0.8, '#393D49']
                    maxmin: true,//放大和缩小
                    tipsMore: true,//是否允许多个tips
                    area: ['60%', '60%'],
                    content: "${basePath}/${typePath}/edit/"+data.id//iframe的url
                    ,end:function(layero, index){//销毁后触发的回调
                        renderOne();//刷新数据
                    }
                    ,btn: ['保存', '取消'] //可以无限个按钮
                    ,btn1: function(index, layero){
                        window.parent.frames["layui-layer-iframe"+index].document.getElementById("submit").click();//执行弹出窗口里的保存按钮
                        layer.close(index);//关闭
                    },btn2: function(index, layero){
                        layer.close(index);//关闭
                    }
                });
            } else if(obj.event === 'tableRelevanceAdd'){
                layer.open({
                    type: 2,
                    title: '编辑'+data.name,
                    shade: 0,//遮罩shade: [0.8, '#393D49']
                    maxmin: true,//放大和缩小
                    tipsMore: true,//是否允许多个tips
                    area: ['60%', '60%'],
                    content: "${basePath}/tableRelevance/list/"+data.id //iframe的url
                    ,end:function(layero, index){//销毁后触发的回调
                        renderOne();//刷新数据
                    }
                    ,btn: ['保存', '取消'] //可以无限个按钮
                    ,btn1: function(index, layero){
                        window.parent.frames["layui-layer-iframe"+index].document.getElementById("submit").click();//执行弹出窗口里的保存按钮
                        layer.close(index);//关闭
                    },btn2: function(index, layero){
                        layer.close(index);//关闭
                    }
                });
            }
        });

        //点击加号按钮时
        $("#add").click(function(){
            layer.open({
                type: 2,
                title: '新增',
                shade: 0,//遮罩shade: [0.8, '#393D49']
                maxmin: true,//放大和缩小
                tipsMore: true,//是否允许多个tips
                area: ['60%', '60%'],
                content: "${basePath}/${typePath}/add"//iframe的url
                ,end:function(layero, index){//销毁后触发的回调
                    renderOne();//刷新数据
                }
                ,btn: ['保存', '取消'] //可以无限个按钮
                ,btn1: function(index, layero){
                    window.parent.frames["layui-layer-iframe"+index].document.getElementById("submit").click();//执行弹出窗口里的保存按钮
                    layer.close(index);//关闭
                },btn2: function(index, layero){
                    layer.close(index);//关闭
                }
            });
        });
        function del(id) {
            $.ajax({
                url: "${basePath}/${typePath}/del/"+id,
                type: 'DELETE',
                success: function(data) {
                    renderOne();
                },error : function(data) {
                    alert("删除失败");
                }
            });
        }
        function renderOne() {
            table.render({
                elem: '#skyList'
                ,url: '${basePath}/${typePath}/data'
                ,page: true
                ,height: 'full-60'//最大高度-20  full-20
                , limit:10
                ,cellMinWidth: 80
                ,cols: [[
                    {type:'numbers', fixed: 'left'}
                    ,{type: 'checkbox', fixed: 'left'}
                    ,{field:'id', title:'ID', unresize: true, sort: true ,display:'none'}
                    ,{field:'name', title:'名称'}
                    ,{field:'tableEn', title:'表名称'}
                    ,{fixed: 'right', title:'操作', toolbar: '#barDemo', minWidth:200}
                ]]
                ,done: function(res, curr, count){
                    $("[data-field='id']").css('display','none');//隐藏列表
                }
            });
        }

    });
</script>

</body>
</html>