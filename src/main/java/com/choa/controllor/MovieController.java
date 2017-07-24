package com.choa.controllor;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.choa.file.FileService;
import com.choa.movie.MovieDTO;
import com.choa.movie.MovieService;
import com.choa.util.ListInfo;

@Controller
@RequestMapping(value = "/board/movie/**")
public class MovieController {
	@Autowired
	private MovieService movieService;
	
	@RequestMapping(value = "movieList")
	public void movieList(Model model) {
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
	public void movieList(Integer curPage, Model model) {
		List<MovieDTO> list = null;
		ListInfo listInfo = new ListInfo();
		
		listInfo.setCurPage(curPage);
		
		try {
			list = movieService.movieList(listInfo);
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("list", list);
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
	
	public MovieDTO movieViewdto(Integer movie_num, Model model) throws Exception {
		MovieDTO movieDTO = null;
		movieDTO = movieService.movieView(movie_num);
		return movieDTO;		
	}
	
	@RequestMapping(value = "movieDetail", method = RequestMethod.GET)
	public void movieDetail(Integer movie_num, Model model) {
		MovieDTO movieDTO = null;
		
		Double stars_avg = 0.0;
		int totalCount = 0;
		
		try {
			totalCount = movieService.movieCount();
			movieDTO = movieService.movieView(movie_num);
			stars_avg = movieService.movieStars(movie_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("dto", movieDTO);
		model.addAttribute("stars", stars_avg);
		model.addAttribute("totalCount", totalCount);
	}
	
	@RequestMapping(value = "getDetailList/{curPage}", method = RequestMethod.GET)
	@ResponseBody
	public List<MovieDTO> detailList(@PathVariable("curPage") Integer curPage) {
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
	
	@RequestMapping(value = "movieWriteForm", method = RequestMethod.GET)
	public void movieWrite(String path, Integer movie_num, Model model) {
		if(movie_num!=null) {
			MovieDTO movieDTO = null;
			
			try {
				movieDTO = movieService.movieView(movie_num);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			model.addAttribute("dto", movieDTO);
		}
		model.addAttribute("path", path);
	}
	
	@RequestMapping(value = "movieWrite", method = RequestMethod.POST)
	public String movieWrite(MovieDTO movieDTO, @RequestParam List<String> genre, @RequestParam("f1") MultipartFile f1, HttpSession session, Model model) {
		int result = 0;
		String message = "추가 실패! 자세한 사항은 담당자에게 문의하세요.";
		String temp = "";
		
		FileService fileService = new FileService();
		
		String fileName = "";
		
		for(String g: genre) {
			temp += g + "/";
		}
		
		movieDTO.setGenre(temp);
		
		try {
			fileName = fileService.fileSave(f1, session);
			
			movieDTO.setPoster_img("/img/movie-img/" + fileName);
			
			result = movieService.movieWrite(movieDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(result>0) {
			message = "추가 성공! 리스트에서 확인하세요.";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("path", "../movie/movieList");
		
		return "commons/result";
	}
	
	@RequestMapping(value = "movieUpdate", method = RequestMethod.POST)
	public String movieUpdate(MovieDTO movieDTO, @RequestParam List<String> genre, Model model) {
		int result = 0;
		String message = "수정 실패! 자세한 사항은 담당자에게 문의하세요.";
		String temp = "";
		
		for(String g: genre) {
			temp += g + "/";
		}
		
		movieDTO.setGenre(temp);
		
		try {
			result = movieService.movieUpdate(movieDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(result>0) {
			message = "수정 성공! 리스트에서 확인하세요.";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("path", "../movie/movieList");
		
		return "commons/result";
	}
	
	@RequestMapping(value = "movieDelete", method = RequestMethod.GET)
	public String movieDelete(Integer movie_num, Model model) {
		int result = 0;
		String message = "삭제 실패! 자세한 사항은 담당자에게 문의하세요.";
		
		try {
			result = movieService.movieDelete(movie_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(result>0) {
			message = "삭제 성공!";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("path", "../movie/movieList");
		
		return "commons/result";
	}
}
