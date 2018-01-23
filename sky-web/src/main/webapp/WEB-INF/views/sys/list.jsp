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

    <title>菜单栏设置</title>
    <link rel="shortcut icon" href="<%=basePath%>/UI/sky/favicon.ico">
    <link href="<%=basePath%>/UI/sky/css/bootstrap.min.css?" rel="stylesheet">
    <link href="<%=basePath%>/UI/sky/css/font-awesome.min.css" rel="stylesheet">
    <link href="<%=basePath%>/UI/sky/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="<%=basePath%>/UI/sky/css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath%>/UI/sky/css/style.min.css" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="<%=basePath%>/UI/sky/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
</head>

<body>
<div class="ibox float-e-margins">
    <div class="ibox-content">
        <div class="row row-lg">
            <div class="col-sm-12">
                <div class="col-sm-2">
                    <input type="text" class="form-control" id="stuNo" placeholder="请输入名称"/>
                </div>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="stuName" placeholder="请输入价格"/>
                </div>
                <div class="col-sm-2">
                    <button class="btn btn-primary btn-sm" id="searchBtn">查询</button>
                    <button class="btn btn-sm" id="resetBtn">重置</button>
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
                            <%--<button type="button" class="btn btn-outline btn-default">
                                <i class="glyphicon glyphicon-heart" aria-hidden="true"></i>
                            </button>
                            <button type="button" class="btn btn-outline btn-default">
                                <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
                            </button>--%>
                            <%--<button data-toggle="modal" type="button" class="btn btn-outline btn-default" href="#modal-form">
                                <i class="glyphicon glyphicon-plus" aria-hidden="true">打开登录窗口</i>
                            </button>
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-outline btn-default" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">更多<span class="caret"></span></button>
                                <ul class="dropdown-menu">
                                    <li><a href="#">更多1</a></li>
                                    <li><a href="#">更多2</a></li>
                                </ul>
                            </div>--%>
                        </div>

                        <table id="listTable"></table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal inmodal fade" id="add-modal-form" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button id="closeCreate" type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                        class="sr-only">Close</span></button>
                <h1 class="modal-title">添加</h1>
            </div>
            <iframe id="createIframe" class="J_iframe" name="iframe0" width="100%" height="100%"
                            src="${pageContext.request.contextPath}/configuration/edit/s_menu"
                            frameborder="0" data-id="index_v1.html" seamless></iframe>
            <div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary">保存</button>
            </div>
        </div>
    </div>
</div>
<div class="modal inmodal fade" id="modal-form" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title">窗口标题</h4>
                <small class="font-bold">这里可以显示副标题。</small>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-12 b-r">
                        <form role="form">
                            <div class="form-group">
                                <label>用户名：</label>
                                <input type="email" placeholder="请输入用户名" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>密码：</label>
                                <input type="password" placeholder="请输入密码" class="form-control">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary">保存</button>
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
<!-- Sweet Alert -->
<script src="<%=basePath%>/UI/sky/js/plugins/sweetalert/sweetalert.min.js"></script>
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


    window.operateEvents = {
        'click .update': function (e, value, row, index) {
            $("#updateIframe").attr("src", "${pageContext.request.contextPath}/update/${tableNameEN}/"+row.id);
        },'click .remove': function (e, value, row, index) {
            swal({
                title: "您确定要删除这条信息吗",
                text: "删除后将无法恢复，请谨慎操作！",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "删除",
                closeOnConfirm: false
            }, function () {
                $.ajax({
                    url: "${pageContext.request.contextPath}/remove/${tableNameEN}/"+row.id,
                    type: 'DELETE',
                    success: function(data) {
                        swal("删除成功！", "您已经永久删除了这条信息。", "success");
                        $('#listTable').bootstrapTable('refresh');//刷新数据
                    },error : function(data) {
                        swal("删除失败！", "您没有删除这条信息。", "error");
                    }
                });
            });
        }
    };

    $(document).ready(function () {
       // $(".i-checks").iCheck({checkboxClass: "icheckbox_square-green", radioClass: "iradio_square-green",})
        $("#closeUpdate").click(function(){
            $('#listTable').bootstrapTable('refresh');//刷新数据
        });
        $("#closeCreate").click(function(){
            $('#listTable').bootstrapTable('refresh');//刷新数据
        });
    });
    $("#btn_query").click(function(){
        $('#listTable').bootstrapTable('refresh');
    });

    function query() {
        var q = new Object();
        var $query = $("#query input");
        for(var i=0;i<$query.length;i++){
            var temp = $query[i];
            q[temp.id]=temp.value;
        }
        return q;
    }

    function operateFormatter(value, row, index) {//赋予的参数
        return [
            '<button type="button" class="ck btn btn-outline btn-default btn-sm"><i class="fa fa-wrench" aria-hidden="true"></i>查看明细</button>',
            '<button type="button" class="update btn btn-outline btn-default btn-sm" data-toggle="modal" data-target="#update"><i class="fa fa-wrench" aria-hidden="true"></i>修改</button>',
            '<button type="button" class="remove btn btn-outline btn-default btn-sm"><i class="fa fa-trash-o" aria-hidden="true"></i>删除</button>'
        ].join('');
    }
</script>
</body>
</html>