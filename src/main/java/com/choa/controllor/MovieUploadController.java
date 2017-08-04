package com.choa.controllor;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.choa.movieupload.MovieUploadService;


@Controller
public class MovieUploadController {

	@Autowired
	private MovieUploadService movieUploadService;
	
	
	@RequestMapping(value="movieupload/movieupload", method=RequestMethod.GET)
	public void movieUpload()throws Exception{}
	
	
	@RequestMapping(value="movieupload/movieupload", method=RequestMethod.POST)
	public String movieUpload(String playtime, String startTime, String lastTime, MultipartFile f1, HttpSession session)throws Exception{
		String fname = movieUploadService.fileSave(f1, session);
		String oname = f1.getOriginalFilename();
		movieUploadService.upload(fname, oname, playtime, startTime, lastTime);
		return "redirect:/";
	}
	
	@RequestMapping(value="movieupload/movieView")
	public void movieView(Integer movie_num){
		
	}
	
	@RequestMapping(value="movieupload/movieuploadpage")
	public void movieUploadPage()throws Exception{
		
	}
}
