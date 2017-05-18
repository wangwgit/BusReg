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
	<jsp:include page="../../menu/primaryMenu.jsp"></jsp:include>
	<div class="container">
		<div class="page-header">
			<div class="well">
				<div class="row">
					<form class="form-horizontal" role="form" id="userFrom"
						action="sys/user/add.do" method="post">
						<div class="form-group">
							<label class="col-sm-2 control-label">请选择权限等级</label>
							<div class="col-sm-10">
								<select id="limits" class="form-control" name="limitsId"
									onchange="onChangeLimits()">
									<c:forEach items="${limitss}" var="data" varStatus="status">
										<option value="${data.id}">${data.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group" hidden="hidden" id="subofficeDiv">
							<label class="col-sm-2 control-label">请选择所属分局</label>
							<div class="col-sm-10">
								<select id="suboffice" class="form-control" name="subofficeId"
									onchange="onChangeSuboffice()">
									<option value="0">请选择一个分局</option>
									<c:forEach items="${suboffices}" var="data" varStatus="status">
										<option value="${data.id}">${data.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group" hidden="hidden" id="businessHallDiv">
							<label class="col-sm-2 control-label">请选择所属分点</label>
							<div class="col-sm-10">
								<select id="businessHall" class="form-control"
									name="businessHallId">
									<option value='0' selected='selected'>请选择一个分点</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">用户名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="userName"
									placeholder="请输入分点编号">
							</div>
						</div>
						<div class="form-group">
							<label for="firstname" class="col-sm-2 control-label">密码</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="password"
									placeholder="请输入分点名称">
							</div>
						</div>

						<div class="form-group">

							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-default">提交</button>
								&nbsp;&nbsp;
								<button type="reset" class="btn btn-default">重置</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>





	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="jquery/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="bootstrapValidate/js/bootstrapValidator.min.js"></script>
	<script src="js/bootstrapValidator_exit.js"></script>
	<script type="text/javascript">
		function onChangeLimits() {
			var curId = $(limits).val();
			if (curId == 1) {
				$("#subofficeDiv").hide();
				$("#businessHallDiv").hide();
			} else if (curId == 2) {
				$("#subofficeDiv").show();
				$("#businessHallDiv").hide();
			} else if (curId == 3) {
				$("#subofficeDiv").show();
				$("#businessHallDiv").show();
			}
		}
		function onChangeSuboffice(){
			if($(limits).val()==3)
			{
				var id= $("#suboffice").val();
				$.get("sys/businessHall/getBySubofficeId.do?subofficeId="+id,function(data){		
					var businessHall=$("#businessHall");
					businessHall.empty();
					businessHall.append("<option value='0' selected='selected'>请选择一个分点</option>");
					if(data.success)
					{
						$.each( data.data, function(i, n){
							businessHall.append("<option value='"+n.id+"'>"+n.name+"</option>");
						});
					}			
				},"json");
			}		
		}
		//刷新显示
		function refreshShow() {
			onChangeLimits();
			onChangeSuboffice();
		}

		$.fn.bootstrapValidator.validators.subofficeIdValidat = {
			validate : function(validator, $field, options) {
				var val = $field.val();
				if (val == 0) {
					var limitsId = $(limits).val();
					if (limitsId == 2 || limitsId == 3) {
						return false;
					}
				}
				return true;
			}
		};
		$.fn.bootstrapValidator.validators.businessHallIdValidat = {
			validate : function(validator, $field, options) {
				var val = $field.val();
				if (val == 0) {
					var limitsId = $(limits).val();
					if (limitsId == 3) {
						return false;
					}
				}
				return true;
			}
		};
		$(function() {
			refreshShow();
			$('#userFrom').bootstrapValidator({
				message : 'This value is not valid',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {
					userName : {
						validators : {
							notEmpty : {
								message : '用户名不能为空'
							},
							stringLength : {
								min : 2,
								max : 30,
								message : '用户名长度必须是2-30'
							}
						}
					},
					password : {
						validators : {
							notEmpty : {
								message : '密码不能为空'
							},
							stringLength : {
								min : 2,
								max : 30,
								message : '密码长度必须是2-30'
							}
						}
					},
					subofficeId : {
						validators : {
							subofficeIdValidat : {
								message : '必须选择一个分局'
							}
						}
					},
					businessHallId : {
						validators : {
							businessHallIdValidat : {
								message : '必须选择一个分点'
							}
						}
					}

				}
			});
		});
	</script>
</body>
</html>