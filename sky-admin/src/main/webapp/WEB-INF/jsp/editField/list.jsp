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

    <link href="<%=basePath%>/resources/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet">
    <style type="text/css">
        /*label {width: 200px;}*/
    </style>
</head>

<body>
<div class="ibox float-e-margins">
    <div class="ibox-content">

            <div class="col-sm-12">
                <div class="example-wrap">
                    <div class="example">
                        <table id="listTable"></table>
                    </div>
                </div>
            </div>

    </div>
</div>

<script src="<%=basePath%>/resources/sky/js/jquery.min.js?v=2.1.4"></script>
<script src="<%=basePath%>/resources/sky/js/bootstrap.min.js?v=3.3.6"></script>
<script src="<%=basePath%>/resources/sky/js/content.min.js?v=1.0.0"></script>
<script src="<%=basePath%>/resources/sky/js/plugins/layer/layer.js"></script>
<script src="<%=basePath%>/resources/sky/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>

<script src="<%=basePath%>/resources/bootstrap3-editable/js/bootstrap-editable.js"></script>
<script src="<%=basePath%>/resources/bootstrap3-editable/js/bootstrap-table-editable.js"></script>

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
                pagination: true,                   //是否显示分页（*）
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
                showColumns: true,                  //是否显示所有的列
                showRefresh: true,                  //是否显示刷新按钮
                minimumCountColumns: 2,             //最少允许的列数
                clickToSelect: true,                //是否启用点击选中行
                height: 560,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId: "coding",//"no",                     //每一行的唯一标识，一般为主键列
                showToggle: true,                    //是否显示详细视图和列表视图的切换按钮
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                columns: [{
                    field: 'coding',
                    title: '唯一标识符',
                    editable:true
                }, {
                    field: 'name',
                    title: '名称',

                    cellStyle:function(value,row,index) {return {"css":{padding:'0px', width: '100px'}};},
                    editable:{
                        type: 'text',
                        title: '用户名',
                        clear:false,
                        mode:'inline',
                        showbuttons:false,
                        sortable:true
                    }/*,{field: 'number',title: '数量', sortable:true,
                     cellStyle:function(value,row,index) {
                     return {
                     "css":{
                     padding:'0px'
                     }
                     };
                     },
                     formatter:function(value,row,index){
                     if(value == undefined) return "0";
                     else return value;
                     },
                     editable:{
                     type:'text',
                     clear:false,
                     validate:function(value){
                     if(isNaN(value)) return {newValue:0, msg:'只允许输入数字'};
                     else if(value<0) return {newValue:0, msg:'数量不能小于0'};
                     else if(value>=1000000) return {newValue:0, msg:'当前最大只能输入999999'};
                     },
                     display:function(value){
                     $(this).text(Number(value));
                     },
                     //onblur:'ignore',
                     showbuttons:false,
                     defaultValue:0,
                     mode:'inline'
                     }
                     } */
                }, {
                    field: 'tableEn',
                    title: '数据库表名'
                }, {
                    field: 'pkFieldEn',
                    title: '数据库表主键字段'
                } , {
                    field: 'operate',
                    title: '操作',
                    events:'operateEvents',
                    formatter:'operateFormatter'
                }]
                ,onEditableHidden: function(field, row, $el, reason) { // 当编辑状态被隐藏时触发
                    if(reason === 'save') {
                        var $td = $el.closest('tr').children();
                        $td.eq(-1).html((row.price*row.number).toFixed(2));
                        $el.closest('tr').next().find('.editable').editable('show'); //编辑状态向下一行移动
                    } else if(reason === 'nochange') {
                        $el.closest('tr').next().find('.editable').editable('show');
                    }
                }
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
                title: '更新',
                shade: 0,//遮罩shade: [0.8, '#393D49']
                maxmin: true,//放大和缩小
                tipsMore: true,//是否允许多个tips
                area: ['50%', '50%'],
                content: '${pageContext.request.contextPath}/configurationpage/update/'+row.coding //iframe的url
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