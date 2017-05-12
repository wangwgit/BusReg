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

<div class="row" style="margin-top: 20px;">
	<table class="table table-bordered table-hover table-striped">
		<thead>
			<tr>
				<th>编号</th>
				<th>姓名</th>
				<th>身份证</th>
				<th>uim号码</th>
				<th>添加时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${pageResout.datas}" var="data" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${data.userName}</td>
					<td>${data.cardNum}</td>
					<td>${data.uimNum}</td>
					<td><fmt:formatDate value="${data.insertTime}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td><a href="uim/details.do?id=${data.id}">查看详情</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div class="row">
	<ul class="pagination pull-right" id="pageContent"></ul>
</div>
<script src="jquery/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrapValidate/js/bootstrapValidator.min.js"></script>
<script src="js/page.js"></script>
<script type="text/javascript">
$(function(){
	showPageContent("pageContent",5,${pageResout.totalPage},${pageResout.currentPage},${pageResout.totalCount},"onSubmitSearch");
	
});
		
</script>


