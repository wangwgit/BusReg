/*
 * 显示页码 pageId:要显示到那个标签上 totalPage:总页数 currentPage:当前激活的页码 totalCount:数据总条数
 * pagFunName:翻页函数名并且要求只就收一个页码参数
 */
function showPageContent(pageId, maxShowPage, totalPage, currentPage,totalCount, pagFunName) {

	
	var showPage = getShowPage(totalPage, currentPage, maxShowPage);

	var pageContent = $("#" + pageId);
	pageContent.empty();

	pageContent.append("<li class='active'><a>共" + totalCount + "条</a></li>");
	pageContent.append("<li><a href='javascript:;' onclick='" + pagFunName+ "(1)" + "'>首页</a></li>");
	var frontPage=currentPage - 1;
	if(frontPage<1)
	{
		frontPage=1;
	}
	pageContent.append("<li><a href='javascript:;' onclick='" + pagFunName+ "(" + (currentPage - 1) + ")" + "'>上一页</a></li>");
	for (var i = showPage.fristShowpage; i <= showPage.lastShowPage; i++) {
		var pageLi;
		if (i == currentPage) {
			pageLi = "<li class='active'><a href='javascript:;' >" + i+ "</a></li>";
		} else {
			pageLi = "<li><a href='javascript:;' onclick='" + pagFunName + "("+ i + ")" + "'>" + i + "</a></li>";
		}
		pageContent.append(pageLi);
	}
	var nextPageIndex=currentPage + 1;
	if(nextPageIndex>totalPage)
	{
		nextPageIndex=totalPage;
	}
	pageContent.append("<li><a  href='javascript:;' onclick='" + pagFunName+ "(" + nextPageIndex + ")" + "'>下一页</a></li>");
	pageContent.append("<li><a  href='javascript:;' onclick='" + pagFunName+ "(" + totalPage + ")" + "'>尾页</a></li>");
	pageContent.append("<li class='active'><a>共" + totalPage + "页</a></li>");
}

/*
	计算出显示所需要的开始页和结束页
	totalPage:总页数
	currentPage:当前激活的页码
	maxShowPage:要显示的最大页数
 */
function getShowPage(totalPage, currentPage, maxShowPage) {
	var out = {};
	var halfPage = parseInt(maxShowPage / 2);
	var fristShowpage = currentPage - halfPage;
	var lastShowPage = currentPage + halfPage;
	out.fristShowpage=fristShowpage;
	out.lastShowPage=lastShowPage;
	// 做一次调整不让结果超出范围
	if (fristShowpage < 1) {
		fristShowpage = 1;
	}
	if (lastShowPage > totalPage) {
		lastShowPage = totalPage;
	}
	
	if (currentPage - fristShowpage < halfPage) {// 前半部分的页数显示不够一半的，后半部分显示多点
		out.lastShowPage += halfPage - (currentPage - fristShowpage);
	}
	if (lastShowPage - currentPage < halfPage) {// 后半部分显示的页数不够一半，前半部分显示多点
		out.fristShowpage -= halfPage - (lastShowPage - currentPage);
	}
	// 做最后一次调整，不让最终结果超出范围
	if (out.fristShowpage < 1) {
		out.fristShowpage = 1;
	}
	if (out.lastShowPage > totalPage) {
		out.lastShowPage = totalPage;
	}
	return out;
};
