package com.choa.movieupload;

import java.io.File;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class MovieUploadSaver {

		public String filesave(String realPath, MultipartFile m)throws Exception{
			File f = new File(realPath);
			if(!f.exists()){
				f.mkdirs();
			}
			//String fileName = UUID.randomUUID().toString()+"_"+m.getOriginalFilename();
			Calendar ca = Calendar.getInstance();
			String fileName = ca.getTimeInMillis()+"_"+m.getOriginalFilename();
			
			File target = new File(f, fileName);
			m.transferTo(target);
			
			return fileName;
		}
	
}
