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
	<jsp:include page="../menu/businessHallMenu.jsp"></jsp:include>
	<div class="container">
		<div class="page-header">
			<div class="well">
				<div class="row">
					<form class="form-horizontal" role="form">
						<div class="form-group">
							<label class="col-sm-2 control-label">请选择业务类型</label>
							<div class="col-sm-10">
								<label class="checkbox-inline"> <input type="radio"									
									checked onclick="onUim()" name="type"> 单卡
								</label> <label class="checkbox-inline"> <input type="radio"									
									onclick="onBroadband()" name="type"> 宽带
								</label>
							</div>
						</div>
					</form>
				</div>
				<div class="row" id="uim">
					<form class="form-horizontal" role="form" id="uimForm"
						action="uim/add.do" enctype="multipart/form-data" method="post">
						<div class="form-group">
							<label class="col-sm-2 control-label">用户姓名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="userName"
									placeholder="请输入用户姓名">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">身份证号码</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="cardNum"
									placeholder="请输入身份证号码">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">uim卡号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="uimNum"
									placeholder="请输入uim卡号">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">身份证正面</label>
							<div class="col-sm-10">
								<input type="file" style="color:#c8c8c8" name="cardPhotoFrontF">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">身份证反面</label>
							<div class="col-sm-10">
								<input type="file" style="color:#c8c8c8" name="cardPhotoBackF">
							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-2 control-label">手持身份证视频</label>
							<div class="col-sm-10">
								<input type="file" style="color:#c8c8c8" name="userCardVoideoF">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">手持身份证照片</label>
							<div class="col-sm-10">
								<input type="file" style="color:#c8c8c8" name="userCardPhotoF">
							</div>
						</div>
						<div class="form-group">

							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-default" >提交</button>
								&nbsp;&nbsp;
								<button type="reset" class="btn btn-default" id="uimRest">重置</button>
							</div>
						</div>
					</form>
				</div>
				<div class="row" id="broadband" hidden="hidden">
					<form class="form-horizontal" role="form" id="broadbandForm" 
						action="broadband/add.do" enctype="multipart/form-data" method="post">
						<div class="form-group">
							<label class="col-sm-2 control-label">用户姓名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="userName"
									placeholder="请输入用户姓名">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">身份证号码</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="cardNum"
									placeholder="请输入身份证号码">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">身份证正面</label>
							<div class="col-sm-10">
								<input type="file" style="color:#c8c8c8" name="cardPhotoFrontF">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">身份证反面</label>
							<div class="col-sm-10">
								<input type="file" style="color:#c8c8c8" name="cardPhotoBackF">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-default" onclick="">提交</button>
								&nbsp;&nbsp;
								<button type="reset" class="btn btn-default" id="broadbandRest">重置</button>
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
		function onUim() {
			$("#uim").show();
			$("#broadband").hide();
		}
		function onBroadband() {
			$("#uim").hide();
			$("#broadband").show();
		}

		$(function() {
				
			$('#uimForm').bootstrapValidator({
				message : 'This value is not valid',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {
					userName : {
						message : '用户姓名不合法',
						validators : {
							notEmpty : {
								message : '用户姓名不能为空'
							},
							stringLength: {
		                        min: 2,
		                        max: 6,
		                        message: '用户名姓名长度必须是2-6'
		                    }
						}
					},
					cardNum : {
						message : '身份证号码不合法',
						validators : {
							notEmpty : {
								message : '身份证号码不能为空'
							},
							 regexp: {
			                        regexp: /(^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$)|(^[1-9]\d{5}\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{2}$)/,
			                        message: '身份证不合法'
			                }	
						}
					},
					uimNum : {
						message : 'uim号不合法',
						validators : {
							notEmpty : {
								message : 'uim号不能为空'
							}						
						}
					},
					cardPhotoFrontF : {
						message : '必须上传身份证正面照片',
						validators : {
							notEmpty : {
								message : '必须上传身份证正面照片'
							},
							regexp: {
								regexp:/.*.(IMG|JPG|BMP)/i,
								message: '文件类型不合法'
							},
							fileSieze:{
								message : '文件不能大于2M',
								size:2*1024
							}	
						}
					},
					cardPhotoBackF : {
						message : '必须上传身份证反面照片',
						validators : {
							notEmpty : {
								message : '必须上传身份证反面照片'
							},
							regexp: {
								regexp:/.*.(IMG|JPG|BMP)/i,
								message: '文件类型不合法'
							},
							fileSieze:{
								message : '文件不能大于2M',
								size:2*1024
							}						
						}
					},
					userCardVoideoF : {
						message : '必须上传手持身份证视频',
						validators : {
							notEmpty : {
								message : '必须上传手持身份证视频'
							},
							regexp: {
								regexp:/.*.(MPEG4|AVI)/i,
								message: '文件类型不合法'
							},
							fileSieze:{
								message : '文件不能大于20M',
								size:20*1024
							}						
						}
					},
					userCardPhotoF : {
						message : '必须上传手持身份证照片',
						validators : {
							notEmpty : {
								message : '必须上传手持身份证照片'
							},
							regexp: {
								regexp:/.*.(MPEG4|AVI)/i,
								message: '文件类型不合法'
							},
							fileSieze:{
								message : '文件不能大于20M',
								size:20*1024
							}						
						}
					}				
					
				}
			});
			
			$('#broadbandForm').bootstrapValidator({
				message : 'This value is not valid',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {
					userName : {
						message : '用户姓名不合法',
						validators : {
							notEmpty : {
								message : '用户姓名不能为空'
							},
							stringLength: {
		                        min: 2,
		                        max: 6,
		                        message: '用户名姓名长度必须是2-6'
		                    }
						}
					},
					cardNum : {
						message : '身份证号码不合法',
						validators : {
							notEmpty : {
								message : '身份证号码不能为空'
							},
							 regexp: {
			                        regexp: /(^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$)|(^[1-9]\d{5}\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{2}$)/,
			                        message: '身份证不合法'
			                }						
						}
					},
					cardPhotoFrontF : {
						message : '必须上传身份证正面照片',
						validators : {
							notEmpty : {
								message : '必须上传身份证正面照片'
							},
							regexp: {
								regexp:/.*.(IMG|JPG|BMP)/i,
								message: '文件类型不合法'
							},
							fileSieze:{
								message : '文件不能大于2M',
								size:2*1024
							}	
						}
					},
					cardPhotoBackF : {
						message : '必须上传身份证反面照片',
						validators : {
							notEmpty : {
								message : '必须上传身份证反面照片'
							},
							regexp: {
								regexp:/.*.(IMG|JPG|BMP)/i,
								message: '文件类型不合法'
							},
							fileSieze:{
								message : '文件不能大于2M',
								size:2*1024
							}						
						}
					}	
				}
			});
		});
	</script>
</body>
</html>