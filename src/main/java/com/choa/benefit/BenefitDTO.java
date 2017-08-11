package com.choa.benefit;

public class BenefitDTO {
	private int benefit_num;
	private String benefit_title;
	private int benefit_price;
	private String benefit_contents;
	private int campaign_num;
	private int benefit_hit;
	
	public int getBenefit_hit() {
		return benefit_hit;
	}
	public void setBenefit_hit(int benefit_hit) {
		this.benefit_hit = benefit_hit;
	}
	public int getBenefit_num() {
		return benefit_num;
	}
	public void setBenefit_num(int benefit_num) {
		this.benefit_num = benefit_num;
	}
	public String getBenefit_title() {
		return benefit_title;
	}
	public void setBenefit_title(String benefit_title) {
		this.benefit_title = benefit_title;
	}
	public int getBenefit_price() {
		return benefit_price;
	}
	public void setBenefit_price(int benefit_price) {
		this.benefit_price = benefit_price;
	}
	public String getBenefit_contents() {
		return benefit_contents;
	}
	public void setBenefit_contents(String benefit_contents) {
		this.benefit_contents = benefit_contents;
	}
	public int getCampaign_num() {
		return campaign_num;
	}
	public void setCampaign_num(int campaign_num) {
		this.campaign_num = campaign_num;
	}
}
