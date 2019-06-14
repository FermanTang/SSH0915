package com.util;

import java.util.List;

/**
 * 分页助手
 * @author Administrator
 *
 */
public class PageAssistant<T> {

	/** 总记录数: 数据表中的数据总条数 */
	private int count;
	/** 页面大小: 页面每次显示的数据条数 */
	private int pageSize = 5;
	/** 总页数: 总记录数除以页面大小 */
	private int totalPage;
	/** 查询的页码: 需要显示的页码 */
	private int currPage = 1;
	/** 查询页面的数据起始编号: 从第几条数据开始查询 */
	private int start;
	/** 页面内容 */
	private List<T> items;
	
	@Override
	public String toString() {
		return "PageAssistant [count=" + count + ", pageSize=" + pageSize + ", totalPage=" + totalPage + ", currPage="
				+ currPage + ", start=" + start + "]";
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
		setTotalPage();
	}
	
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
		setTotalPage();
		setStart();
	}
	
	public int getTotalPage() {
		return totalPage;
	}
	private void setTotalPage() {
		totalPage = count / pageSize;
		if(count % pageSize != 0) {
			totalPage++;
		}
	}
	
	public int getCurrPage() {
		return currPage;
	}
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
		setStart();
	}
	
	public int getStart() {
		return start;
	}
	private void setStart() {
		start = (currPage-1) * pageSize;
	}
	public List<T> getItems() {
		return items;
	}
	public void setItems(List<T> items) {
		this.items = items;
	}
}











