package com.choa.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
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
		File file2 = new File("C:/spring/springworkspace/movie_fx6/src/main/webapp/resources/upload");
		File file3 = null;
		
		try {
			file3 = new File("E:/kh/Spring/workspace/final_fx6/src/main/webapp/resources/upload");			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		if(!file.exists()) {
			file.mkdirs();
		}
		
		//String fileName = UUID.randomUUID().toString() + "_" + multipartFile.getOriginalFilename();
		// 시간을 이용하여 파일명을 겹치지 않게 저장
		Calendar cal = Calendar.getInstance();
		String fileName = cal.getTimeInMillis() + "_" + multipartFile.getOriginalFilename();
		
		File target = new File(file, fileName);
		File target2 = new File(file2,fileName);
		File target3 = null;
		
		try {
			target3 = new File(file3,fileName);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		multipartFile.transferTo(target); // 파일 저장

		copyFile(target,target2);
		
		try {
			copyFile(target,target3);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return fileName;
	}
	
/////////////////////////////////////시연용 파일복사 ////////////////////////////////////////////////////////////////////
private void copyFile(File file, File mfile) throws Exception{
InputStream inStream = null;
OutputStream outStream = null;

mfile.createNewFile();

try{
inStream = new FileInputStream(file); //원본파일
outStream = new FileOutputStream(mfile); //이동시킬 위치

byte[] buffer = new byte[1024];

int length;

while ((length = inStream.read(buffer)) > 0){
outStream.write(buffer, 0, length);
}
}catch(Exception e){
e.printStackTrace();
}finally{
inStream.close();
outStream.close();
}
}


/////////////////////////////////////시연용 파일복사 ////////////////////////////////////////////////////////////////////
}
