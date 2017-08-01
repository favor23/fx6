package com.choa.admin.work;

import java.sql.Date;

public class SchedulDTO {
	private String id,
	title,
	color;
	

	private Date start,
	end;

	public String getColor() {
		return color;
	}
	
	public void setColor(String color) {
		this.color = color;
	}
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	
	public Date getStart() {
		return start;
	}

	public void setStart(Date start) {
		this.start = start;
	}

	public Date getEnd() {
		return end;
	}

	public void setEnd(Date end) {
		this.end = end;
	}	
	
}