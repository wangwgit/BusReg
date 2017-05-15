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
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>业务登记信息列表</title>

<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="bootstrapValidate/css/bootstrapValidator.min.css"
	rel="stylesheet" />
<link href="css/black_defout.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script src="jquery/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrapValidate/js/bootstrapValidator.min.js"></script>
<script src="js/page.js"></script>
</head>
<body>
	<div class="container">
		<div class="page-header">
			<div class="well">
				<jsp:include page="../../menu/primaryMenu.jsp"></jsp:include>
				<div class="row">
					<form class="form-inline" role="form" onSubmit="return onSubmitSearch(1);">
						<div class="form-group">
							<label for="name">分局名</label> <input type="text"
								class="form-control" id="name" placeholder="请输入分局名称" value="${name}">&nbsp;&nbsp;
						</div>
						<div class="form-group">
							<label for="name">分局编号</label> <input type="text"
								class="form-control" id="num" placeholder="请输入分局编号" value="${num}">&nbsp;&nbsp;
						</div>
						<button type="submit" class="btn btn-default"
							onclick="return onSubmitSearch(1);">查询</button>
						<button type="button" class="btn btn-default"
							onclick="return add();">新增</button>
					</form>
				</div>
				<div class="row" style="margin-top: 20px;">
					<table class="table table-bordered table-hover table-striped">
						<thead>
							<tr>
								<th>序号</th>
								<th>分局名称</th>
								<th>分局编号</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${pageResout.datas}" var="data"
								varStatus="status">
								<tr>
									<td>${status.count}</td>
									<td>${data.name}</td>
									<td>${data.num}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="row">
					<ul class="pagination pull-right" id="pageContent"></ul>
				</div>
			</div>

		</div>

	</div>
	<script type="text/javascript">
		function add() {
			window.location.href = "sys/suboffice/toInput.do";
			return fasle;
		}
		$(function() {
			showPageContent("pageContent", 5, ${pageResout.totalPage},
					${pageResout.currentPage}, ${pageResout.totalCount},
					"onSubmitSearch");
		});
		function onSubmitSearch(currentPage) {
			var params = "name=" + $("#name").val() + "&num=" + $("#num").val()
					+ "&currentPage=" + currentPage;
			window.location.href = "sys/suboffice/list.do?" + params;
			return false;
		}
	</script>

</body>
</html>

