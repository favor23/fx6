package com.choa.admin;

import com.choa.member.MemberDTO;

public class AdminDTO extends MemberDTO{
	
	private String department;
	private String position;
	
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}

}
