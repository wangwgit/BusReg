<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<body>
	<ul class="pagination pull-right" id="pageContent">
		<li><a href="#">&laquo;</a></li>
		<li class="active"><a href="#">1</a></li>
		<li><a href="#">2</a></li>
		<li><a href="#">&raquo;</a></li>
	</ul>
	<script type="text/javascript">
	var totalCount=${pageResout.totalCount};
	var totalPage=${pageResout.totalPage};
	function refreshPage(startPage)
	{
		var pageContent= $("#pageContent");
		pageContent.empty();
		pageContent.append("<li><a>&laquo;</a></li>");
		for(var i=0;i<5;i++)
		{			
			var tempPage=startPage+i;
			if(tempPage>totalPage)
			{
				break;
			}
			pageContent.append("<li><a>"+tempPage+"</a></li>");
		}
		pageContent.append("<li><a>&raquo;</a></li>");
	}
	$(function(){
		refreshPage(1);
	});
	</script>
</body>
</html>