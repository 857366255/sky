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
</head>
<body>

<script type="text/html" id="switchTpl">
    <!-- 这里的 checked 的状态只是演示 -->
    <input type="checkbox" name="isquery"  lay-skin="switch" lay-text="女|男" lay-filter="sexDemo" >
</script>

<script type="text/html" id="checkboxTpl">
    <!-- 这里的 checked 的状态只是演示 -->
    <%--<input type="checkbox" name="isshowlist"  title="锁定" lay-filter="lockDemo" checked>--%>
    <input type="checkbox" name="isshowlist" title="1" checked>
</script>

<%--<script type="text/html" id="checkboxTpl">
    <input type="checkbox" name="isshowlist" title="1" checked>

    &lt;%&ndash;<input name="like1[write]" lay-skin="primary" title="写作" checked="" type="checkbox">&ndash;%&gt;
</script>
<script type="text/html" id="switchTpl">
    <input type="checkbox" name="isquery" lay-skin="switch" lay-text="女|男">
</script>--%>
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
            , limit:10000
            //,width: 500
            ,cellMinWidth: 80
            ,cols: [[
                {type:'numbers', fixed: 'left' , rowspan: 2}
                ,{field:'id', title:'ID', unresize: true, sort: true ,display:'none' , rowspan: 2}
                ,{title:'配置页面' ,edit: 'text',width:100 ,rowspan:2}
                ,{field:'configurationpageId', title:'配置页面id' ,edit: 'text',width:100 , rowspan: 2}
                ,{field:'tableEn', title:'表名称en' ,edit: 'text',width:100, rowspan: 2}
                ,{field:'fieldEn', title:'字段名称en' ,edit: 'text',width:100, rowspan: 2}
                ,{field:'inputtype', title:'输入框类型' ,edit: 'text',width:100, rowspan: 2}
                ,{field:'name', title:'名称' ,edit: 'text',width:100, rowspan: 2}
                ,{align:'center',title:'列表' , colspan: 2}
                ,{align:'center',title:'编辑' , colspan: 2}
                ,{align:'center',title:'查询' , colspan: 3}
            ],[
                {field:'isshowlist', title:'是否显示列表' , templet: '#checkboxTpl',width:100}
                ,{field:'listsorting', title:'列表排序号' ,edit: 'text',width:100}
                ,{field:'isedit', title:'是否编辑' ,  edit: 'text',width:100}
                ,{field:'editsorting', title:'编辑排序号' ,edit: 'text',width:100}
                ,{field:'isquery', title:'是否查询' ,templet: '#switchTpl', event: 'isquery',width:100}
                ,{field:'querytype', title:'查询类型' ,edit: 'text',width:100}
                ,{field:'querysorting', title:'查询排序号' ,edit: 'text',width:100}
                /*,{field:'sex', title:'性别', width:85, templet: '#switchTpl', unresize: true}
                ,{field:'lock', title:'是否锁定', width:110, templet: '#checkboxTpl', unresize: true}*/
            ]/**/]
            ,where: {
                id: ${configurationpage.id}
            }
            ,done: function(res, curr, count){
                $("[data-field='id']").css('display','none');//隐藏列表
            }
        });

        //点击加号按钮时，新添一行
        $("#addTable").click(function(){
            var oldData =  table.cache["skyList"];
            var data1={
                "id": null
                ,"": null
                ,"email": null
                ,"sex": "男"
                ,"city": "浙江杭州"
                ,"sign": "君不见，黄河之水天上来，奔流到海不复回。 君不见，高堂明镜悲白发，朝如青丝暮成雪。 人生得意须尽欢，莫使金樽空对月。 天生我材必有用，千金散尽还复来。 烹羊宰牛且为乐，会须一饮三百杯。 岑夫子，丹丘生，将进酒，杯莫停。 与君歌一曲，请君为我倾耳听。(倾耳听 一作：侧耳听) 钟鼓馔玉不足贵，但愿长醉不复醒。(不足贵 一作：何足贵；不复醒 一作：不愿醒/不用醒) 古来圣贤皆寂寞，惟有饮者留其名。(古来 一作：自古；惟 通：唯) 陈王昔时宴平乐，斗酒十千恣欢谑。 主人何为言少钱，径须沽取对君酌。 五花马，千金裘，呼儿将出换美酒，与尔同销万古愁。"
                ,"experience": "9"
                ,"ip": "192.168.0.8"
                ,"logins": "106"
                ,"joinTime": "2016-10-14"
                ,"LAY_CHECKED": true
            };
            oldData.push(data1);
            table.reload('skyList',{
                data : oldData
                ,url:false
            });
        });

        table.on('tool(skyList)', function(obj){
            var data = obj.data;
            if(obj.event === 'isquery'){
                layer.msg('ID：'+ data.id + ' 的查看操作');
                obj.update({isquery:this.innerText});

            } else if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del();
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                layer.alert('编辑行：<br>'+ JSON.stringify(data))
            }
        });

        //监听性别操作
        /*form.on('switch(sexDemo)', function(obj){
            layer.tips(this.value + ' ' + this.name + '：'+ obj.elem.checked, obj.othis);
        });

        //监听锁定操作
        form.on('checkbox(lockDemo)', function(obj){
            layer.tips(this.value + ' ' + this.name + '：'+ obj.elem.checked, obj.othis);
        });*/
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
                    alert("删除失败");
                    return false;
                }
            });
            return false;
        });


    });
</script>

</body>
</html>