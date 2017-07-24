package com.choa.sr;

import java.sql.Timestamp;

public class SimpleReviewDTO {
	private int num;
	private Integer movie_num;
	private String writer;
	private String contents;
	private Timestamp reg_date;
	private int good;
	private int bad;
	private int sr_stars;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getMovie_num() {
		return movie_num;
	}
	public void setMovie_num(int movie_num) {
		this.movie_num = movie_num;
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
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getBad() {
		return bad;
	}
	public void setBad(int bad) {
		this.bad = bad;
	}
	public int getSr_stars() {
		return sr_stars;
	}
	public void setSr_stars(int sr_stars) {
		this.sr_stars = sr_stars;
	}
}
