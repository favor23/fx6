package com.choa.cinema;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.choa.movie.MovieDAO;
import com.choa.movie.MovieDTO;
import com.choa.util.ListInfo;

@Service
public class CinemaService {

	@Autowired
	private CinemaDAO cinemaDAO;
	@Autowired
	private MovieDAO movieDAO;
	
	public List<MovieDTO> listAll()throws Exception{
		return cinemaDAO.listAll();
	}
	
	public List<MovieDTO> myList(String id, ListInfo listInfo)throws Exception{
		int totalCount = movieDAO.movieCount();
		listInfo.makePage(totalCount);
		listInfo.setRow();
		
		return cinemaDAO.myList(id, listInfo);
	}
	
	public List<MovieDTO> schedule()throws Exception{
		return cinemaDAO.schedule();
	}
	
	public List<MovieDTO> hotList(String [] genrear, ListInfo listInfo)throws Exception{
		int totalCount = movieDAO.movieCount();
		listInfo.makePage(totalCount);
		listInfo.setRow();
		
		return cinemaDAO.hotList(genrear, listInfo);
	}
	
}
