package com.choa.movieupload;

public class MovieUploadDTO {

	private int movie_num;
	private String fname;
	private String oname;
	private String playTime;
	
	public int getMovie_num() {
		return movie_num;
	}
	public void setMovie_num(int movie_num) {
		this.movie_num = movie_num;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
	}
	public String getPlayTime() {
		return playTime;
	}
	public void setPlayTime(String playTime) {
		this.playTime = playTime;
	}
	
}
