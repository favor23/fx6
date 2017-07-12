package com.choa.customer;

import java.sql.Date;

import com.choa.member.MemberDTO;

public class CustomerDTO extends MemberDTO {
	private String id;
	private String phone;
	private String email;
	private String address;
	private String sung;
	private String job;
	private String ticket;
	private String playView;
	private String reView;
	private String birth;
	
	
	
	
	
	
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getSung() {
		return sung;
	}
	public void setSung(String sung) {
		this.sung = sung;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getTicket() {
		return ticket;
	}
	public void setTicket(String ticket) {
		this.ticket = ticket;
	}
	public String getPlayView() {
		return playView;
	}
	public void setPlayView(String playView) {
		this.playView = playView;
	}
	public String getReView() {
		return reView;
	}
	public void setReView(String reView) {
		this.reView = reView;
	}
	
	
	
	
}
