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

    <title>列表</title>
    <link rel="shortcut icon" href="<%=basePath%>/UI/sky/favicon.ico">
    <link href="<%=basePath%>/UI/sky/css/bootstrap.min.css?" rel="stylesheet">
    <link href="<%=basePath%>/UI/sky/css/font-awesome.min.css" rel="stylesheet">
    <link href="<%=basePath%>/UI/sky/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="<%=basePath%>/UI/sky/css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath%>/UI/sky/css/style.min.css" rel="stylesheet">
</head>

<body>
<div class="ibox float-e-margins">
    <div class="ibox-content">
        <div class="row row-lg">
            <div class="col-sm-12">
                <div class="example-wrap">
                    <div class="example">
                        <div class="btn-group" id="toolbar" role="group">
                            <button data-toggle="modal" type="button" class="btn btn-outline btn-default"
                                    href="#add-modal-form">
                                <i class="glyphicon glyphicon-plus" aria-hidden="true">新增</i>
                            </button>
                        </div>
                        <table id="listTable"></table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="<%=basePath%>/UI/sky/js/jquery.min.js?v=2.1.4"></script>
<script src="<%=basePath%>/UI/sky/js/bootstrap.min.js?v=3.3.6"></script>
<script src="<%=basePath%>/UI/sky/js/content.min.js?v=1.0.0"></script>
<script src="<%=basePath%>/UI/sky/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="<%=basePath%>/UI/sky/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
<script src="<%=basePath%>/UI/sky/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="<%=basePath%>/UI/sky/js/demo/bootstrap-table-demo.min.js"></script>

<script type="text/javascript">
    $(function () {
        //1.初始化Table
        var oTable = new TableInit();
        oTable.Init(${listParams});
    });/**/

    var TableInit = function () {
        var oTableInit = new Object();
        //初始化Table
        oTableInit.Init = function (params) {
            $('#listTable').bootstrapTable({
                url: "../data"+params.url,//'/Interface/GetData',         //请求后台的URL（*）
                method: params.method,//'get',                      //请求方式（*）
                toolbar: '#toolbar',                //工具按钮用哪个容器
                striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true,                   //是否显示分页（*）
                sortable: false,                     //是否启用排序
                sortOrder: "asc",                   //排序方式
                queryParams: oTableInit.queryParams,//传递参数（*）
                sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
                pageNumber: params.pageNumber,//1,                       //初始化加载第一页，默认第一页
                pageSize: params.pageSize,//10,                       //每页的记录行数（*）
                pageList: params.pageList,//[10, 25, 50, 100],        //可供选择的每页的行数（*）
                search: false,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                contentType: "application/x-www-form-urlencoded",
                strictSearch: true,
                showColumns: true,                  //是否显示所有的列
                showRefresh: true,                  //是否显示刷新按钮
                minimumCountColumns: 2,             //最少允许的列数
                clickToSelect: true,                //是否启用点击选中行
                height: params.height,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId: params.uniqueId,//"no",                     //每一行的唯一标识，一般为主键列
                showToggle: true,                    //是否显示详细视图和列表视图的切换按钮
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                columns: params.columns
            });

        };
        //得到查询的参数
        oTableInit.queryParams = function (params) {
            var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                limit: params.limit,   //页面大小
                offset:params.offset,
                query:query()
            };
            return temp;
        };
        return oTableInit;
    };
</script>
</body>
</html>