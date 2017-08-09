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
	public void cinema_list(Integer curPage, Model model, HttpServletRequest request, ListInfo listInfo) throws Exception{
		movieController.movieList(curPage, model);
		
		cinemaService.listAll(listInfo);
		
		RoomDTO roomDTO = roomService.playtime(1);
		model.addAttribute("roomDTO", roomDTO);
		model.addAttribute("listInfo", listInfo);
	}
	
	@RequestMapping(value="/board/cinema/cinema_list", method=RequestMethod.POST)
	public void cinema_list2(Integer curPage, Model model){
	}
	
	@RequestMapping(value="/board/cinema/cinema_time")
	public void cinema_time(){
		
	}
	@RequestMapping(value="/board/cinema/cinema_my")
	public String cinema_my(Integer curPage, Model model, HttpSession session, ListInfo listInfo)throws Exception{
		List<MovieDTO> list = null;
		CustomerDTO customerDTO = (CustomerDTO)session.getAttribute("member");
		if(customerDTO==null){
			model.addAttribute("message", "로그인이 필요한 서비스입니다.");
			model.addAttribute("path", "../board/cinema/cinema_list");
			return "/commons/result";
		}
		String id = customerDTO.getId();
		String [] ticket = customerDTO.getTicket().split("/");
		
		listInfo.setCurPage(curPage);
		int [] ticketar = new int[ticket.length];
		for(int q=0;q<ticketar.length;q++){
			ticketar[q] = Integer.parseInt(ticket[q]);
		}
		try {
			list = cinemaService.myList(id, listInfo, ticketar);
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RoomDTO roomDTO = roomService.playtime(1);
		model.addAttribute("roomDTO", roomDTO);
		model.addAttribute("listInfo", listInfo);
		model.addAttribute("list", list);
		model.addAttribute("listInfo", listInfo);
		return "/board/cinema/cinema_my";
	}
	
	@RequestMapping(value="/board/cinema/cinema_hotList")
	public String cinema_hot(Integer curPage, Model model, HttpSession session, ListInfo listInfo)throws Exception{
		List<MovieDTO> list = null;
		CustomerDTO customerDTO = (CustomerDTO)session.getAttribute("member");
		if(customerDTO==null){
			model.addAttribute("message", "로그인이 필요한 서비스입니다.");
			model.addAttribute("path", "../board/cinema/cinema_list");
			return "/commons/result";
		}
		String id = customerDTO.getId();
		String [] genre = customerDTO.getTaste().split(",");
		listInfo.setCurPage(curPage);
		try {
			list = cinemaService.hotList(genre, listInfo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RoomDTO roomDTO = roomService.playtime(1);
		model.addAttribute("roomDTO", roomDTO);
		model.addAttribute("listInfo", listInfo);
		model.addAttribute("ar", genre);
		model.addAttribute("list", list);
		model.addAttribute("listInfo", listInfo);
		return "/board/cinema/cinema_hotList";
		
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
