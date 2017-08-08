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
	
	public List<MovieDTO> listAll(ListInfo listInfo)throws Exception{
		int result = cinemaDAO.countAll(listInfo);
		listInfo.makePage(result);
		listInfo.setRow();
		return cinemaDAO.listAll(listInfo);
	}
	
	public List<MovieDTO> myList(String id, ListInfo listInfo, int [] ticketar)throws Exception{		
		int result = cinemaDAO.countMy(listInfo, ticketar);
		listInfo.makePage(result);
		listInfo.setRow();
		
		return cinemaDAO.myList(id, listInfo, ticketar);
	}
	
	public List<MovieDTO> schedule()throws Exception{
		return cinemaDAO.schedule();
	}
	
	public List<MovieDTO> hotList(String [] genre, ListInfo listInfo)throws Exception{
		System.out.println(genre.length);
		for(int i =0; i<genre.length;i++){
			genre[i] = "%"+genre[i]+"%";
		}
		int result = cinemaDAO.countHot(listInfo, genre);
		listInfo.makePage(result);
		listInfo.setRow();
		
		return cinemaDAO.hotList(listInfo, genre);
	}
	
}
