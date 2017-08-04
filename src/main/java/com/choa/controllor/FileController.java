package com.choa.controllor;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.choa.customer.CustomerDTO;
import com.choa.file.FileDTO;
import com.choa.file.FileService;
import com.choa.prfile.PrFileService;

@Controller
public class FileController {

	@Autowired
	private PrFileService fileService;	
	
	public void fileUpload(MultipartHttpServletRequest request){}
	
	@RequestMapping(value="member/file_upload", method=RequestMethod.POST)
	public String fileUpload(String id,MultipartFile f1, HttpSession session,Model model) throws Exception{
		FileService f = new FileService();
		CustomerDTO customerDTO = (CustomerDTO)session.getAttribute("member");
		if(id.equals(customerDTO.getId())){			
			String fName=f.fileSave(f1, session);
			String oName=f1.getOriginalFilename();
			fileService.upload(id, fName, oName);
			return "업로드 후 이동할 경로";
		}else {
			return "본인이 아닐때 이동할 경로";
		}
		
	}
	
	@RequestMapping(value="member/win_pic")
	public void win_pic()throws Exception{}//사진 업로드하는 새창 (조그만 창이 새로 열림)	

	
	public void fileUpload(FileDTO fileDTO){}

	

}
