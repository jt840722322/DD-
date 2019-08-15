package com.yq.community;

public class PageUtil {  //分页
	private int page=1;//当前页码
	private int rows=3;//每页3条
	private int begin;//从下标是几的记录开始显示。
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public int getBegin() {
		return begin;
	}
	public void setBegin(int begin) {
		this.begin = begin;
	}
	
	
}
