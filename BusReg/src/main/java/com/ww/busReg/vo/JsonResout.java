package com.ww.busReg.vo;

public class JsonResout {
	/**
	 * 服务端处理数据是否正常
	 */
	private boolean success;
	/**
	 * 返回的具体数据
	 */
	private Object data;
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	
}
