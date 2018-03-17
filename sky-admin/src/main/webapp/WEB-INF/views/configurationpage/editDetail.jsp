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
<div class="layui-row" style="height: 100%">
    <div class="layui-col-xs3">
        <form:form class="layui-form" action="${basePath}/configurationpage/edit" method="post" modelAttribute="configurationpage" >
            <c:if test="${configurationpage.id != null }">
                <form:hidden path="id" />
                <input type="hidden" name="_method" value="PUT" />
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
                    <button id="submit" class="btn btn-primary" type="submit" style="display: none;">立即提交</button>
                        <%--<button type="reset" class="layui-btn layui-btn-primary">重置</button>--%>
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
    layui.use(['table', 'layedit', 'laydate'], function(){
        var table = layui.table, $ = layui.jquery,layer = layui.layer;
        table.render({
            elem: '#skyList'
            ,url: '${basePath}/configurationpage/data'
            ,page: false
            ,height: 'full-20'//最大高度-20  full-20
            , limit:10000
            //,width: 500
            ,cellMinWidth: 80
            ,cols: [[
                {type:'numbers', fixed: 'left'}
               // ,{type: 'checkbox', fixed: 'left'}
                ,{field:'id', title:'ID', unresize: true, sort: true ,display:'none'}
                ,{field:'name', title:'名称' ,edit: 'text',width:100}
                ,{field:'tableEn', title:'表名称',width:200}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
            ]]
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


    });
</script>

</body>
</html>