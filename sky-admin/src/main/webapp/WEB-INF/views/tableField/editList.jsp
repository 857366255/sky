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
    <link rel="stylesheet" href="${basePath}/UI/layuiSky/layui/css/layui.css"  media="all">
    <%--<link rel="stylesheet" href="${basePath}/UI/layuiSky/sky/css/edit-list.css"  media="all">--%>
    <style rel="stylesheet">
        [lay-event="inputType"] {
            top: -5px !important;
        }
        [lay-event="inputType"] .layui-table-cell{
            padding: 0px 0 !important;
            overflow: visible  !important;//解决:下拉框被覆盖
        }
    </style>
</head>
<body style="height: 100%;">
<script type="text/html" id="inputType">
    <select  lay-verify="required" lay-search="" lay-filter="inputType">
        <option {{ d.inputType=='text' ? 'selected' : '' }}>text</option>
        <option {{ d.inputType=='checkbox' ? 'selected' : '' }}>checkbox</option>
        <option {{ d.inputType=='select' ? 'selected' : '' }}>select</option>
        <option {{ d.inputType=='textarea' ? 'selected' : '' }}>textarea</option>
    </select>
</script>
<table id="table_one" lay-filter="table_one"></table>

<script src="${basePath}/UI/layuiSky/layui/layui.js" charset="utf-8"></script>
<script>
    layui.use(['table','layer','form'], function(){
        var table = layui.table, $ = layui.jquery,layer = layui.layer,form = layui.form;;
        renderOne();
        //监听工具条
        var tableRowData=null;
        table.on('tool(table_one)', function(obj){
            var data = obj.data;
            if(obj.event === 'inputType'){
                tableRowData = data;
               // eval("tableSelectData.obj.update({"+tableSelectData.event+":data.value})");
                //layer.msg(data.fieldEn+'字段输入类型修改为:');
            }
        });
        //监听下拉框选择
        form.on('select(inputType)', function(data){
            if(tableRowData == null) return;
            var layerload = layer.load(0);
            var fieldEn = tableRowData.fieldEn
            $.ajax({
                url: "${basePath}/${typePath}/edit",
                type: 'PUT',
                contentType : 'application/json;charset=utf-8',
                dataType:"json",
                data :JSON.stringify({inputType:data.value,id:tableRowData.id}),
                success: function(d) {
                    layer.msg(fieldEn+'字段输入类型修改为:'+data.value);
                    layer.close(layerload);
                },error : function(d) {
                    layer.msg('同步失败');
                    layer.close(layerload);
                }
            });
            tableRowData = null;
            /*console.log(data.elem); //得到select原始DOM对象
            console.log(data.value); //得到被选中的值
            console.log(data.othis); //得到美化后的DOM对象*/
        });


        function renderOne() {
            table.render({
                elem: '#table_one'
                ,url: '${basePath}/${typePath}/editListData'
                //,page: true
                ,height: 'full-20'//最大高度-20  full-20
                , limit:100
                //,width: 300
                ,cellMinWidth: 40
                ,cols: [[
                    {type:'checkbox', fixed: 'left'}
                    ,{type:'numbers', fixed: 'left'}
                    ,{field:'id', title:'ID', unresize: true, sort: true ,display:'none'}
                    ,{field:'tableEn', title:'表'}
                    ,{field:'fieldEn', title:'字段'}
                    ,{field:'inputType', title:'输入类型' ,templet:'#inputType' ,event:'inputType'}
                ]]
                ,where:{
                    tableEn:'${tableEn}'
                }
                ,done: function(res, curr, count){
                    //$("[data-field='id']").css('display','none');//隐藏列表
                }
            });
        }


    });
</script>

</body>
</html>