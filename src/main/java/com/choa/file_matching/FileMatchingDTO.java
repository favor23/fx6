package com.choa.file_matching;

import org.springframework.web.multipart.MultipartFile;

public class FileMatchingDTO {
	private String name;
	private MultipartFile matching_img;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public MultipartFile getMatching_img() {
		return matching_img;
	}
	public void setMatching_img(MultipartFile matching_img) {
		this.matching_img = matching_img;
	}
	
	
	
}
