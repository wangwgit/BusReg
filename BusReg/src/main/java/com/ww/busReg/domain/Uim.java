package com.ww.busReg.domain;

import java.util.Date;



public class Uim {
	private int id;
	private String userName;
	private String cardNum;
	private String uimNum;
	private String cardPhotoFront;
	private String cardPhotoBack;
	private String userCardVoideo;
	private String userCardPhoto;
	private int subofficeId;
	private int businessHallId;
	private int dealState;
	private Date insertTime;
	private String remark;
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
	public String getCardNum() {
		return cardNum;
	}
	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}
	public String getUimNum() {
		return uimNum;
	}
	public void setUimNum(String uimNum) {
		this.uimNum = uimNum;
	}
	public String getCardPhotoFront() {
		return cardPhotoFront;
	}
	public void setCardPhotoFront(String cardPhotoFront) {
		this.cardPhotoFront = cardPhotoFront;
	}
	public String getCardPhotoBack() {
		return cardPhotoBack;
	}
	public void setCardPhotoBack(String cardPhotoBack) {
		this.cardPhotoBack = cardPhotoBack;
	}
	public String getUserCardVoideo() {
		return userCardVoideo;
	}
	public void setUserCardVoideo(String userCardVoideo) {
		this.userCardVoideo = userCardVoideo;
	}
	public String getUserCardPhoto() {
		return userCardPhoto;
	}
	public void setUserCardPhoto(String userCardPhoto) {
		this.userCardPhoto = userCardPhoto;
	}
	public Date getInsertTime() {
		return insertTime;
	}
	public void setInsertTime(Date insertTime) {
		this.insertTime = insertTime;
	}
	public int getSubofficeId() {
		return subofficeId;
	}
	public void setSubofficeId(int subofficeId) {
		this.subofficeId = subofficeId;
	}
	public int getBusinessHallId() {
		return businessHallId;
	}
	public void setBusinessHallId(int businessHallId) {
		this.businessHallId = businessHallId;
	}
	public int getDealState() {
		return dealState;
	}
	public void setDealState(int dealState) {
		this.dealState = dealState;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}
