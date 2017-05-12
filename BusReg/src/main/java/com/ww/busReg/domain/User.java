package com.ww.busReg.domain;

public class User {
	private int id;
	private String userName;
	private String password;
	private Integer limitsId;
	private Integer subofficeId;
	private Integer businessHallId;
	private boolean usable;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getLimitsId() {
		return limitsId;
	}
	public void setLimitsId(Integer limitsId) {
		this.limitsId = limitsId;
	}
	public Integer getSubofficeId() {
		return subofficeId;
	}
	public void setSubofficeId(Integer subofficeId) {
		this.subofficeId = subofficeId;
	}
	public Integer getBusinessHallId() {
		return businessHallId;
	}
	public void setBusinessHallId(Integer businessHallId) {
		this.businessHallId = businessHallId;
	}
	public boolean isUsable() {
		return usable;
	}
	public void setUsable(boolean usable) {
		this.usable = usable;
	}
	
	
}
