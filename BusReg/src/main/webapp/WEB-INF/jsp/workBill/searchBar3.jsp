<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div class="row">
	<form class="form-inline" role="form" onSubmit="onSubmitSearch(1)">
		<div class="form-group">
			<label for="name">用户姓名</label> <input type="text"
				class="form-control" id="userName" value="${userName}"
				placeholder="请输入用户姓名">&nbsp;&nbsp;
		</div>
		<div class="form-group">
			<label for="name">身份证号码</label> <input type="text"
				class="form-control" id="cardNum" value="${cardNum}"
				placeholder="请输入用户身份证号码">&nbsp;&nbsp;
		</div>
		<div class="form-group">
			<label class="checkbox-inline"> <input type="radio"
				name="type" value="uim" checked> 单卡
			</label> <label class="checkbox-inline"> <input type="radio"
				name="type" value="broadband"> 宽带
			</label>
		</div>
		<button type="button" class="btn btn-default"
			onclick="onSubmitSearch(1)">查询</button>
	</form>
</div>
<div id="listDetails"></div>





<script type="text/javascript">
	$(function(){
		onSubmitSearch(1);
	});
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
