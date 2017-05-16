package com.ww.busReg.domain;

public class BusinessHall {
	private int id;
	private int subofficeId;
	private String name;
	private String num;
	private boolean usable=true;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public int getSubofficeId() {
		return subofficeId;
	}
	public void setSubofficeId(int subofficeId) {
		this.subofficeId = subofficeId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public boolean isUsable() {
		return usable;
	}
	public void setUsable(boolean usable) {
		this.usable = usable;
	}
	
}
