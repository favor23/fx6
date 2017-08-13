package com.choa.payment.support;

import com.choa.payment.PaymentDTO;

public class PaymentSupportDTO extends PaymentDTO{

	private int num_p;
	private String present;
	private String address;
	private int project_num;
	
	
	public int getProject_num() {
		return project_num;
	}
	public void setProject_num(int project_num) {
		this.project_num = project_num;
	}
	
	public int getNum_p() {
		return num_p;
	}
	public void setNum_p(int num_p) {
		this.num_p = num_p;
	}
	public String getPresent() {
		return present;
	}
	public void setPresent(String present) {
		this.present = present;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

}
