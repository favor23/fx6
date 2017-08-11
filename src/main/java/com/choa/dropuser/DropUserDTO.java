package com.choa.dropuser;

import java.sql.Date;

public class DropUserDTO {
	private int num;
	private String id;
	private String reason;
	private String etc_reason;
	private Date reg_date;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getEtc_reason() {
		return etc_reason;
	}
	public void setEtc_reason(String etc_reason) {
		this.etc_reason = etc_reason;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
	

}
