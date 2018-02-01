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
    <link href="<%=basePath%>/UI/sky/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
    <link href="<%=basePath%>/UI/sky/css/plugins/chosen/chosen.css" rel="stylesheet">
    <link href="<%=basePath%>/UI/sky/css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath%>/UI/sky/css/style.css" rel="stylesheet">

</head>
<body class="gray-bg">

    <form role="get" action="${pageContext.request.contextPath}/${type}/${configurationPageCoding}/${id}" method="post"
                      id="list" class="form-horizontal">
        <div class="ibox float-e-margins">
            <div class="ibox-content">
                <div class="form-group">
                    <div class="col-sm-12">
                        <c:forEach items="${editFields}" var="editField">
                            <div class="col-sm-6">
                                <div class="input-group">
                                    <label class="input-group-addon">${editField.name}</label>
                                    <c:choose>
                                        <c:when  test="${editField.selectBox.type.equals('radio')}">
                                            <c:forEach items="${editField.selectBoxValues}" varStatus="i" var="input">
                                                <div class="radio radio-info radio-inline">
                                                    <input type="radio" class="form-control" id="${editField.fieldEn}${i}" value="${input.value}" name="${editField.fieldEn}" ${data[editField.fieldEn].equals(input.valueBoolean) ? "checked=''" : "" }>
                                                    <label for="${editField.fieldEn}${i}"> ${input.name} </label>
                                                </div>
                                            </c:forEach>
                                        </c:when >
                                        <c:when test="${editField.selectBox.type.equals('select')}">
                                            <select data-placeholder="选择..." class="chosen-select form-control" name="${editField.fieldEn}" tabindex="2">
                                                <option value="">请选择</option>
                                                <c:forEach items="${editField.selectBoxValues}" var="input">
                                                    <option value="${input.value}" ${data[editField.fieldEn].equals(input.value) ? "selected" : "" }>${input.name}</option>
                                                </c:forEach>
                                            </select>
                                        </c:when>
                                        <c:when test="${editField.selectBox.type.equals('multiple')}">
                                            <select data-placeholder="选择省份" class="chosen-select form-control" multiple name="${editField.fieldEn}" tabindex="4">
                                                <option value="">请选择省份</option>
                                                <option value="110000" hassubinfo="true">北京</option>
                                                <option value="120000" hassubinfo="true">天津</option>
                                                <option value="130000" hassubinfo="true">河北省</option>
                                                <option value="140000" hassubinfo="true">山西省</option>
                                            </select>
                                        </c:when>
                                        <c:otherwise>
                                            <input type="text" class="form-control" placeholder="请输入" name="${editField.fieldEn}" value="${data[editField.fieldEn]}">
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="hr-line-dashed"></div>
                <div class="form-group">
                    <div class="col-sm-4 col-sm-offset-2">
                        <button id="save" class="btn btn-primary" type="submit">保存内容</button>
                        <%--<button class="layui-btn layui-btn-small bcql-icon icon-save" lay-submit lay-filter="save" ></button>--%>
                        <button class="btn btn-white" type="submit">取消</button>
                    </div>
                </div>
            </div>
        </div>
    </form>

<script src="<%=basePath%>/UI/sky/js/jquery.min.js?v=2.1.4"></script>
<script src="<%=basePath%>/UI/sky/js/bootstrap.min.js?v=3.3.6"></script>
<script src="<%=basePath%>/UI/sky/js/content.min.js?v=1.0.0"></script>
<script src="<%=basePath%>/UI/sky/js/plugins/chosen/chosen.jquery.js"></script>
<%--<script src="<%=basePath%>/UI/sky/js/demo/form-advanced-demo.min.js"></script>&lt;%&ndash;多选下拉框是需要&ndash;%&gt;--%>
<%--<script src="<%=basePath%>/UI/sky/js/plugins/iCheck/icheck.min.js"></script>--%>
<%--<script src="<%=basePath%>/UI/sky/js/plugins/suggest/bootstrap-suggest.min.js"></script>--%>
<script type="text/javascript">
    $(document).ready(function () {
        $(".chosen-select").chosen();

//        $(".i-checks").iCheck({checkboxClass: "icheckbox_square-green", radioClass: "iradio_square-green",})
    });
</script>
</body>

</html>
