<%--
  Created by IntelliJ IDEA.
  User: wz
  Date: 2017/10/16
  Time: 9:26
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%--<%@ page isELIgnored="false" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String basePath = request.getContextPath();
%>
<html>


<!-- Mirrored from www.zi-han.net/theme/hplus/table_bootstrap.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:20:03 GMT -->
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>H+ 后台主题UI框架 - Bootstrap Table</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="<%=basePath%>/UI/hplus/html/favicon.ico">
    <link href="<%=basePath%>/UI/hplus/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="<%=basePath%>/UI/hplus/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="<%=basePath%>/UI/hplus/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="<%=basePath%>/UI/hplus/css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath%>/UI/hplus/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="<%=basePath%>/UI/hplus/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

</head>

<body class="gray-bg">
<form action="" method="POST">
    <input type="hidden" name="_method" value="DELETE"/>
</form>
<%--<div class="wrapper wrapper-content animated fadeInRight">--%>
    <!-- Panel Other -->
    <div class="ibox float-e-margins">
        <div class="ibox-content">
            <div class="row row-lg">
                <div class="col-sm-12">
                    <%--查询--%>
                    <%--<c:import url="query.jsp"></c:import>--%>
                    <!-- Example Toolbar -->
                    <div class="example-wrap">
                        <div class="example">
                            <div id="toolbar">
                                <div class="btn-group hidden-xs" id="exampleToolbar" role="group">
                                    <button type="button" class="btn btn-outline btn-default" data-toggle="modal" data-target="#create">
                                        <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
                                    </button>
                                    <button type="button" class="btn btn-outline btn-default">
                                        <i class="glyphicon glyphicon-heart" aria-hidden="true"></i>
                                    </button>
                                    <button type="button" class="btn btn-outline btn-default">
                                        <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
                                    </button>
                                </div>
                            </div>
                            <table id="listTable"></table>
                        </div>
                    </div>
                    <div class="modal inmodal fade" id="update" tabindex="-1" role="dialog"  aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button id="closeUpdate" type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                    <h1 class="modal-title">修改</h1>
                                </div>
                                <div class="modal-body">
                                    <div class="ibox-content">
                                        <iframe id="updateIframe" class="J_iframe" name="iframe0" width="100%" height="100%" src="" frameborder="0" data-id="index_v1.html" seamless></iframe>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal inmodal fade" id="create" tabindex="-1" role="dialog"  aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button id="closeCreate" type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                    <h1 class="modal-title">添加</h1>
                                </div>
                                <div class="modal-body">
                                    <div class="ibox-content">
                                        <iframe id="createIframe" class="J_iframe" name="iframe0" width="100%" height="100%" src="${pageContext.request.contextPath}/create/${tableNameEN}" frameborder="0" data-id="index_v1.html" seamless></iframe>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Example Toolbar -->
                </div>

            </div>
        </div>
    </div>
    <!-- End Panel Other -->
<%--</div>--%>
<script src="<%=basePath%>/UI/hplus/js/jquery.min.js?v=2.1.4"></script>
<script src="<%=basePath%>/UI/hplus/js/bootstrap.min.js?v=3.3.6"></script>
<script src="<%=basePath%>/UI/hplus/js/content.min.js?v=1.0.0"></script>
<script src="<%=basePath%>/UI/hplus/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="<%=basePath%>/UI/hplus/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
<script src="<%=basePath%>/UI/hplus/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>

<script src="<%=basePath%>/UI/hplus/js/plugins/iCheck/icheck.min.js"></script>

<script src="<%=basePath%>/UI/hplus/js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="<%=basePath%>/UI/starrysky/list/js/bootstrapTable.js"></script>
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
        $(".i-checks").iCheck({checkboxClass: "icheckbox_square-green", radioClass: "iradio_square-green",})
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


<!-- Mirrored from www.zi-han.net/theme/hplus/table_bootstrap.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:20:06 GMT -->
</html>