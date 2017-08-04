package com.choa.movieupload;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class MovieUploadService {

	@Autowired
	private MovieUploadDAO movieUploadDAO;
	
	//save
	public String fileSave(MultipartFile m,HttpSession session)throws Exception{
		MovieUploadSaver fileSaver = new MovieUploadSaver();
		String fileName=fileSaver.filesave(session.getServletContext().getRealPath("resources/movie"), m);
		return fileName;
	}
	
	public int upload(String fname, String oname, String playtime, String startTime, String lastTime)throws Exception{
		return movieUploadDAO.upload(fname, oname, playtime, startTime, lastTime);
	}
	
	public MovieUploadDTO view(Integer movie_num)throws Exception{
		return movieUploadDAO.view(movie_num);
	}
}
