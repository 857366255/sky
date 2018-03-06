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
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<html>
<head>

    <title>Title</title>
    <link rel="shortcut icon" href="${basePath}/resources/sky/favicon.ico">
    <link href="${basePath}/resources/sky/css/bootstrap.css" rel="stylesheet">
    <link href="${basePath}/resources/sky/css/font-awesome.min.css" rel="stylesheet">
    <link href="${basePath}/resources/sky/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
    <link href="${basePath}/resources/sky/css/plugins/chosen/chosen.css" rel="stylesheet">
    <link href="${basePath}/resources/sky/css/animate.min.css" rel="stylesheet">
    <link href="${basePath}/resources/sky/css/style.css" rel="stylesheet">

</head>
<body class="gray-bg">

<form role="get" action="${basePath}/vip/add" method="post"
      id="list" class="form-horizontal">
    <div class="ibox float-e-margins">
        <div class="ibox-content">
            <div class="form-group">
                <div class="col-sm-12">
                    <div class="col-sm-12">
                        <div class="input-group">
                            <label class="input-group-addon">ID</label>
                            <input type="text" class="form-control" placeholder="请输入" name="vip.id" >
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="input-group">
                            <label class="input-group-addon">cardID</label>
                            <input type="text" class="form-control" placeholder="请输入" name="card.id" >
                        </div>
                    </div>

                    <div class="col-sm-12">
                        <div class="input-group">
                            <label class="input-group-addon">名称</label>
                            <input type="text" class="form-control" placeholder="请输入" name="vip.name" >
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="input-group">
                            <label class="input-group-addon">联系电话</label>
                            <input type="text" class="form-control" placeholder="请输入" name="vip.contact" >
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="input-group">
                            <label class="input-group-addon">卡号类型</label>
                            <input type="text" class="form-control" placeholder="请输入" name="card.cardTypeId" >
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="input-group">
                            <label class="input-group-addon">卡号</label>
                            <input type="text" class="form-control" placeholder="请输入" name="card.cardNumber" >
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="input-group">
                            <label class="input-group-addon">开始日期</label>
                            <input id="openedDate" class="laydate-icon form-control layer-date"  name="openedDate" >
                            <%--<input type="text" class="form-control" placeholder="请输入" name="openedDate" >--%>
                        </div>
                    </div>
                </div>
            </div>
            <%--<div class="hr-line-dashed"></div>--%>
            <div class="form-group">
                <div class="col-sm-4 col-sm-offset-2">
                    <button id="save" class="btn btn-primary" type="submit">保存内容</button>
                </div>
            </div>
        </div>
    </div>
</form>

<script src="${basePath}/resources/sky/js/jquery.min.js"></script>
<script src="${basePath}/resources/sky/js/bootstrap.min.js"></script>
<script src="${basePath}/resources/sky/js/content.min.js"></script>
<script src="${basePath}/resources/sky/js/plugins/chosen/chosen.jquery.js"></script>
<script src="${basePath}/resources/sky/js/plugins/layer/laydate/laydate.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $(".chosen-select").chosen();
        laydate({elem:"#openedDate",event:"focus"});
        //var start={elem:"#start",format:"YYYY/MM/DD hh:mm:ss",min:laydate.now(),max:"2099-06-16 23:59:59",istime:true,istoday:false,choose:function(datas){end.min=datas;end.start=datas}};
        //var end={elem:"#end",format:"YYYY/MM/DD hh:mm:ss",min:laydate.now(),max:"2099-06-16 23:59:59",istime:true,istoday:false,choose:function(datas){start.max=datas}};
        //laydate(start);laydate(end);
    });
</script>
</body>

</html>
