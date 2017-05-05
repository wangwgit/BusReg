package com.ww.busReg.vo;

import java.util.List;

/**
 * 分页查询的结果
 * @author Administrator
 *
 */
public class PageResout {
	/**
	 * 当前页码
	 */
	private int currentPage;
	/**
	 * 总条数
	 */
	private int totalCount;
	/**
	 * 每页的条数
	 */
	private int pageSize=2;
	Object datas;
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		if(currentPage==null||0==currentPage)
		{
			currentPage=1;
		}
		this.currentPage = currentPage;
	}
	public int getTotalPage() {
		return (totalCount+pageSize-1)/pageSize;
	}
	

	public Object getDatas() {
		return datas;
	}
	public void setDatas(Object datas) {
		this.datas = datas;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getStartIndex()
	{
		return (currentPage-1)*pageSize;
	}

}
