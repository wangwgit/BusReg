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
					<form class="form-inline" role="form" id="form"
						onSubmit="return onSubmitSearch(1);">
						<div class="form-group">
							<label>用户名</label> <input type="text" class="form-control"
								name="userName" value="${userName}" placeholder="请输入用户名">&nbsp;&nbsp;
						</div>
						<div class="form-group">
							<label>请选择权限等级</label> <select
								id="limits" class="form-control" name="limitsId">
								<option value="0">全部</option>
								<c:forEach items="${limitss}" var="data" varStatus="status">
									<option value="${data.id}" <c:if test='${limitsId==data.id}'> selected = 'selected'</c:if>>${data.name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label>请选择所属分局</label> <select
								id="suboffice" class="form-control" name="subofficeId"
								onchange="refreshBusinessHall()">
								<option value="0">全部</option>
								<c:forEach items="${suboffices}" var="data" varStatus="status">
									<option value="${data.id}" <c:if test='${subofficeId==data.id}'> selected = 'selected'</c:if>>${data.name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label>所属分点</label> <select class="form-control"
								name="businessHallId" id="businessHall"> 
								<option value="0">全部</option>							
							</select>
						</div>
						<button type="button" class="btn btn-default"
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
								<th>用户名</th>
								<th>用户权限</th>
								<th>所属分局</th>
								<th>所属分点</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${pageResout.datas}" var="data"
								varStatus="status">
								<tr>
									<td>${status.count}</td>
									<td>${data.userName}</td>
									<td>${data.lName}</td>
									<td>${data.sName}</td>
									<td>${data.bName}</td>
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
			window.location.href = "sys/user/toInput.do";
			return false;
		}
		function onSubmitSearch(currentPage) {
			var params = $("#form").serialize() + "&currentPage=" + currentPage;
			window.location.href = "sys/user/list.do?" + params;
			return false;
		}
		function refreshBusinessHall()
		{
			var curId=<c:choose><c:when test="${businessHallId==null}">0</c:when><c:otherwise>${businessHallId}</c:otherwise></c:choose>;
			var id= $("#suboffice").val();
			$.get("sys/businessHall/getBySubofficeId.do?subofficeId="+id,function(data){		
				var businessHall=$("#businessHall");
				businessHall.empty();				
				businessHall.append("<option value='0' >全部</option>");
				if(data.success)
				{
					$.each( data.data, function(i, n){
						var optStr="";
						if(n.id==curId)
						{
							optStr="<option value='"+n.id+"' selected='selected'>"+n.name+"</option>"
						}
						else
						{
							optStr="<option value='"+n.id+"'>"+n.name+"</option>";
						}
						businessHall.append(optStr);
					});
				}			
			},"json");
		}
		
		$(function() {
			refreshBusinessHall();
			showPageContent("pageContent", 5, ${pageResout.totalPage},
					${pageResout.currentPage}, ${pageResout.totalCount},
					"onSubmitSearch");
		});
	</script>

</body>
</html>

