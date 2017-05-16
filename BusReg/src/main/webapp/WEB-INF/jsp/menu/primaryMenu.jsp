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
				<li><a href="uim/list.do">工单列表</a></li>
			</ul>
			<ul class="nav navbar-nav">
				<li><a href="sys/user/list.do">用户列表</a></li>
			</ul>
			<ul class="nav navbar-nav">
				<li><a href="sys/suboffice/list.do">分局列表</a></li>
			</ul>
			<ul class="nav navbar-nav">
				<li><a href="sys/businessHall/list.do">分点列表</a></li>			
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="../sys/chagePassword.html">修改密码</a></li>
			</ul>
		</div>
	</div>
</div>