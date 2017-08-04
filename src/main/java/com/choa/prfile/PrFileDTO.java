package com.choa.prfile;

import org.springframework.web.multipart.MultipartFile;

public class PrFileDTO {
	
	private String id;
	private String fname;
	private String oname;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	
	
	
	
	

}
