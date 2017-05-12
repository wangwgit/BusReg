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
<body>
	<jsp:include page="../menu/businessHallMenu.jsp"></jsp:include>
	<div class="container">
		<div class="page-header">
			<div class="well">
				<div class="row">
					<form class="form-inline" role="form" onSubmit="return onSubmit();">
						<div class="form-group">
							<label for="name">用户姓名</label> <input type="text"
								class="form-control" id="userName" placeholder="请输入用户姓名">&nbsp;&nbsp;
						</div>
						<div class="form-group">
							<label for="name">身份证号码</label> <input type="text"
								class="form-control" id="cardNum" placeholder="请输入用户身份证号码">&nbsp;&nbsp;
						</div>
						<div class="form-group">
							<label class="checkbox-inline"> <input type="radio"
								name="type" value="uim" checked> 单卡
							</label> <label class="checkbox-inline"> <input type="radio"
								name="type" value="broadband"> 宽带
							</label>
						</div>
						<button type="button" class="btn btn-default" onclick="onSubmitSearch(1)">查询</button>
					</form>
				</div>
				<div id="listDetails"></div>
				
			</div>
		</div>
	</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="jquery/jquery.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="bootstrapValidate/js/bootstrapValidator.min.js"></script>
	<script type="text/javascript">
	function onSubmitSearch(currentPage)
	{
		var type=$("input[name='type']:checked").val();
		var params="userName="+$("#userName").val()+"&cardNum="+$("#cardNum").val()+"&currentPage="+currentPage;
		if("uim"==type)
		{
			$.get("uim/listDetails.do?"+params, function(data) {
				$("#listDetails").html(data);	
			});
		}
		
		return false;
	}
	</script>
</body>
</html>