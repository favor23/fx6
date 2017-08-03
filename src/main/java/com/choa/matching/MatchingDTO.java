package com.choa.matching;

import java.sql.Date;

public class MatchingDTO {
	
	
	private String writer;
	private String form;
	private String genre;
	private String title;
	private String story;
	private String scenario;
	private String notice;
	private String matching_img;
	private Date reg_date;
	private int matching_num;
	
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getMatching_num() {
		return matching_num;
	}
	public void setMatching_num(int matching_num) {
		this.matching_num = matching_num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getForm() {
		return form;
	}
	public void setForm(String form) {
		this.form = form;
	}	
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getStory() {
		return story;
	}
	public void setStory(String story) {
		this.story = story;
	}
	public String getScenario() {
		return scenario;
	}
	public void setScenario(String scenario) {
		this.scenario = scenario;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}	
	public String getMatching_img() {
		return matching_img;
	}
	public void setMatching_img(String matching_img) {
		this.matching_img = matching_img;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
	
	
	
	
	

}
