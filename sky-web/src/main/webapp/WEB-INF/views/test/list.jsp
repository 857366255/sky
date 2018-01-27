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
    <link href="<%=basePath%>/UI/sky/css/bootstrap.css" rel="stylesheet">
    <link href="<%=basePath%>/UI/sky/css/font-awesome.min.css" rel="stylesheet">
    <link href="<%=basePath%>/UI/sky/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="<%=basePath%>/UI/sky/css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath%>/UI/sky/css/style.css" rel="stylesheet">
    <style type="text/css">
        /*label {width: 200px;}*/
    </style>
</head>

<body>
<div class="ibox float-e-margins">
    <div class="ibox-content">
        <div class="row row-lg">
            <div id="query" class="col-md-12">
                <c:forEach items="${listFinds}" var="listFind">
                    <div class="col-md-3">
                        <div class="input-group">
                            <label class="input-group-addon">${listFind.name}</label>
                            <input type="text" class="form-control" placeholder="请输入用户名" id="${listFind.fieldEn}">
                        </div>
                    </div>
                </c:forEach>

<%--
                <div class="col-md-2">
                    <input type="text" class="form-control" id="stuNo" placeholder="请输入名称"/>
                </div>
                <div class="col-md-4">
                    <input type="text" class="form-control" id="stuName" placeholder="请输入价格"/>
                </div>--%>
                <div class="col-md-2" style="text-align:left;">
                    <button type="button" style="margin-left:50px" id="btn_query" class="btn btn-primary">查询</button>
                </div>
            </div>
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

<script type="text/javascript">
    $(function () {
        //1.初始化Table
        var oTable = new TableInit();
        oTable.Init(${listParams});
        $("#btn_query").click(function(){
            $('#listTable').bootstrapTable('refresh');//刷新数据
        });
    });/**/

    var TableInit = function () {
        var oTableInit = new Object();
        //初始化Table
        oTableInit.Init = function (params) {
            $('#listTable').bootstrapTable({
                url:params.url,//'/Interface/GetData',         //请求后台的URL（*）
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
    function query() {
        var q = new Object();
        var $query = $("#query input");
        for(var i=0;i<$query.length;i++){
            var temp = $query[i];
            if(temp.value==null)continue;//查询条件为空时不传入后台
            var value = temp.value.replace(/(^\s*)|(\s*$)/g, "");//去除前后空格
            if(value=="")continue;//查询条件为""时不传入后台
            q[temp.id]=value;
        }
        return q;
    }
</script>
</body>
</html>