<%--
  Created by IntelliJ IDEA.
  User: wz
  Date: 2017/10/16
  Time: 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String basePath = request.getContextPath();
%>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>配置页面</title>
    <link rel="shortcut icon" href="<%=basePath%>/resources/sky/favicon.ico">
    <link href="<%=basePath%>/resources/sky/css/bootstrap.css" rel="stylesheet">
    <link href="<%=basePath%>/resources/sky/css/font-awesome.min.css" rel="stylesheet">
    <link href="<%=basePath%>/resources/sky/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="<%=basePath%>/resources/sky/css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath%>/resources/sky/css/style.css" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="<%=basePath%>/resources/sky/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <style type="text/css">
        /*label {width: 200px;}*/
    </style>
</head>

<body>
<%--<div class="ibox float-e-margins">
    <div class="ibox-content">

            <div class="col-sm-12">--%>
               <%-- <div class="example-wrap">
                    <div class="example">--%>
                        <table id="listTable"></table>
                  <%--  </div>
                </div>--%>
<%--            </div>

    </div>
</div>--%>

<script src="<%=basePath%>/resources/sky/js/jquery.min.js?v=2.1.4"></script>
<script src="<%=basePath%>/resources/sky/js/bootstrap.min.js?v=3.3.6"></script>
<script src="<%=basePath%>/resources/sky/js/content.min.js?v=1.0.0"></script>
<script src="<%=basePath%>/resources/sky/js/plugins/layer/layer.js"></script>
<script src="<%=basePath%>/resources/sky/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>

<script src="<%=basePath%>/resources/sky/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>

<script src="<%=basePath%>/resources/sky/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<!-- Sweet Alert -->
<script src="<%=basePath%>/resources/sky/js/plugins/sweetalert/sweetalert.min.js"></script>

<script type="text/javascript">
    $(function () {
        //1.初始化Table
        var oTable = new TableInit();
        oTable.Init();
        $("#btn_query").click(function(){
            $('#listTable').bootstrapTable('refresh');//刷新数据
        });
    });/**/

    var TableInit = function () {
        var oTableInit = new Object();
        //初始化Table
        oTableInit.Init = function () {
            $('#listTable').bootstrapTable({
                url:'../data/${id}',//'/Interface/GetData',         //请求后台的URL（*）
                method: 'get',//'get',                      //请求方式（*）
                toolbar: '#toolbar',                //工具按钮用哪个容器
                striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: false,                   //是否显示分页（*）
                sortable: false,                     //是否启用排序
                sortOrder: "asc",                   //排序方式
                queryParams: oTableInit.queryParams,//传递参数（*）
                sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
                pageNumber: 1,                       //初始化加载第一页，默认第一页
                pageSize: 10,                      //每页的记录行数（*）
                pageList: [10,25,50,100],       //可供选择的每页的行数（*）
                search: false,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                contentType: "application/x-www-form-urlencoded",
                strictSearch: true,
                showColumns: false,                  //是否显示所有的列
                showRefresh: false,                  //是否显示刷新按钮
                minimumCountColumns: 2,             //最少允许的列数
                clickToSelect: true,                //是否启用点击选中行
                height: 550,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId: "coding",//"no",                     //每一行的唯一标识，一般为主键列
                showToggle: false,                    //是否显示详细视图和列表视图的切换按钮
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                columns: [{
                    field: 'sortingQuery',
                    title: '查询排序'
                },{
                    field: 'coding',
                    title: '唯一标识符',
                    visible:false
                },{
                    field: 'configurationPageCoding',
                    title: '配置页面编码',
                    visible:false
                },{
                    field: 'tableEn',
                    title: '数据库表名',
                    visible:false
                },{
                    field: 'fieldEn',
                    title: '数据库字段名称',
                    visible:false
                }, {
                    field: 'name',
                    title: '名称'
                },{
                    field: 'query',
                    title: '是否显示'
                },{
                    field: 'queryType',
                    title: '查询条件类型'
                },{
                    field: 'operate',
                    title: '操作',
                    events:'operateEvents',
                    formatter:'operateFormatter'
                } ]
            });

        };
        //得到查询的参数
        oTableInit.queryParams = function (params) {
            var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                limit: params.limit,   //页面大小
                offset:params.offset
            };
            return temp;
        };
        return oTableInit;
    };


    function operateFormatter(value, row, index) {//赋予的参数
        return [
            '<button type="button" class="update btn btn-outline btn-default btn-sm" ><i class="fa fa-wrench" aria-hidden="true"></i>修改</button>',
        ].join('');
    }

    window.operateEvents = {
       'click .update': function (e, value, row, index) {
            layer.open({
                type: 2,
                title: '更新:'+row.name,
                shade: 0,//遮罩shade: [0.8, '#393D49']
                maxmin: true,//放大和缩小
                tipsMore: true,//是否允许多个tips
                area: ['60%', '60%'],
                content: '${pageContext.request.contextPath}/queryField/update/'+row.coding //iframe的url
                ,end:function(layero, index){//销毁后触发的回调
                    $('#listTable').bootstrapTable('refresh');//刷新数据
                }
                ,btn: ['保存', '取消'] //可以无限个按钮
                ,btn1: function(index, layero){
                    window.frames["layui-layer-iframe"+index].document.getElementById("save").click();//执行弹出窗口里的保存按钮
                    layer.close(index);//关闭
                },btn2: function(index, layero){
                    layer.close(index);//关闭
                }

            });
        }
    };

</script>
</body>
</html>