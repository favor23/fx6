package com.choa.controllor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.choa.apply.ApplyDTO;
import com.choa.apply.ApplyService;
import com.choa.util.ListInfo;

@Controller
@RequestMapping(value="/board/matching/**")
public class ApplyController {
	
	@Autowired
	private ApplyService applyService;
	
	@RequestMapping(value="applyWrite", method=RequestMethod.POST)
	public String applyWriter(ApplyDTO applyDTO, Model model){
		
		int result=0;
		String message="지원을 실패했습니다.";
		
		try {
			result=applyService.applyWrite(applyDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(result>0){
			message="지원을 완료했습니다.";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("path", "matchingList");
		
		return "commons/result";
	}
	
	@RequestMapping(value="applyList", method=RequestMethod.GET)
	public String applyList(Model model, ApplyDTO applyDTO){
		
		List<ApplyDTO> ar = null;
		
		
		try {
			ar=applyService.applyList(applyDTO);
			model.addAttribute("list", ar);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "board/matching/applyList";
	}
	
	
	@RequestMapping(value="applyList2", method=RequestMethod.GET)
	public String applyList2(Model model, ApplyDTO applyDTO){
		
		List<ApplyDTO> ar = null;
		
		
		try {
			ar=applyService.applyList(applyDTO);
			model.addAttribute("list", ar);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "board/matching/applyList2";
	}
	
	
	@RequestMapping(value="applyList3", method=RequestMethod.GET)
	public String applyList3(Model model, ApplyDTO applyDTO){
		
		List<ApplyDTO> ar = null;
		
		
		try {
			ar=applyService.applyList(applyDTO);
			model.addAttribute("list", ar);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "board/matching/applyList3";
	}

}
