<%--
  Created by IntelliJ IDEA.
  User: wz
  Date: 2017/10/16
  Time: 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String basePath = request.getContextPath();
%>
<html>
<head>

    <title>Title</title>
    <link rel="shortcut icon" href="<%=basePath%>/resources/sky/favicon.ico">
    <link href="<%=basePath%>/resources/sky/css/bootstrap.css" rel="stylesheet">
    <link href="<%=basePath%>/resources/sky/css/font-awesome.min.css" rel="stylesheet">
    <link href="<%=basePath%>/resources/sky/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
    <link href="<%=basePath%>/resources/sky/css/plugins/chosen/chosen.css" rel="stylesheet">
    <link href="<%=basePath%>/resources/sky/css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath%>/resources/sky/css/style.css" rel="stylesheet">

</head>
<body class="gray-bg">

    <form role="get" action="${pageContext.request.contextPath}/configurationpage/${type}" method="post"
                      id="list" class="form-horizontal">
        <div class="ibox float-e-margins">
            <div class="ibox-content">
                <div class="form-group">
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
                    </div>
                </div>
                <%--<div class="hr-line-dashed"></div>--%>
                <div class="form-group">
                    <div class="col-sm-4 col-sm-offset-2">
                        <button id="save" class="btn btn-primary" type="submit" style="display: none;">保存内容</button>
                    </div>
                </div>
            </div>
        </div>
    </form>

<script src="<%=basePath%>/resources/sky/js/jquery.min.js?v=2.1.4"></script>
<script src="<%=basePath%>/resources/sky/js/bootstrap.min.js?v=3.3.6"></script>
<script src="<%=basePath%>/resources/sky/js/content.min.js?v=1.0.0"></script>
<script src="<%=basePath%>/resources/sky/js/plugins/chosen/chosen.jquery.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $(".chosen-select").chosen();
    });
</script>
</body>

</html>
