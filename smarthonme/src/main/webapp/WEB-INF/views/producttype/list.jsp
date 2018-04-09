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
<c:set var="typePath" value="producttype"/>
<html>

<head>
    <title>列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${basePath}/UI/layuiSky/layui/css/layui.css"  media="all">
    <link rel="stylesheet" href="${basePath}/UI/layuiSky/sky/css/edit-list.css"  media="all">
</head>
<body style="height: 100%;">
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<div class="demoTable">
    <button class="layui-btn" data-type="add" id="add">新增</button>
    搜索名称：
    <div class="layui-inline">
        <input class="layui-input" name="name" id="name" autocomplete="off">
    </div>
    <button class="layui-btn" data-type="reload">搜索</button>
</div>

<table id="table_one" lay-filter="table_one"></table>

<script src="${basePath}/UI/layuiSky/layui/layui.js" charset="utf-8"></script>
<script>
    layui.use(['table','form'], function(){
        var table = layui.table, $ = layui.jquery,layer = layui.layer,form = layui.form;;

        renderOne();
        //监听工具条
        table.on('tool(table_one)', function(obj){
            var data = obj.data;
            if(obj.event === 'edit'){
                layer.open({
                    type: 2,
                    title: '编辑:'+data.name,
                    shade: 0,//遮罩shade: [0.8, '#393D49']
                    maxmin: true,//放大和缩小
                    tipsMore: true,//是否允许多个tips
                    area: ['60%', '60%'],
                    content: "${basePath}/${typePath}/edit/"+data.id//iframe的url
                    ,end:function(layero, index){//销毁后触发的回调
                        renderOne();//刷新数据
                    }
                    ,btn: ['确定'] //可以无限个按钮
                    ,btn1: function(index, layero){
                        layer.close(index);//关闭
                    }
                });
            }else if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    del(data.id);
                    layer.close(index);
                });
            }
        });

        var active = {
            reload: function(){
                renderOne();
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
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
                    reload('skyList');//刷新数据
                }
                ,btn: ['保存', '取消'] //可以无限个按钮
                ,btn1: function(index, layero){
                    window.frames["layui-layer-iframe"+index].document.getElementById("submit").click();//执行弹出窗口里的保存按钮
                    renderOne();
                    layer.close(index);//关闭
                },btn2: function(index, layero){
                    renderOne();
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
            var name = $('#name').val();
            var where ={};
            if(name!=null && name!=""){
                where.name=name;
            }
            table.render({
                elem: '#table_one'
                ,url: '${basePath}/${typePath}/data'
                ,page: true
                ,height: 'full-60'//最大高度-20  full-20
                , limit:10
                ,cellMinWidth: 40
                ,cols: [[
                    {type:'checkbox', fixed: 'left'}
                    ,{type:'numbers', fixed: 'left'}
                    ,{field:'id', title:'ID'}
                    ,{field:'productType', title:'productType'}
                    ,{field:'productKey', title:'productKey'}
                    ,{field:'name', title:'name'}
                    ,{field:'dataPointUnpack', title:'dataPointUnpack'}
                    ,{field:'dataPointName', title:'dataPointName'}
                    ,{field:'technical', title:'technical'}
                    ,{fixed: 'right', title:'操作', toolbar: '#barDemo', minWidth:200}
                ]]
                ,where:where
                ,done: function(res, curr, count){
                    //$("[data-field='id']").css('display','none');//隐藏列表
                }
            });
        }


    });
</script>

</body>
</html>