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
<c:set var="typePath" value="tableField"/>
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
</script>

<div class="demoTable">
    <button class="layui-btn" data-type="updateTableField" id="updateTableField">同步表字段信息</button>
    搜索表：
    <div class="layui-inline">
        <input class="layui-input" name="tableEn" id="tableEn" autocomplete="off">
    </div>
    <button class="layui-btn" data-type="reload">搜索</button>
</div>

<table id="table_one" lay-filter="table_one"></table>

<script src="${basePath}/UI/layuiSky/layui/layui.js" charset="utf-8"></script>
<script>
    layui.use(['table','form'], function(){
        var table = layui.table, $ = layui.jquery,layer = window.parent.layer,form = layui.form;;

        var sadasd = parent;
        renderOne();
        //监听工具条

        table.on('tool(table_one)', function(obj){
            var data = obj.data;
            if(obj.event === 'edit'){
                layer.open({
                    type: 2,
                    title: '编辑:'+data.tableEn,
                    shade: 0,//遮罩shade: [0.8, '#393D49']
                    maxmin: true,//放大和缩小
                    tipsMore: true,//是否允许多个tips
                    area: ['60%', '60%'],
                    content: "${basePath}/${typePath}/editList/"+data.tableEn//iframe的url
                    ,end:function(layero, index){//销毁后触发的回调
                        renderOne();//刷新数据
                    }
                    ,btn: ['确定'] //可以无限个按钮
                    ,btn1: function(index, layero){
                        layer.close(index);//关闭
                    }
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

        $("#updateTableField").click(function(){
            var layerload = layer.load(0);
            $.ajax({
                url: "${basePath}/${typePath}/updateTableField",
                type: 'PUT',
                success: function(data) {
                    layer.msg('同步完成');
                    renderOne();
                    layer.close(layerload);
                },error : function(data) {
                    layer.msg('同步失败');
                    layer.close(layerload);
                }
            });
        });

        function renderOne() {
            var tableEn = $('#tableEn').val();
            var where ={};
            if(tableEn!=null && tableEn!=""){
                where.tableEn=tableEn;
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
                    ,{field:'tableEn', title:'表'}
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