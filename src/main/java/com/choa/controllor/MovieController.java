package com.choa.controllor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choa.movie.MovieDAO;
import com.choa.movie.MovieDTO;
import com.choa.movie.MovieService;
import com.choa.util.ListInfo;

@Controller
@RequestMapping(value = "/board/movie/**")
public class MovieController {
	@Autowired
	private MovieService movieService;
	
	@RequestMapping(value = "movieList")
	public void movieList2(Model model) {
		int totalCount = 0;

		try {
			totalCount = movieService.movieCount();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("totalCount", totalCount);
	}
	
	@RequestMapping(value = "getMovieList", method = RequestMethod.GET)
	@ResponseBody
	public List<MovieDTO> movieList(Integer curPage) {
		List<MovieDTO> list = null;
		ListInfo listInfo = new ListInfo();
		
		listInfo.setCurPage(curPage);
		
		try {
			list = movieService.movieList(listInfo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	@RequestMapping(value = "movieView", method = RequestMethod.GET)
	public void movieView(Integer movie_num, Model model) {
		MovieDTO movieDTO = null;
		
		try {
			movieDTO = movieService.movieView(movie_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("dto", movieDTO);
	}
}
