package com.choa.controllor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.choa.movie.MovieService;

@Controller
@RequestMapping(value = "/board/simple_review/**")
public class SimpleReviewController {
	@Autowired
	private MovieService movieService;
	
	@RequestMapping(value = "")
	public void srList() {
		
	}
}
