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
    <link rel="shortcut icon" href="<%=basePath%>/UI/sky/favicon.ico">
    <link href="<%=basePath%>/UI/sky/css/bootstrap.css" rel="stylesheet">
    <link href="<%=basePath%>/UI/sky/css/font-awesome.min.css" rel="stylesheet">
    <%--<link href="<%=basePath%>/UI/sky/css/plugins/iCheck/custom.css" rel="stylesheet">--%>
    <link href="<%=basePath%>/UI/sky/css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath%>/UI/sky/css/style.css" rel="stylesheet">
</head>
<body class="gray-bg">

    <form role="get" action="${pageContext.request.contextPath}/add/${configurationPageCoding}" method="post"
                      id="list" class="form-horizontal">
        <div class="ibox float-e-margins">
            <div class="ibox-content">
                <div class="form-group">
                    <div class="col-sm-12">
                        <c:forEach items="${editFields}" var="editField">
                            <div class="col-md-3">
                                <div class="input-group">
                                    <label class="input-group-addon">${editField.name}</label>
                                    <input type="text" class="form-control" placeholder="请输入" name="${editField.fieldEn}" value="${data[editField.fieldEn]}">
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="hr-line-dashed"></div>
                <div class="form-group">
                    <div class="col-sm-4 col-sm-offset-2">
                        <button class="btn btn-primary" type="submit">保存内容</button>
                        <button class="btn btn-white" type="submit">取消</button>
                    </div>
                </div>
            </div>
        </div>
    </form>

<script src="<%=basePath%>/UI/sky/js/jquery.min.js?v=2.1.4"></script>
<script src="<%=basePath%>/UI/sky/js/bootstrap.min.js?v=3.3.6"></script>
<script src="<%=basePath%>/UI/sky/js/content.min.js?v=1.0.0"></script>
<%--<script src="<%=basePath%>/UI/sky/js/plugins/iCheck/icheck.min.js"></script>--%>
<%--<script src="<%=basePath%>/UI/sky/js/plugins/suggest/bootstrap-suggest.min.js"></script>--%>
<script type="text/javascript">
    $(document).ready(function () {
        $(".i-checks").iCheck({checkboxClass: "icheckbox_square-green", radioClass: "iradio_square-green",})
    });
</script>
</body>

</html>
