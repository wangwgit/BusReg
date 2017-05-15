<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div class="row">
	<form class="form-inline" role="form">
		<div class="form-group">
			<label for="name">用户姓名</label> <input type="text"
				class="form-control" id="name" placeholder="请输入用户姓名">&nbsp;&nbsp;
		</div>
		<div class="form-group">
			<label for="name">身份证号码</label> <input type="text"
				class="form-control" id="name" placeholder="请输入用户身份证号码">&nbsp;&nbsp;
		</div>
		<div class="form-group">
			<label for="name">所属分局</label> <select class="form-control">
				<option>全部</option>
				<option>XX分局</option>
				<option>XX分局</option>
				<option>XX分局</option>
				<option>XX分局</option>
				<option>XX分局</option>
			</select>
		</div>
		<div class="form-group">
			<label for="name">所属分点</label> <select class="form-control">
				<option>全部</option>
				<option>XX路营业厅</option>
				<option>XX路营业厅</option>
				<option>XX路营业厅</option>
				<option>XX路营业厅</option>
				<option>XX路营业厅</option>
			</select>
		</div>
		<div class="form-group">
			<label class="checkbox-inline"> <input type="radio"
				name="optionsRadiosinline" id="optionsRadios3" value="option1"
				checked onclick="onUim()"> 单卡
			</label> <label class="checkbox-inline"> <input type="radio"
				name="optionsRadiosinline" id="optionsRadios4" value="option2"
				onclick="onBroadband()"> 宽带
			</label>
		</div>
		<button type="submit" class="btn btn-default"
			onclick="onSubmitSearch(1)">查询</button>
	</form>
</div>

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
			window.location.href="uim/list.do?"+params;
		}
		return false;
	}

	</script>
