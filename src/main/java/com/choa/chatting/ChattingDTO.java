package com.choa.chatting;

import java.sql.Date;

public class ChattingDTO {

	private int room_num;
	private String writer;
	private String contents;
	private Date reg_date;
	private String grade;
	private String proccess;
	private int num;
	
	public String getProccess() {
		return proccess;
	}
	public void setProccess(String proccess) {
		this.proccess = proccess;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getRoom_num() {
		return room_num;
	}
	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	
}
