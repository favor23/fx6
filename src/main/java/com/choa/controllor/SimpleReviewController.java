package com.choa.controllor;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.choa.movie.MovieDTO;
import com.choa.movie.MovieService;
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
		String message = "한줄평 등록 실패! 자세한 사항은 담당자에게 문의하세요.";
		
		try {
			result = simpleReviewService.srWrite(simpleReviewDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(result>0) {
			message = "한줄평 등록 성공! 리스트에서 확인하세요.";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("path", "../movie/movieDetail?movie_num=" + simpleReviewDTO.getMovie_num());
		
		return "commons/result";
	}
}
