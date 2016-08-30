package com.cl.ssm.util;

import java.util.List;
/*
 * 实现分页功能
 */
public class Takepage<T> {

	private int totalRecords;// 总记录数
	private List<T> list;// 当前集合类型
	private int pageNo;// 当前页码
	private int pageSize;// 每页要显示的数据数
	private int psize;//记录当前界面数据
	/*
	 * 得到总页数
	 */
	public int getTotalPageNo(){
		return (totalRecords+pageSize-1)/pageSize;
	}
	/*
	 * 得到第一页
	 */
	public int getPageNoOne() {
		return 1;
	}

	/*
	 * 得到最后一页
	 */
	public int getPageNoOver() {
		return getTotalPageNo()==0?1:getTotalPageNo();
	}
	/*
	 * 得到上一页
	 */
	public int getPageNoFrist(){
		if(pageNo<=1){
			return 1;
		}
		return pageNo-1;
		
	}
	/*
	 * 得到下一页
	 */
	public int getPageNoLast(){
		if(pageNo>=getTotalPageNo()){
			return getPageNoOver();
		}
		return pageNo+1;
		
	}
	
	
	//get set方法
	public int getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPsize() {
		return psize;
	}
	public void setPsize(int psize) {
		this.psize = psize;
	}
	
	
	
}
