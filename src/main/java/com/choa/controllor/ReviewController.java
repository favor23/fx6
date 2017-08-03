package com.choa.controllor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.choa.reply.ReplyDTO;
import com.choa.review.ReviewDTO;
import com.choa.review.ReviewService;
import com.choa.util.ListInfo;

@Controller
@RequestMapping(value="/board/review/**")
public class ReviewController {
	
	
	@Autowired
	private ReviewService reviewService;

	//list
	@RequestMapping(value="reviewList", method=RequestMethod.GET)
	public String reviewList(Model model, ListInfo listInfo){
		
		List<ReviewDTO> ar=null;
		
			try {
				ar = reviewService.reviewList(listInfo);
				model.addAttribute("list", ar);
				model.addAttribute("listInfo", listInfo);
				model.addAttribute("Rnum",61);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
		
		return "board/review/reviewList";
	}
	
	
	
	//writeForm
	@RequestMapping(value="reviewWrite", method=RequestMethod.GET)
	public String reviewWrite(Model model, ReplyDTO replyDTO){
		model.addAttribute("dto", replyDTO);
		model.addAttribute("path", "Write");
		
		return "board/review/reviewWrite";
		
	}
	
	
	//write	
	@RequestMapping(value="reviewWrite", method=RequestMethod.POST)
	public String reviewWrite(ReviewDTO reviewDTO, Model model){
		
		int result = 0;
		String message = "리뷰 작성을 실패했습니다.";
		
		
		try {
			 result = reviewService.reviewWrite(reviewDTO);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result>0){
			message="리뷰 작성을 성공했습니다.";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("path", "reviewList");
		
		return "commons/result";
	}
	
	//view
	@RequestMapping(value="reviewView", method=RequestMethod.GET)
	public String reviewView(Integer num, Model model){
		
		ReviewDTO reviewDTO=null;
	
		try {
			
			reviewDTO = reviewService.reviewView(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("view", reviewDTO);
	
		return "board/review/reviewView";
	}
	
	
	//delete
	@RequestMapping(value="reviewDelete", method=RequestMethod.GET)
	public String reviewDelete(int num, Model model){
		
		int result = 0;
		String message=null;
		
		
		try {
			result=reviewService.reviewDelete(num);
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
	
	
	//updateForm
	@RequestMapping(value="reviewUpdate", method=RequestMethod.GET)
	public String reviewUpdate(Integer num, Model model){
		
		ReviewDTO reviewDTO=null;
		try {
			reviewDTO = reviewService.reviewView(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("path", "Update");
		model.addAttribute("dto", reviewDTO);
		
		return "board/review/reviewWrite";
		
		
	}
	
	
	
	
	
	//update
	@RequestMapping(value="reviewUpdate" , method=RequestMethod.POST)
	public String reviewUpdate(ReviewDTO reviewDTO, Model model){
		int result =0;
		String message=null;
		
		
		try {
			result = reviewService.reviewUpdate(reviewDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		message="업데이트를 실패했습니다.";
		
		if(result>0){
			message="업데이트를 성공했습니다.";
		}
		
		
		model.addAttribute("message", message);
		model.addAttribute("path", "reviewList");
		
		return "commons/result";
		
		
	}
}