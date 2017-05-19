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
<div class="row">
	<form class="form-inline" role="form" id="form" onsubmit="return onSubmitSearch(1);">
		<div class="form-group">
			<label for="name">用户姓名</label> <input type="text"
				class="form-control" id="userName" value="${userName}" name="userName"
				placeholder="请输入用户姓名">&nbsp;&nbsp;
		</div>
		<div class="form-group">
			<label for="name">身份证号码</label> <input type="text"
				class="form-control" id="cardNum" value="${cardNum}" name="cardNum"
				placeholder="请输入用户身份证号码">&nbsp;&nbsp;
		</div>
		<div class="form-group">
			<label>请选择所属分局</label> <select id="suboffice" class="form-control"
				name="subofficeId" onchange="refreshBusinessHall()">
				<option value="0">全部</option>
				<c:forEach items="${suboffices}" var="data" varStatus="status">
					<option value="${data.id}"
						<c:if test='${subofficeId==data.id}'> selected = 'selected'</c:if>>${data.name}</option>
				</c:forEach>
			</select>
		</div>
		<div class="form-group">
			<label>所属分点</label> <select class="form-control"
				name="businessHallId" id="businessHall">
				<option value="0">全部</option>
			</select>
		</div>
		<div class="form-group">
			<label class="checkbox-inline"> <input type="radio"
				name="type" value="uim" <c:if test='${type=="uim"}'> checked</c:if> >单卡
			</label> <label class="checkbox-inline"> <input type="radio"
				name="type" value="broadband" <c:if test='${type=="broadband"}'>checked</c:if>> 宽带
			</label>
		</div>
		<button type="button" class="btn btn-default"
			onclick="return onSubmitSearch(1);">查询</button>
	</form>
</div>

<script type="text/javascript">
	function refreshBusinessHall()
	{
		var curId=<c:choose><c:when test="${businessHallId==null}">0</c:when><c:otherwise>${businessHallId}</c:otherwise></c:choose>;
		var id= $("#suboffice").val();
		$.get("sys/businessHall/getBySubofficeId.do?subofficeId="+id,function(data){		
			var businessHall=$("#businessHall");
			businessHall.empty();				
			businessHall.append("<option value='0' >全部</option>");
			if(data.success)
			{
				$.each( data.data, function(i, n){
					var optStr="";
					if(n.id==curId)
					{
						optStr="<option value='"+n.id+"' selected='selected'>"+n.name+"</option>";
					}
					else
					{
						optStr="<option value='"+n.id+"'>"+n.name+"</option>";
					}
					businessHall.append(optStr);
				});
			}			
		},"json");
	}

	$(function() {
		refreshBusinessHall();
	});
	function onSubmitSearch(currentPage) {
		var type = $("input[name='type']:checked").val();
		var params = $("#form").serialize() + "&currentPage=" + currentPage;

		if("uim"==type)
		{
			window.location.href="<%=basePath%>uim/list.do?"+params;
		}
		if("broadband"==type)
		{
			window.location.href="<%=basePath%>broadband/list.do?"+params;
		}
		return false;
	}
</script>
