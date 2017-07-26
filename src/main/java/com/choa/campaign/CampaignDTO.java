package com.choa.campaign;

import java.sql.Date;

public class CampaignDTO {
	private int campaign_num;
	private String id;
	private String campaign_title;
	private int goal_price;
	private int period;
	private Date campaign_end;
	private String campaign_img;
	private String simple_story;
	private String story;
	private String main_img;
	private String option_msg;
	private int benefit_num;
	private String bank;
	private String bank_account;
	
	public int getCampaign_num() {
		return campaign_num;
	}
	public void setCampaign_num(int campaign_num) {
		this.campaign_num = campaign_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCampaign_title() {
		return campaign_title;
	}
	public void setCampaign_title(String campaign_title) {
		this.campaign_title = campaign_title;
	}
	public int getGoal_price() {
		return goal_price;
	}
	public void setGoal_price(int goal_price) {
		this.goal_price = goal_price;
	}
	public int getPeriod() {
		return period;
	}
	public void setPeriod(int period) {
		this.period = period;
	}
	public Date getCampaign_end() {
		return campaign_end;
	}
	public void setCampaign_end(Date campaign_end) {
		this.campaign_end = campaign_end;
	}
	public String getCampaign_img() {
		return campaign_img;
	}
	public void setCampaign_img(String campaign_img) {
		this.campaign_img = campaign_img;
	}
	public String getSimple_story() {
		return simple_story;
	}
	public void setSimple_story(String simple_story) {
		this.simple_story = simple_story;
	}
	public String getStory() {
		return story;
	}
	public void setStory(String story) {
		this.story = story;
	}
	public String getMain_img() {
		return main_img;
	}
	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}
	public String getOption_msg() {
		return option_msg;
	}
	public void setOption_msg(String option_msg) {
		this.option_msg = option_msg;
	}
	public int getBenefit_num() {
		return benefit_num;
	}
	public void setBenefit_num(int benefit_num) {
		this.benefit_num = benefit_num;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getBank_account() {
		return bank_account;
	}
	public void setBank_account(String bank_account) {
		this.bank_account = bank_account;
	}
}
