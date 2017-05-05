<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<body style="padding-top:200px;">
	<div class="container">
		<div class="page-header">
		<div class="well">
			<div class="row">
				<form class="form-horizontal" role="form" id="loginForm"  onSubmit="return onSubmit();">
					<div class="form-group">
						<label  class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="userName"
								placeholder="请输入用户名">
						</div>
					</div>
					<div class="form-group">
						<label  class="col-sm-2 control-label">密码</label>
						<div class="col-sm-10">
							<input class="form-control" name="password" type="password"
								placeholder="请输入密码">
						</div>
					</div>					
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="button" class="btn btn-default" onclick="onSubmit()">登录</button>
						</div>
					</div>
				</form>
			</div>
			</div>
		</div>
	</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="jquery/jquery.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="bootstrapValidate/js/bootstrapValidator.min.js"></script>
	<script type="text/javascript">
	function onSubmit()
	{
		if($("#loginForm").data("bootstrapValidator").isValid())
		{
			$.ajax({
				type:'post',
				url:"login.do",
				data:$("#loginForm").serialize(),
				dataType:"json",			
				success:function(result){
					if(result.success)
					{
						if(result.data.loginResout)
						{
							window.location.href="toList.do";
						}
						else
						{
							alert("用户名或密码错误");
						}
					}
				}
			});
		}	
		return false;
	}
	$(function() {
		$("#loginForm").bootstrapValidator({
			message : 'This value is not valid',
			feedbackIcons : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {
				userName : {
					message : '用户名不能为空',
					validators : {
						notEmpty : {
							message : '用户名不能为空'
						}
					}
				},
				password : {
					message : '密码不能为空',
					validators : {
						notEmpty : {
							message : '密码不能为空'
						}
					}
				}
			}
		});
	});
	</script>
</body>
</html>