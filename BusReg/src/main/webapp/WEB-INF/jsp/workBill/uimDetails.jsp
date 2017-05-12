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
</head>
<body style="padding-top:30px;">
	<div class="container">
		<div class="page-header">
		<div class="well">
			<div class="row">
					<table class="table table-striped table-hover">
					<tr>
						<td>用户姓名</td>
						<td>${uim.userName}</td>
					</tr>
					<tr>
						<td>身份证号码</td>
						<td>${uim.cardNum}</td>
					</tr>
					<tr>
						<td>uim卡号</td>
						<td>${uim.uimNum}</td>
					</tr>
					<tr>
						<td>所属分局</td>
						<td>${uim.sName}</td>
					</tr>
					<tr>
						<td>所属分点</td>
						<td>${uim.bName}</td>
					</tr>
					<tr>
						<td>填报时间</td>
						<td><fmt:formatDate value="${uim.insertTime}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					</tr>
					<tr>
						<td>身份证正面</td>
						<td><a href="javascript:void(0);">下载</a></td>
					</tr>
					<tr>
						<td>身份证反面</td>
						<td><a href="javascript:void(0);">下载</a></td>
					</tr>
					<tr>
						<td>手持身份证视频</td>
						<td><a href="javascript:void(0);">下载</a></td>
					</tr>
					<tr>
						<td>手持身份证照片</td>
						<td><a href="javascript:void(0);">下载</a></td>
					</tr>

				</table>
			</div>
			<div class="row text-center"><button type="button" class="btn btn-default" onclick=" back()">返回</button></div>
			</div>
		</div>
	</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="../jquery/jquery.min.js"></script>

	<script type="text/javascript">
		function back()
		{
			window.history.back();
		}
	</script>
</body>
</html>