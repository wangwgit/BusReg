<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 使用这个分页空间需要符合一下要求
调用showPageContent生成页码
 -->
<ul class="pagination pull-right" id="pageContent">
	<li class="active"><a>共11234条</a></li>
	<li><a href="#">首页</a></li>
	<li><a href="#">上一页</a></li>
	<li class="active"><a href="#">1</a></li>
	<li><a href="#">2</a></li>
	<li><a href="#">3</a></li>
	<li><a href="#">4</a></li>
	<li><a href="#">5</a></li>
	<li><a href="#">下一页</a></li>
	<li><a href="#">尾页</a></li>
	<li class="active"><a>共1124页</a></li>
</ul>
<script type="text/javascript">
	/*
	计算出显示所需要的开始页和结束页
	totalPage:总页数
	currentPage:当前激活的页码
	maxShowPage:要显示的最大页数
	*/
	function getShowPage(totalPage,currentPage,maxShowPage)
	{
		var out={};
		var halfPage=maxShowPage/2;
		var fristShowpage=currentPage-halfPage;
		var lastShowPage=currentPage+halfPage;
		//做一次调整不让结果超出范围
		if(fristShowpage<1)
		{
			fristShowpage=1;
		}
		if(lastShowPage>totalPage)
		{
			lastShowPage=totalPage;
		}
		
		if(currentPage-fristShowpage<halfPage)
		{//前半部分的页数显示不够一半的，后半部分显示多点
			out.lastShowPage+=halfPage-(currentPage-fristShowpage);			
		}
		if(lastShowPage-currentPage<halfPage)
		{//后半部分显示的页数不够一半，前半部分显示多点
			out.fristShowpage-=halfPage-(lastShowPage-currentPage);
		}
		//做最后一次调整，不让最终结果超出范围
		if(out.fristShowpage<1)
		{
			out.fristShowpage=1;
		}
		if(out.lastShowPage>totalPage)
		{
			out.lastShowPage=totalPage;
		}
		return out;
	};
	/*
	显示页码
	pageId:要显示到那个标签上
	totalPage:总页数
	currentPage:当前激活的页码
	totalCount:数据总条数
	pagFunName:翻页函数名
	*/
	function showPageContent(pageId,maxShowPage,totalPage,currentPage,totalCount,pagFunName)
	{
		var showPage=getShowPage(totalPage,currentPage,maxShowPage);
		var pageContent = $("#"+pageId);
		pageContent.empty();
	
		pageContent.append("<li class='active'><a>共"+totalCount+"条</a></li>");
		pageContent.append("<li><a href='javascript:;' onclick='"+pagFunName+"(1)"+"'>首页</a></li>");
		pageContent.append("<li><a href='javascript:;' onclick='"+pagFunName+"("+currentPage-1+")"+"'>上一页</a></li>");
		var tempPage = 0;
		for (var i = showPage.fristShowpage; i <= showPage.lastShowPage; i++) {
			tempPage = startPage + i;
			if (tempPage > totalPage) {
				break;
			}
			var pageLi;
			if (tempPage == currentPage) {
				pageLi = "<li class='active'><a href='javascript:;' >"+ i + "</a></li>";
			} else {
				pageLi = "<li><a href='javascript:;' onclick='"+pagFunName+"("+i+")"+"'>" + i+ "</a></li>";
			}
			pageContent.append(pageLi);
		}
		pageContent.append("<li><a  href='javascript:;' onclick='"+pagFunName+"("+currentPage+1+")"+"'>下一页</a></li>");
		pageContent.append("<li><a  href='javascript:;' onclick='"+pagFunName+"("+totalPage+")"+"'>尾页</a></li>");
		pageContent.append("<li class='active'><a>共"+totalPage+"页</a></li>");
	}
</script>
