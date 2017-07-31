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
	private String main_video;
	private String option_msg;
	private String bank;
	private String bank_account;
	private String register_name;
	private String register_phone;
	private String register_email;
	private String permission;
	
	public String getRegister_name() {
		return register_name;
	}
	public void setRegister_name(String register_name) {
		this.register_name = register_name;
	}
	public String getRegister_phone() {
		return register_phone;
	}
	public void setRegister_phone(String register_phone) {
		this.register_phone = register_phone;
	}
	public String getRegister_email() {
		return register_email;
	}
	public void setRegister_email(String register_email) {
		this.register_email = register_email;
	}
	public String getPermission() {
		return permission;
	}
	public void setPermission(String permission) {
		this.permission = permission;
	}
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
	public String getMain_video() {
		return main_video;
	}
	public void setMain_video(String main_video) {
		this.main_video = main_video;
	}
	public String getOption_msg() {
		return option_msg;
	}
	public void setOption_msg(String option_msg) {
		this.option_msg = option_msg;
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
