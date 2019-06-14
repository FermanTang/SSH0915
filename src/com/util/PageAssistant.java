package com.util;

import java.util.List;

/**
 * ��ҳ����
 * @author Administrator
 *
 */
public class PageAssistant<T> {

	/** �ܼ�¼��: ���ݱ��е����������� */
	private int count;
	/** ҳ���С: ҳ��ÿ����ʾ���������� */
	private int pageSize = 5;
	/** ��ҳ��: �ܼ�¼������ҳ���С */
	private int totalPage;
	/** ��ѯ��ҳ��: ��Ҫ��ʾ��ҳ�� */
	private int currPage = 1;
	/** ��ѯҳ���������ʼ���: �ӵڼ������ݿ�ʼ��ѯ */
	private int start;
	/** ҳ������ */
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











