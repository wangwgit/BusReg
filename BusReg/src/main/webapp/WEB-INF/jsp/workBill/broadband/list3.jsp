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
				<jsp:include page="../../menu/businessHallMenu.jsp"></jsp:include>
				<jsp:include page="../searchBar3.jsp"></jsp:include>
				<jsp:include page="list.jsp"></jsp:include>
			</div>
		</div>
	</div>


</body>
</html>

