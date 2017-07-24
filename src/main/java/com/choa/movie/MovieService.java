package com.choa.movie;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.choa.util.ListInfo;

import oracle.net.aso.d;

@Service
public class MovieService {
	@Autowired
	private MovieDAO movieDAO;
	
	public List<MovieDTO> movieList(ListInfo listInfo) throws Exception {
		int totalCount = movieDAO.movieCount();
		
		listInfo.makePage(totalCount);
		listInfo.setRow();
		
		return movieDAO.movieList(listInfo);
	}
	
	public int movieCount() throws Exception {
		return movieDAO.movieCount();
	}
	
	public MovieDTO movieView(int movie_num) throws Exception {
		return movieDAO.movieView(movie_num);
	}
	
	public Double movieStars(int movie_num) throws Exception {
		return movieDAO.movieStars(movie_num);
	}
	
	public int movieWrite(MovieDTO movieDTO) throws Exception {
		return movieDAO.movieWrite(movieDTO);
	}
	
	public int movieUpdate(MovieDTO movieDTO) throws Exception {
		return movieDAO.movieUpdate(movieDTO);
	}
	
	public int movieDelete(int movie_num) throws Exception {
		return movieDAO.movieDelete(movie_num);
	}
	
	public Double movieSrStars(int movie_num) throws Exception {
		return movieDAO.movieSrStars(movie_num);
	}
}
