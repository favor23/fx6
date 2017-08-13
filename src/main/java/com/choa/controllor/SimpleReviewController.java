package com.choa.controllor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.choa.review.ReviewDTO;
import com.choa.sr.SimpleReviewDTO;
import com.choa.sr.SimpleReviewService;
import com.choa.util.ListInfo;

@Controller
@RequestMapping(value = "/board/simple_review/**")
public class SimpleReviewController {
	@Autowired
	private SimpleReviewService simpleReviewService;
	
	@RequestMapping(value = "srList")
	public void srList(Integer curPage, Integer movie_num, Model model) {
		List<SimpleReviewDTO> list = null;
		ListInfo listInfo = new ListInfo();
		
		listInfo.setCurPage(curPage);
		listInfo.setMovie_num(movie_num);
		
		try {
			list = simpleReviewService.srList(listInfo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value = "srWrite", method = RequestMethod.POST)
	public String srWrite(SimpleReviewDTO simpleReviewDTO, Model model) {
		int result = 0;
		String message = "Fail!";
		
		try {
			result = simpleReviewService.srWrite(simpleReviewDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(result>0) {
			message = "Success!";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("path", "../movie/movieDetail?movie_num=" + simpleReviewDTO.getMovie_num());
		
		return "commons/result";
	}
	
	@RequestMapping(value = "srGood", method = RequestMethod.GET)
	public String srGood(Integer num, Model model) {
		int result = 0;
		String message = "error!";
		
		try {
			result = simpleReviewService.srGood(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(result>0) {
			message = "한줄평에 공감 하셨습니다.";
		}
		
		model.addAttribute("message", message);
		
		return "commons/ajaxResult";
	}
	
	@RequestMapping(value = "srBad", method = RequestMethod.GET)
	public String srBad(Integer num, Model model) {
		int result = 0;
		String message = "error!";
		
		try {
			result = simpleReviewService.srBad(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if(result>0) {
			message = "한줄평에 비공감 하셨습니다.";
		}
		
		model.addAttribute("message", message);
		
		return "commons/ajaxResult";
	}
	
	@RequestMapping(value = "srDelete", method = RequestMethod.GET)
	public String srDelete(Integer num, Model model) {
		int result = 0;
		String message = "삭제 실패! 자세한 사항은 담당자에게 문의하세요.";
		
		try {
			result = simpleReviewService.srDelete(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(result>0) {
			message = "삭제 되었습니다.";
		}
		
		model.addAttribute("message", message);
		
		return "commons/ajaxResult";
	}
	
	@RequestMapping(value = "rList", method = RequestMethod.GET)
	public void rList(Integer curPage, Integer movie_num, Model model) {
		List<ReviewDTO> list = null;
		ListInfo listInfo = new ListInfo();
		
		int totalCount = 0;
		
		listInfo.setCurPage(curPage);
		listInfo.setMovie_num(movie_num);
		
		try {
			list = simpleReviewService.rList(listInfo);
			totalCount = simpleReviewService.rCount(movie_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("list", list);
		model.addAttribute("totalCount", totalCount);
	}
	
	@RequestMapping(value = "rUpList", method = RequestMethod.GET)
	public void rUpList(Integer curPage, Integer movie_num, Model model) {
		List<ReviewDTO> upList = null;
		ListInfo listInfo = new ListInfo();
		
		int totalCount = 0;
		
		listInfo.setCurPage(curPage);
		listInfo.setMovie_num(movie_num);
		
		try {
			upList = simpleReviewService.rUpList(listInfo);
			totalCount = simpleReviewService.rCount(movie_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("upList", upList);
		model.addAttribute("totalCount", totalCount);
	}
}
