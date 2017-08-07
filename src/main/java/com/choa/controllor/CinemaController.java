package com.choa.controllor;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.choa.cinema.CinemaService;
import com.choa.customer.CustomerDTO;
import com.choa.member.MemberDTO;
import com.choa.movie.MovieDTO;
import com.choa.room.RoomDTO;
import com.choa.room.RoomService;
import com.choa.util.ListInfo;

@Controller
public class CinemaController {
	
	@Autowired
	private MovieController movieController;
	@Autowired
	private RoomService roomService;
	@Autowired
	private CinemaService cinemaService;

	
	@RequestMapping(value="/board/cinema/cinema_list")
	public void cinema_list(Integer curPage, Model model, HttpServletRequest request) throws Exception{
		movieController.movieList(curPage, model);
		RoomDTO roomDTO = roomService.playtime(1);
		model.addAttribute("roomDTO", roomDTO);
	}
	
	@RequestMapping(value="/board/cinema/cinema_list", method=RequestMethod.POST)
	public void cinema_list2(Integer curPage, Model model){
	}
	
	@RequestMapping(value="/board/cinema/cinema_time")
	public void cinema_time(){
		
	}
	@RequestMapping(value="/board/cinema/cinema_my")
	public void cinema_my(Integer curPage, Model model, HttpSession session){
		List<MovieDTO> list = null;
		ListInfo listInfo = new ListInfo();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		String id = memberDTO.getId();
		System.out.println(id);
		System.out.println("cinema Controller MY");
		
		listInfo.setCurPage(curPage);
		
		try {
			list = cinemaService.myList(id, listInfo);
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value="/board/cinema/cinema_hotList")
	public void cinema_hot(Integer curPage, Model model, HttpSession session)throws Exception{
		List<MovieDTO> list = new ArrayList<MovieDTO>();
		
		list = cinemaService.listAll();
		
		CustomerDTO customerDTO = (CustomerDTO)session.getAttribute("member");
		String genre = customerDTO.getTaste();
		String [] genre_ar = genre.split(",");
		model.addAttribute("ar", genre_ar);
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value="/board/cinema/cinema_scheduleList")
	public void cinema_scheduleList(Integer curPage, Model model, HttpSession session)throws Exception{
		List<MovieDTO> list = new ArrayList<MovieDTO>();
		list = cinemaService.schedule();
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value="/board/cinema/cinema_scheduleList", method=RequestMethod.POST)
	public void cinema_scheduleList2(){
		
	}
	
	
}
