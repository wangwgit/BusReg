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
<title>输入</title>

<!-- Bootstrap -->
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
<body style="padding-top:30px;">
	<div class="container">
		<div class="page-header">
			<div class="well">
				<form class="form-horizontal" role="form" action="uim/changeRemark.do" method="post">
					<div hidden="hidden">
						<input type="text" class="form-control" name="id"  value="${uim.id}">
					</div>
					<div class="form-group">
							<label class="col-sm-2 control-label">备注</label>
							<div class="col-sm-10">								
								<textarea class="form-control" rows="3" name="remark" placeholder="请输入备注信息" >${uim.remark}</textarea>
							</div>
						</div>
					<div class="form-group">

						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">提交</button>
							&nbsp;&nbsp;
							<button type="reset" class="btn btn-default" id="uimRest">重置</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>


	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="jquery/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<!--
		<script src="bootstrapValidate/js/bootstrapValidator.min.js"></script>
	<script src="js/bootstrapValidator_exit.js"></script>
	  -->

	

</body>
</html>