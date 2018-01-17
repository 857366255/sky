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
    <link rel="shortcut icon" href="<%=basePath%>/UI/hplus/html/favicon.ico">
    <link href="<%=basePath%>/UI/hplus/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="<%=basePath%>/UI/hplus/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="<%=basePath%>/UI/hplus/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="<%=basePath%>/UI/hplus/css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath%>/UI/hplus/css/style.min862f.css?v=4.1.0" rel="stylesheet">
</head>
<body class="gray-bg">

    <form role="get" action="${pageContext.request.contextPath}/create/${tableNameEN}" method="post"
                      id="list" class="form-horizontal">
        <div class="ibox float-e-margins">
            <div class="ibox-content">
                <div class="form-group">
                    <div class="col-sm-12">
                        <c:forEach items="${editParams.editField}" var="it">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">${it.name}</label>
                                    <div class="col-sm-9 input-group">
                                        <input name="${it.fieldEn}" type="${it.inputType}"
                                               placeholder="${it.editAnnotation}" class="form-control">
                                                <%-- <c:choose>
                                                     <c:when test="${it.is_disable}">
                                                         <input name="${it.name_en}" type="${it.input_type}" placeholder="" disabled="" class="form-control">
                                                     </c:when>
                                                     <c:when test="${it.select_map!=null && it.select_map!=''}">
                                                         <select class="form-control m-b" name="${it.name_en}">
                                                             <option value=""></option>
                                                         <c:forEach items="${it.select_map}" var="sg">
                                                             <option value="${sg.name_en}">
                                                                     <c:forEach items="${sg.val}"  var="val">${val}&nbsp</c:forEach>
                                                             </option>
                                                         </c:forEach>
                                                         </select>
                                                     </c:when>
                                                     <c:otherwise>
                                                         <input name="${it.name_en}" type="${it.input_type}" placeholder="${it.hint}" class="form-control">
                                                     </c:otherwise>
                                                 </c:choose>
                                                 <c:if test="${it.remark!=null}">
                                                     <span class="help-block m-b-none">${it.remark}</span>
                                                 </c:if>--%>
                                    </div>
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

<script src="<%=basePath%>/UI/hplus/js/jquery.min.js?v=2.1.4"></script>
<script src="<%=basePath%>/UI/hplus/js/bootstrap.min.js?v=3.3.6"></script>
<script src="<%=basePath%>/UI/hplus/js/content.min.js?v=1.0.0"></script>
<script src="<%=basePath%>/UI/hplus/js/plugins/iCheck/icheck.min.js"></script>
<script src="<%=basePath%>/UI/hplus/js/plugins/suggest/bootstrap-suggest.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $(".i-checks").iCheck({checkboxClass: "icheckbox_square-green", radioClass: "iradio_square-green",})
    });
</script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>


<!-- Mirrored from www.zi-han.net/theme/hplus/form_basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:19:15 GMT -->
</html>
