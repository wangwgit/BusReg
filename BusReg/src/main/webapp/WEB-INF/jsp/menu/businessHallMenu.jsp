<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<div class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="navbar-header"></div>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li><a href="toInput.do">工单录入</a></li>
				<li><a href="toList3.do">工单列表</a></li>
			</ul>
		</div>
	</div>
</div>