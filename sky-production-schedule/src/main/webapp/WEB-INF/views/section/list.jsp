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
<c:set var="typePath" value="section"/>
<html>

<head>
    <title>列表</title>
    <link rel="stylesheet" href="${basePath}/UI/layuiSky/layui/css/layui.css"  media="all">
    <link rel="stylesheet" href="${basePath}/UI/layuiSky/sky/css/edit-list.css"  media="all">
</head>
<body style="height: 100%;">
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/html" id="radioTpl">
    <input type="radio" name="radio"  value="{{d.id}}" title=" " lay-filter="radio" style="width: 50px">
</script>

<div class="layui-btn-group demoTable">
    <button class="layui-btn" data-type="isAll" id="add">新增工段</button>
    <button class="layui-btn" data-type="isAll" id="addProcess">新增工序</button>
</div>

<div class="layui-row">
    <div class="layui-col-xs4">
        <fieldset class="layui-elem-field">
            <legend>工段</legend>
            <div class="layui-field-box">
                <table id="table_one" lay-filter="table_one"></table>
            </div>
        </fieldset>
    </div>
    <div class="layui-col-xs*">
        <fieldset class="layui-elem-field">
            <legend>工序</legend>
            <div class="layui-field-box">
                <table id="table_two" lay-filter="table_two"></table>
            </div>
        </fieldset>

    </div>
</div>
<script src="${basePath}/UI/layuiSky/layui/layui.js" charset="utf-8"></script>
<script>
    layui.use(['table','layer','form'], function(){
        var table = layui.table, $ = layui.jquery,layer = layui.layer,form = layui.form;
        renderOne();
        renderTwo(-1);
        //监听工具条
        table.on('tool(table_one)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                layer.msg('ID：'+ data.id + ' 的查看操作');
            } else if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    del(data.id,"${typePath}");
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
               // layer.alert('编辑行：<br>'+ JSON.stringify(data));
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
                        //var body = layer.getChildFrame('body', index); //巧妙的地方在这里哦
                        window.frames["layui-layer-iframe"+index].document.getElementById("submit").click();//执行弹出窗口里的保存按钮
                        layer.close(index);//关闭
                    },btn2: function(index, layero){
                        layer.close(index);//关闭
                    }
                });
            }
        });
        //监听工具条
        table.on('tool(table_two)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                layer.msg('ID：'+ data.id + ' 的查看操作');
            } else if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    del(data.id,"process");
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                // layer.alert('编辑行：<br>'+ JSON.stringify(data));
                layer.open({
                    type: 2,
                    title: '编辑'+data.name,
                    shade: 0,//遮罩shade: [0.8, '#393D49']
                    maxmin: true,//放大和缩小
                    tipsMore: true,//是否允许多个tips
                    area: ['60%', '60%'],
                    content: "${basePath}/process/edit/"+data.id//iframe的url
                    ,end:function(layero, index){//销毁后触发的回调
                        renderTwo();//刷新数据
                    }
                    ,btn: ['保存', '取消'] //可以无限个按钮
                    ,btn1: function(index, layero){
                        //var body = layer.getChildFrame('body', index); //巧妙的地方在这里哦
                        window.frames["layui-layer-iframe"+index].document.getElementById("submit").click();//执行弹出窗口里的保存按钮
                        layer.close(index);//关闭
                    },btn2: function(index, layero){
                        layer.close(index);//关闭
                    }
                });
            }
        });
        //单选事件
        form.on("radio(radio)",function(obj) {
            layer.tips(this.value+" "+this.name+":"+obj.elem.checked,obj.othis);
            renderTwo(this.value);
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
                    window.frames["layui-layer-iframe"+index].document.getElementById("submit").click();//执行弹出窗口里的保存按钮
                    layer.close(index);//关闭
                },btn2: function(index, layero){
                    layer.close(index);//关闭
                }
            });
        });
        $("#addProcess").click(function(){
            layer.open({
                type: 2,
                title: '新增',
                shade: 0,//遮罩shade: [0.8, '#393D49']
                maxmin: true,//放大和缩小
                tipsMore: true,//是否允许多个tips
                area: ['60%', '60%'],
                content: "${basePath}/process/add"//iframe的url
                ,end:function(layero, index){//销毁后触发的回调
                    renderTwo();//刷新数据
                }
                ,btn: ['保存', '取消'] //可以无限个按钮
                ,btn1: function(index, layero){
                    window.frames["layui-layer-iframe"+index].document.getElementById("submit").click();//执行弹出窗口里的保存按钮
                    layer.close(index);//关闭
                },btn2: function(index, layero){
                    layer.close(index);//关闭
                }
            });
        });


        function del(id,url) {
            $.ajax({
                url: "${basePath}/"+url+"/del/"+id,
                type: 'DELETE',
                success: function(data) {
                    renderTwo();
                    renderOne();
                },error : function(data) {
                    alert("删除失败");
                }
            });
        }

        function renderOne() {
            table.render({
                elem: '#table_one'
                ,url: '${basePath}/${typePath}/data'
                ,page: true
                ,height: 'full-130'//最大高度-20  full-20
                , limit:10
                //,width: 300
                ,cellMinWidth: 40
                ,cols: [[
                    {type:'numbers', fixed: 'left'}
                    ,{templet:"#radioTpl" , fixed: 'left',width:70}
                    ,{field:'id', title:'ID', unresize: true, sort: true ,display:'none'}
                    ,{field:'name', title:'名称'}
                    ,{fixed: 'right', title:'操作', toolbar: '#barDemo', minWidth:200}
                ]]
                ,done: function(res, curr, count){
                    $("[data-field='id']").css('display','none');//隐藏列表
                }
            });
        }
        function renderTwo(sectionid) {
            table.render({
                elem: '#table_two'
                ,url: '${basePath}/process/data'
                //,page: true
                ,height: 'full-130'//最大高度-20  full-20
                , limit:1000
                //,width: 300
                ,cellMinWidth: 40
                ,cols: [[
                    {type:'numbers', fixed: 'left'}
                    //,{templet:"#radioTpl" , fixed: 'left',width:55}
                    ,{field:'id', title:'ID', unresize: true, sort: true ,display:'none'}
                    ,{field:'sectionname', title:'工段'}
                    ,{field:'name', title:'名称'}
                    ,{fixed: 'right', title:'操作', toolbar: '#barDemo', minWidth:200}
                ]]
                ,where: {
                    sectionid: sectionid
                }
                ,done: function(res, curr, count){
                    $("[data-field='id']").css('display','none');//隐藏列表
                }
            });
        }


    });
</script>

</body>
</html>