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
        /*body, body.full-height-layout #page-wrapper, body.full-height-layout #wrapper, html {
            height: 70%;
        }*/
        /*label {width: 200px;}*/
    </style>
</head>

<body>
<div class="ibox float-e-margins">
    <div class="ibox-content">
        <div class="col-sm-12">
            <div class="col-sm-6">
                <div class="input-group">
                    <label class="input-group-addon">唯一标识符</label>
                    <input type="text" class="form-control" placeholder="请输入" name="coding" value="${cp.coding}">
                </div>
            </div>
            <div class="col-sm-6">
                <div class="input-group">
                    <label class="input-group-addon">名称</label>
                    <input type="text" class="form-control" placeholder="请输入" name="name" value="${cp.name}">
                </div>
            </div>
            <div class="col-sm-6">
                <div class="input-group">
                    <label class="input-group-addon">数据库表名</label>
                    <input type="text" class="form-control" placeholder="请输入" name="tableEn" value="${cp.tableEn}">
                </div>
            </div>
            <div class="col-sm-6">
                <div class="input-group">
                    <label class="input-group-addon">数据库表主键字段</label>
                    <input type="text" class="form-control" disabled="" name="pkFieldEn" value="${cp.pkFieldEn}">
                </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <div class="col-sm-4 col-sm-offset-2">
                    <button id="save" class="btn btn-primary" type="submit" style="display: none;">保存内容</button>
                </div>
            </div>
        </div>
        <div class="col-sm-12">
            <div>
                <ul class="nav nav-tabs">
                    <li class="active"><a data-toggle="tab" href="#tab-editField"><i class="fa fa-user"></i> 编辑编辑</a></li>
                    <li class=""><a data-toggle="tab" href="#tab-listField"><i class="fa fa-user"></i> 列表字段</a></li>
                    <li class=""><a data-toggle="tab" href="#tab-queryField"><i class="fa fa-user"></i> 查询字段</a></li>
                </ul>
                <div class="tab-content">
                    <div id="tab-editField" class="tab-pane active">
                        <iframe class="J_iframe" name="iframe0" width="100%" height="83%" src="${pageContext.request.contextPath}/configurationpage/editField/list/${cp.coding}" frameborder="0" ></iframe>
                    </div>
                    <div id="tab-listField" class="tab-pane ">
                        <iframe  class="J_iframe" name="iframe2" width="100%" height="83%" src="${pageContext.request.contextPath}/listField/list/${cp.coding}" frameborder="0" ></iframe>
                    </div>
                    <div id="tab-queryField" class="tab-pane ">
                        <iframe  class="J_iframe" name="iframe3" width="100%" height="83%" src="${pageContext.request.contextPath}/queryField/list/${cp.coding}" frameborder="0" ></iframe>
                    </div>
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
<script src="<%=basePath%>/resources/sky/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
<script src="<%=basePath%>/resources/sky/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<!-- Sweet Alert -->
<script src="<%=basePath%>/resources/sky/js/plugins/sweetalert/sweetalert.min.js"></script>

<script type="text/javascript">

</script>
</body>
</html>