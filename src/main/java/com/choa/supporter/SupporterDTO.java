package com.choa.supporter;

import java.sql.Date;

public class SupporterDTO {
	private int num;
	private String id;
	private String name;
	private int campaign_num;
	private int support_price;
	private int benefit_num;
	private Date reg_date;
	private String email;
	private String benefit_title;
	
	public String getBenefit_title() {
		return benefit_title;
	}
	public void setBenefit_title(String benefit_title) {
		this.benefit_title = benefit_title;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCampaign_num() {
		return campaign_num;
	}
	public void setCampaign_num(int campaign_num) {
		this.campaign_num = campaign_num;
	}
	public int getSupport_price() {
		return support_price;
	}
	public void setSupport_price(int support_price) {
		this.support_price = support_price;
	}
	public int getBenefit_num() {
		return benefit_num;
	}
	public void setBenefit_num(int benefit_num) {
		this.benefit_num = benefit_num;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
