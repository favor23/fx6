package com.choa.file_matching;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.choa.util.SeDTO;

@Service
public class FileMatchingService {
	public String seUpload(SeDTO seDTO, HttpSession session) throws Exception {
		String fileResult = "";
		
		if(seDTO.getFiledata()!=null && seDTO.getFiledata().getOriginalFilename()!=null && !seDTO.getFiledata().getOriginalFilename().equals("")) {
			FileMatchingSaver fileSaver = new FileMatchingSaver();
			
			String realPath = session.getServletContext().getRealPath("resources/img/matching-img");
			
			String fileName = fileSaver.fileSave(realPath, seDTO.getFiledata());
			
			fileResult = "&bNewLine=true&sFileName=" + seDTO.getFiledata().getOriginalFilename() + "&sFileURL=/fx6/resources/upload/" + fileName;			
		} else {
			fileResult = "&errstr=error";
		}
		
		return "redirect:" + seDTO.getCallback() + "?callback_func=" + seDTO.getCallback_func() + fileResult;
	}
	
	public String fileSave(MultipartFile multipartFile, HttpSession session) throws Exception {
		FileMatchingSaver fileSaver = new FileMatchingSaver();
		
		String fileName = fileSaver.fileSave(session.getServletContext().getRealPath("resources/img/matching-img"), multipartFile);
		
		return fileName;
	}
	
	public boolean fileDelete(String fileName, HttpSession session) throws Exception {
		String realPath = session.getServletContext().getRealPath("resources/img/matching-img");
		
		File file = new File(realPath, fileName);
		
		boolean result = file.delete(); // 파일 삭제
		
		return result;
	}
}
