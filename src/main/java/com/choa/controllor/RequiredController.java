package com.choa.controllor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.choa.required.RequiredDTO;
import com.choa.required.RequiredService;
import com.choa.util.ListInfo;

@Controller
@RequestMapping(value="/board/required/**")
public class RequiredController {

	
	
	
	@Autowired
	private RequiredService requiredService;
	
	
	//list
	@RequestMapping(value="requiredList", method=RequestMethod.GET)
	public String requiredList(Model model, ListInfo listInfo){
		
		List<RequiredDTO> ar = null;
		
		try {
			ar=requiredService.requireList(listInfo);
			model.addAttribute("list", ar);
			model.addAttribute("listInfo", listInfo);
			model.addAttribute("Qnum", 81);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "board/required/requiredList";
		
	}
	
	
	//writeForm
	@RequestMapping(value="requiredWrite", method=RequestMethod.GET)
	public String requiredWrite(Model model){
		model.addAttribute("path", "Write");
		
		return "board/required/requiredWrite";
	}
	
	
	//write
	@RequestMapping(value="requiredWrite", method=RequestMethod.POST)
	public String  requiredWrite(RequiredDTO requiredDTO, Model model){
		
		int result = 0;
		String message = "요청을 실패했습니다.";
		
		
		try {
			result = requiredService.requiredWrite(requiredDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(result>0){
			message="요청을 성공했습니다.";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("path", "requiredList");
		
		return "commons/result";
	}
	
	
	//view
	@RequestMapping(value="requiredView", method=RequestMethod.GET)
	public String requiredView(Integer num, Model model){
		
		RequiredDTO requiredDTO = null;
		
		try {
			requiredDTO = requiredService.requiredView(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("view", requiredDTO);
		
		return "board/required/requiredView";
		
	}
	
	
	//delete
	@RequestMapping(value="requiredDelete", method=RequestMethod.GET)
	public String requiredDelete(int num, Model model){
		
		int result = 0;
		String message = null;
		
		
		try {
			result= requiredService.requiredDelete(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		message ="삭제를 실패했습니다.";
		
		if(result>0){
			message="삭제를 성공했습니다.";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("path", "requiredList");
		
		return "commons/result";
	}
	
	//updateForm
	@RequestMapping(value="requiredUpdate", method=RequestMethod.GET)
	public String requiredUpdate(Integer num, Model model){
		
		RequiredDTO requiredDTO = null;
		try {
			requiredDTO = requiredService.requiredView(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("path", "Update");
		model.addAttribute("dto", requiredDTO);
		
		return "board/required/requiredWrite";
		
	}
	
	//update
	@RequestMapping(value="requiredUpdate", method=RequestMethod.POST)
	public String requiredUpdate(RequiredDTO requiredDTO, Model model){
		int result = 0;
		String message=null;
		
		
		try {
			result = requiredService.requiredUpdate(requiredDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		message="업데이트에 실패했습니다.";
		
		if(result>0){
			message="업데이트에 성공했습니다.";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("path", "requiredList");
		
		return "commons/result";
	}
	
	
	
	//replyForm
	@RequestMapping(value="requiredReply", method=RequestMethod.GET)
	public String requiredReply(Model model, int num){
		model.addAttribute("path", "Reply");
		model.addAttribute("reply", num);
		return "board/required/requiredWrite";
	}
	
	
	//reply
	@RequestMapping(value="requiredReply", method=RequestMethod.POST)
	public String  requiredReply(RequiredDTO requiredDTO, Model model){
		
		System.out.println("dkdjk");
		int result = 0;
		String message = "답글 작성을 실패했습니다.";
		
		
		try {
			result = requiredService.requiredReply(requiredDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(result>0){
			message="답글 작성을 성공했습니다.";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("path", "requiredList");
		
		return "commons/result";
	}
	
}