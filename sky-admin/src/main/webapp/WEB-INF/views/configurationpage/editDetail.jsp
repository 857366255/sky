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
<html>

<head>
    <title>编辑</title>
    <link rel="stylesheet" href="${basePath}/UI/test/layuiSky/layui/css/layui.css"  media="all">
    <style rel="stylesheet">
        .layui-table-cell {
            height: 28px;
            line-height: 28px;
            padding: 0 15px;
            position: relative;
            overflow: visible;//解决:下拉框被覆盖
            text-overflow: ellipsis;
            white-space: nowrap;
            box-sizing: border-box;
        }
    </style>
</head>
<body>

<script type="text/html" id="isshowlist">
    <input type="checkbox" lay-skin="switch" lay-text="显示|隐藏" {{ d.isshowlist ? 'checked' : '' }}>
</script>
<script type="text/html" id="isedit">
    <input type="checkbox" lay-skin="switch" lay-text="编辑|禁用" {{ d.isedit ? 'checked' : '' }}>
</script>
<script type="text/html" id="isquery">
    <input type="checkbox" lay-skin="switch" lay-text="显示|隐藏" {{ d.isquery ? 'checked' : '' }}>
</script>
<script type="text/html" id="isquery">
    <input type="checkbox" lay-skin="switch" lay-text="显示|隐藏" {{ d.isquery ? 'checked' : '' }}>
</script>
<script type="text/html" id="inputtype">
    <select  lay-verify="required" lay-search="" lay-filter="inputtype">
        <option {{ d.inputtype=='text' ? 'selected' : '' }}>text</option>
        <option >checkbox</option>
        <option>select</option>
        <option>textarea</option>
    </select>
</script>




<div class="layui-row" style="height: 100%">
    <div class="layui-col-xs3">
        <form:form class="layui-form" action="${basePath}/configurationpage/editDetail/edit" method="post" modelAttribute="configurationpage" >
            <c:if test="${configurationpage.id != null }">
                <form:hidden path="id" />
                    <%--<input type="hidden" name="_method" value="PUT" />--%>
            </c:if>
            <fieldset class="layui-elem-field">
                <legend>名称</legend>
                <div class="layui-field-box">
                    <form:input lay-verify="title" autocomplete="off" placeholder="请输入" class="layui-input" type="text" path="name"></form:input>
                </div>
            </fieldset>
            <fieldset class="layui-elem-field layui-field-title">
                <legend>表名称</legend>
                <div class="layui-field-box">
                    <form:select items="${databaseTables}" lay-verify="required" itemLabel="tableEn" itemValue="tableEn"  path="tableEn"></form:select>
                </div>
            </fieldset>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button id="submit" class="btn btn-primary"  lay-filter="submit" style="display: none;" lay-submit>立即提交</button><%----%>
                        <%--<button class="layui-btn layui-btn-primary" lay-submit lay-filter="demo1">重置</button>--%>
                </div>
            </div>
        </form:form>

    </div>
    <div class="layui-col-xs*">
        <%--<div class="layui-btn-group demoTable">
            <button class="layui-btn" data-type="isAll" id="addTable">添加</button>
        </div--%>
        <table id="skyList" lay-filter="skyList"></table>
    </div>
</div>

<script src="${basePath}/UI/test/layuiSky/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['table', 'layedit', 'laydate','form'], function(){
        var table = layui.table, $ = layui.jquery,layer = layui.layer,form = layui.form;
        table.render({
            elem: '#skyList'
            ,url: '${basePath}/field/data'
            ,page: false
            ,height: 'full-20'//最大高度-20  full-20
            ,limit:10000
            //,skin: 'line' //行边框风格
            ,even: true //开启隔行背景
          //  ,size: 'sm' //小尺寸的表格
           // ,width: 'full'
            ,cellMinWidth: 50
            ,cols: [[
                {type:'numbers', /*fixed: 'left',*/ rowspan: 2,width:50 }
                ,{field:'id', title:'ID', unresize: true, sort: true ,display:'none' , rowspan: 2}
                ,{field:'isshowlist', title:'是否显示列表' ,width:60, rowspan: 2}
                ,{field:'isedit', title:'是否编辑' ,width:100, rowspan: 2}
                ,{field:'isquery', title:'是否查询',width:100, rowspan: 2}
                ,{field:'configurationpageId', title:'配置页面id' ,width:100 , rowspan: 2}
                ,{field:'tableEn', title:'表名称' ,width:100, rowspan: 2}
                ,{field:'fieldEn', title:'字段名称' ,width:100, rowspan: 2}
                ,{field:'inputtype', title:'输入框类型' ,width:100, rowspan: 2}
                ,{event:'inputtype', title:'输入框类型', templet: '#inputtype',width:100, rowspan: 2}
                ,{field:'name', title:'名称' ,edit: 'text',width:60, rowspan: 2}
                ,{align:'center',title:'列表' , colspan: 2}
                ,{align:'center',title:'编辑' , colspan: 2}
                ,{align:'center',title:'查询' , colspan: 3}
            ],[
                {field:'listsorting', title:'排序号' ,edit: 'text',width:80}
                ,{event:'isshowlist', title:'是否显示' , templet: '#isshowlist',width:100, align:'center'}
                ,{field:'editsorting', title:'排序号' ,edit: 'text',width:80}
                ,{event:'isedit', title:'是否编辑' ,  templet: '#isedit',width:100, align:'center'}
                ,{field:'querysorting', title:'排序号' ,edit: 'text',width:80}
                ,{event:'isquery', title:'是否查询' ,templet: '#isquery',width:100, align:'center'}
                ,{field:'querytype', title:'查询类型' ,edit: 'text',width:100}

            ]/**/]
            ,where: {
                id: ${configurationpage.id}
            }
            ,done: function(res, curr, count){
                $("[data-field='id']").css('display','none');//隐藏列表
                $("[data-field='isshowlist']").css('display','none');
                $("[data-field='isedit']").css('display','none');
                $("[data-field='isquery']").css('display','none');
                $("[data-field='configurationpageId']").css('display','none');
                $("[data-field='inputtype']").css('display','none');
            }
        });

        var tableSelectData=null;
        table.on('tool(skyList)', function(obj){
            var data = obj.data;
            var event = obj.event;
            var checkboxEvent = ["isshowlist","isedit","isquery"];
            var selectEvent = ["inputtype"];
            if($.inArray(event,checkboxEvent)!=-1){
                eval("obj.update({"+event+":this.firstElementChild.firstElementChild.checked})");
            } else if($.inArray(event,selectEvent)!=-1){
                tableSelectData={obj:obj,event:event};
            } else if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del();
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                layer.alert('编辑行：<br>'+ JSON.stringify(data))
            }
        });
        //监听下拉框选择
        form.on('select(inputtype)', function(data){
            if(tableSelectData==null) return;
            eval("tableSelectData.obj.update({"+tableSelectData.event+":data.value})");
            tableSelectData=null;
            /*console.log(data.elem); //得到select原始DOM对象
            console.log(data.value); //得到被选中的值
            console.log(data.othis); //得到美化后的DOM对象*/
        });
        //监听提交
        form.on('submit(submit)', function(data){
            var fieldList =  table.cache["skyList"];
           // data.field.fieldList = fieldList;
            var actionData = {configurationPage: data.field,fieldList:fieldList};
            $.ajax({
                url: data.form.action,
                type: 'PUT',
                contentType : 'application/json;charset=utf-8',
                dataType:"json",
                data :JSON.stringify(actionData),//JSON.stringify({id: 2, name: "李四"})
                success: function(data) {
                    return false;
                },error : function(data) {
                    alert("失败");
                    return false;
                }
            });
            return false;
        });
    });
</script>

</body>
</html>