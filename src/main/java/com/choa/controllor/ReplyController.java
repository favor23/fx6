package com.choa.controllor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.choa.reply.ReplyDTO;
import com.choa.reply.ReplyService;
import com.choa.review.ReviewDTO;
import com.choa.util.ListInfo;


@Controller
@RequestMapping(value="/board/review/**")
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping(value="reviewReply", method=RequestMethod.GET)
	public String replyList(Model model, ListInfo listInfo, Integer review_num){
		
		List<ReplyDTO> ar = null;
		
		try {
			ar=replyService.replyList(listInfo, review_num);
			/*model.addAttribute("Rnum", 61);*/
			model.addAttribute("list", ar);
			model.addAttribute("listInfo", listInfo);
			model.addAttribute("path", "Write");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
 		return "board/review/reviewReply";
		
	}
	
	
	
	
	@RequestMapping(value="replyWrite", method=RequestMethod.POST)
	public String replyWrite(ReplyDTO replyDTO, Model model){
		
		int result =0;
		String message ="댓글 작성을 실패했습니다.";
		
		
		try {
			result = replyService.replyWirte(replyDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result>0){
			message="댓글 작성을 성공했습니다.";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("path", "reviewList");
	
		return "commons/result";
		
	}
	
	@RequestMapping(value="replyDelete", method=RequestMethod.GET)
	public String replyDelete(Integer reply_num, Model model){
		
		int result=0;
		String message = null;
		
		
		try {
			result = replyService.replyDelete(reply_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		message="삭제를 실패했습니다.";
		
		if(result>0){
			message="삭제를 성공했습니다.";
		}
		
		
		model.addAttribute("message", message);
		model.addAttribute("path", "reviewList");
		
		return "commons/result";
	}
	
	
	
	@RequestMapping(value="replyUpdate", method=RequestMethod.GET)
	public String replyUpdate(Model model, ListInfo listInfo, Integer review_num){
		
		List<ReplyDTO> ar = null;
		
		try {
			ar=replyService.replyList(listInfo, review_num);
			model.addAttribute("update", ar);
			model.addAttribute("listInfo", listInfo);
			model.addAttribute("path", "Update");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "board/review/reviewReply";
	}
	
	
	@RequestMapping(value="replyUpdate", method=RequestMethod.POST)
	public String replyUpdate(ReplyDTO replyDTO, Model model){
		int result = 0;
		String message = null;
		
		try {
			result = replyService.replyUpdate(replyDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		message="댓글 수정을 실패했습니다.";
		
		if(result>0){
			message="댓글 수정을 완료했습니다.";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("path", "reviewList");
		
		return "commons/result";
	}
	
	@RequestMapping(value="replyMod", method=RequestMethod.GET)
	public void replyMod(ReplyDTO replyDTO, Model model) throws Exception{		
		String message = null;	
		 replyService.replyUpdate(replyDTO);		
		
	}
	
	

}
