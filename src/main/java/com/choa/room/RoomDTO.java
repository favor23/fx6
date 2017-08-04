package com.choa.room;

import java.sql.Date;

public class RoomDTO {
	
	private int num;
	private String play_Time;
	private String startTime;
	private String lastTime;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getPlay_Time() {
		return play_Time;
	}
	public void setPlay_Time(String play_Time) {
		this.play_Time = play_Time;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getLastTime() {
		return lastTime;
	}
	public void setLastTime(String lastTime) {
		this.lastTime = lastTime;
	}
	


}
