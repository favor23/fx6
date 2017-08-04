package com.choa.prfile;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.choa.util.SeDTO;

@Service
public class PrFileService {
	
	@Autowired
	private PrFileDAO fileDAO;
	
	public String fileSave2(MultipartFile multipartFile, HttpSession session) throws Exception {
		PrFileSaver fileSaver = new PrFileSaver();
		
		String fileName = fileSaver.fileSave(session.getServletContext().getRealPath("resources/img/campaign"), multipartFile);
		
		return fileName;
	}
	
	public boolean fileDelete(String fileName, HttpSession session) throws Exception {
		String realPath = session.getServletContext().getRealPath("resources/img/movie-img");
		
		File file = new File(realPath, fileName);
		
		boolean result = file.delete(); // 파일 삭제
		
		return result;
	}
	//save
	public String fileSave(MultipartFile m,HttpSession session)throws Exception{
		PrFileSaver fileSaver = new PrFileSaver();//resources/upload
		String fileName=fileSaver.fileSave(session.getServletContext().getRealPath("resources/upload"), m);
		return fileName;
	}
	
	public int upload(String id, String fname,String oname)throws Exception{
		return fileDAO.upload(id, fname, oname);
	}
	
	
	public PrFileDTO view(String id)throws Exception{
	
		return fileDAO.view(id);
		
	}

}
