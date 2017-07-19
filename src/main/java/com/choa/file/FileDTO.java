package com.choa.file;

import org.springframework.web.multipart.MultipartFile;

public class FileDTO {
	private String name;
	private MultipartFile poster_img;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public MultipartFile getPoster_img() {
		return poster_img;
	}
	public void setPoster_img(MultipartFile poster_img) {
		this.poster_img = poster_img;
	}
}
