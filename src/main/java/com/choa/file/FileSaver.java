package com.choa.file;

import java.io.File;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class FileSaver {
	// 파일을 디스크에 저장
	public String fileSave(String realPath, String oriName, byte[] fileData) throws Exception {
		File file = new File(realPath);
		
		if(!file.exists()) {
			file.mkdirs();
		}
		
		String fileName = UUID.randomUUID().toString() + "_" + oriName; // 실제 폴더에 저장되는 파일 이름

		File target = new File(file, fileName);

		FileCopyUtils.copy(fileData, target); // 파일 저장
		
		return fileName;
	}
	
	// 두 번째 파일 저장 방법(MultipartFile의 클래스 이용)
	public String fileSave(String realPath, MultipartFile multipartFile) throws Exception {
		System.out.println(realPath);
		File file = new File(realPath);
		
		if(!file.exists()) {
			file.mkdirs();
		}
		
		//String fileName = UUID.randomUUID().toString() + "_" + multipartFile.getOriginalFilename();
		// 시간을 이용하여 파일명을 겹치지 않게 저장
		Calendar cal = Calendar.getInstance();
		String fileName = cal.getTimeInMillis() + "_" + multipartFile.getOriginalFilename();
		
		File target = new File(file, fileName);
		
		multipartFile.transferTo(target); // 파일 저장
		
		return fileName;
	}
}
