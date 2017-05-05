<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>登录</title>

<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="bootstrapValidate/css/bootstrapValidator.min.css"
	rel="stylesheet" />
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div class="row" style="margin-top: 20px;">
		<table class="table table-bordered table-hover table-striped">
			<thead>
				<tr>
					<th>编号</th>
					<th>姓名</th>
					<th>身份证</th>
					<th>uim号码</th>
					<th>添加时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pageResout.datas}" var="data" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${data.userName}</td>
					<td>${data.cardNum}</td>
					<td>${data.uimNum}</td>
					<td><fmt:formatDate value="${data.insertTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td>查看详情</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="row">
		<jsp:include page="page.jsp"></jsp:include>
	</div>

</body>
</html>