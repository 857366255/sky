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
    <title>列表</title>
    <link rel="stylesheet" href="${basePath}/UI/test/layuiSky/layui2.2.5/css/layui.css"  media="all">
    <link rel="stylesheet" href="${basePath}/UI/test/layuiSky/sky/css/edit-list.css"  media="all">
</head>
<body style="height: 100%;">
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/html" id="checkboxTpl">
    <input type="checkbox" name="" title="锁定" checked>
</script>
<script type="text/html" id="switchTpl">
    <input type="checkbox" name="yyy" lay-skin="switch" lay-text="女|男">
</script>


<div class="layui-btn-group demoTable">
    <button class="layui-btn" data-type="getCheckData">获取选中行数据</button>
    <button class="layui-btn" data-type="getCheckLength">获取选中数目</button>
    <button class="layui-btn" data-type="isAll">验证是否全选</button>


    <button class="layui-btn" data-type="isAll" id="addTable">验证是否全选</button>
</div>

<table id="test2" lay-filter="test2"></table>
<%--<table class="layui-table" lay-data="{url:'${basePath}/UI/test/json/demo1.json', id:'test3'}" lay-filter="test3">
    <thead>
    <tr>
        <th lay-data="{type:'checkbox'}">ID</th>
        <th lay-data="{field:'id', width:80, sort: true}">ID</th>
        <th lay-data="{field:'username', width:120, sort: true, edit: 'text'}">用户名</th>
        <th lay-data="{field:'email', edit: 'text', minWidth: 150}">邮箱</th>
        <th lay-data="{field:'sex', width:80, edit: 'text'}">性别</th>
        <th lay-data="{field:'city', edit: 'text', minWidth: 100}">城市</th>
        <th lay-data="{field:'experience', sort: true, edit: 'text'}">积分</th>
    </tr>
    </thead>
</table>--%>


<script src="${basePath}/UI/test/layuiSky/layui2.2.5/layui.js" charset="utf-8"></script>

<script>
    layui.use('table', function(){
        var table = layui.table, $ = layui.jquery;
        table.render({
            elem: '#test2'
            ,url: '${basePath}/UI/test/json/demo1.json'
            ,page: true
            ,height: 'full-60'//最大高度-20  full-20
            , limit:30
            //,width: 500
            ,cellMinWidth: 80
            ,cols: [[
                {type:'numbers', fixed: 'left'}
                ,{type: 'checkbox', fixed: 'left'}
                ,{field:'id', title:'ID', unresize: true, sort: true ,display:'none'}
                ,{field:'username', title:'用户名',edit: 'text', templet: '#usernameTpl'}
                ,{field:'email', title:'邮箱'}
                ,{field:'sex', title:'性别', templet: '#switchTpl', minWidth: 85, align:'center'}
                ,{field:'lock', title:'是否锁定', templet: '#checkboxTpl', minWidth: 110, align:'center'}
                ,{field:'city', title:'城市'}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
            ]]
        });

        //点击加号按钮时，新添一行
        $("#addTable").click(function(){
            var oldData =  table.cache["test2"];
            var data1={
                "id": null
                ,"username": null
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
            table.reload('test2',{
                data : oldData
                ,url:false
            });
        });


    });
</script>

</body>
</html>