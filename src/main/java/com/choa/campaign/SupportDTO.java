package com.choa.campaign;

public class SupportDTO {
	private int campaign_num;
	private String benefit_title;
	private int total_price;
	private int benefit_num;
	
	public int getBenefit_num() {
		return benefit_num;
	}
	public void setBenefit_num(int benefit_num) {
		this.benefit_num = benefit_num;
	}
	public int getCampaign_num() {
		return campaign_num;
	}
	public void setCampaign_num(int campaign_num) {
		this.campaign_num = campaign_num;
	}
	public String getBenefit_title() {
		return benefit_title;
	}
	public void setBenefit_title(String benefit_title) {
		this.benefit_title = benefit_title;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
}
