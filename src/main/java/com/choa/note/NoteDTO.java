package com.choa.note;

import java.sql.Date;

public class NoteDTO {
	
	private String sender;
	private String addressee;
	private String contents;
	private Date reg_date;
	private String check_note;
	private int num;
	
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getAddressee() {
		return addressee;
	}
	public void setAddressee(String addressee) {
		this.addressee = addressee;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getCheck_note() {
		return check_note;
	}
	public void setCheck_note(String check_note) {
		this.check_note = check_note;
	}
	
	
	
	

}
