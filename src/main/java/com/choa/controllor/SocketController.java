package com.choa.controllor;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.lang.reflect.Parameter;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.log4j.SimpleLayout;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.choa.chat.EchoHandler;
import com.choa.chatting.ChattingDTO;
import com.choa.chatting.ChattingService;
import com.choa.customer.CustomerDTO;
import com.choa.member.MemberDTO;
import com.choa.movieupload.MovieUploadDTO;
import com.choa.movieupload.MovieUploadService;
import com.choa.room.RoomDTO;
import com.choa.room.RoomService;
import com.choa.room.roomuser.RoomUserDTO;
import com.choa.room.roomuser.RoomUserService;

@Controller
@RequestMapping(value="/chatting/**")
public class SocketController {
	
	@Inject
	private EchoHandler echoHandler;
	@Inject
	private RoomUserService roomUserService;
	@Autowired
	private MovieUploadService movieUploadService;
	@Autowired
	private RoomService roomService;
	@Autowired
	private ChattingService chattingService;
	private int aaa=0;
	

	   @RequestMapping(value="chch", method=RequestMethod.POST)
	   public String input(Integer num, String writer, String contents, String grade, Model model, HttpServletRequest request)throws Exception{
	      CustomerDTO customerDTO=(CustomerDTO)request.getSession().getAttribute("member");
	      System.out.println("grade:"+grade);
	      if(customerDTO.getGrade().equals(grade)){
	         int a = chattingService.chatting(num, writer, contents, grade);
	         System.out.println("if : "+a);
	      }else{
	         int a = chattingService.chatting2(num, writer, contents);
	         System.out.println("else : "+a);
	      }
	      model.addAttribute("message", "asa");

	      return "/commons/ajaxResult";
	   }
	
	
	   @RequestMapping(value="aaa")
		public void aaa(HttpServletRequest request,Model model) throws Exception{
			CustomerDTO customerDTO=(CustomerDTO)request.getSession().getAttribute("member");
			RoomUserDTO rDto=new RoomUserDTO();
			List<RoomUserDTO> list = roomUserService.selectList();
			int ck=0;
			rDto.setNum(Integer.parseInt(customerDTO.getPlayView()));
			rDto.setUser_array(list.get(Integer.parseInt(customerDTO.getPlayView())-1).getUser_array()+"/"+customerDTO.getId());
			String str[] = list.get(Integer.parseInt(customerDTO.getPlayView())-1).getUser_array().split("/");
			for (int j = 0; j < str.length; j++) {
				if(str[j].equals(customerDTO.getId())){
					ck=1;
				}
			}
			
			if(ck==0){
				roomUserService.update(rDto);
			}
			
			list = roomUserService.selectList();
			str = list.get(Integer.parseInt(customerDTO.getPlayView())-1).getUser_array().split("/");
			MovieUploadDTO movieUploadDTO = new MovieUploadDTO();
			movieUploadDTO = movieView(Integer.parseInt(customerDTO.getPlayView()));
			RoomDTO roomDTO = new RoomDTO();
			roomDTO = roomService.playtime(Integer.parseInt(customerDTO.getPlayView()));

			roomDTO.getStartTime();
			
	        /*orderDTO.setOrder_time(rs.getTimestamp("order_time").toString());*/
	        //date는 시분초가 나오지 않는다 그러므로 문자열로 date 대신 string 으로 바꿔서 사용한다 Timestamp는 시분초까지 받는다.
			
			
			if(movieUploadDTO!=null){
				model.addAttribute("view", movieUploadDTO);
			}
			
			model.addAttribute("roomDTO", roomDTO);
			model.addAttribute("count", str.length);
			model.addAttribute("str",str);
			model.addAttribute("list", list);
		}
	
	@RequestMapping(value="aaa1")
	public String aaa1(){
		return "/paySystem/aaa";		
	}
	
	public MovieUploadDTO movieView(Integer movie_num) throws Exception{
		MovieUploadDTO movieUploadDTO = new MovieUploadDTO();
		movieUploadDTO = movieUploadService.view(movie_num);
		return movieUploadDTO;
	}
	
	@RequestMapping(value="bbb")
	public void bbb(HttpServletRequest request,Model model) throws Exception{
		CustomerDTO customerDTO=(CustomerDTO)request.getSession().getAttribute("member");
		RoomUserDTO rDto=new RoomUserDTO();
		List<RoomUserDTO> list = roomUserService.selectList();	
		int ck=0;
		
		rDto.setNum(Integer.parseInt(customerDTO.getPlayView()));
		rDto.setUser_array(list.get(Integer.parseInt(customerDTO.getPlayView())-1).getUser_array()+"/"+customerDTO.getId());
		String str[] = list.get(Integer.parseInt(customerDTO.getPlayView())-1).getUser_array().split("/");
		for (int j = 0; j < str.length; j++) {
			if(str[j].equals(customerDTO.getId())){
				ck=1;
			}
		}
		
		if(ck==0){
			roomUserService.update(rDto);
		}
		
		list = roomUserService.selectList();
		str = list.get(Integer.parseInt(customerDTO.getPlayView())-1).getUser_array().split("/");
		
		RoomDTO roomDTO = new RoomDTO();
		roomDTO = roomService.playtime(Integer.parseInt(customerDTO.getPlayView()));
		model.addAttribute("roomDTO", roomDTO);
		model.addAttribute("count", str.length);
		model.addAttribute("str",str);
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value="ticket", method=RequestMethod.POST)
	public String ticket(String movie_num, HttpSession session){
		System.out.println("ticket");
		CustomerDTO customerDTO = (CustomerDTO)session.getAttribute("member");
		String id = customerDTO.getId();
		int check = 0;
		String [] ticket = customerDTO.getTicket().split("/");
		String str = null;
		for(int i=0;i<ticket.length;i++){
			if(ticket[i].equals(movie_num)){
				customerDTO.setPlayView(customerDTO.getPlayView()+"/"+ticket[i]);
				check=1;
			}else{
				str = str+"/"+ticket[i];
			}
		}
		if(check==1){
			customerDTO.setTicket(str);
			chattingService.ticket(customerDTO);
			session.setAttribute("member", customerDTO);
			return "/chatting/bbb";
		}else{
			return "/index";
		}
	}
	
	@RequestMapping(value="playview", method=RequestMethod.POST)
	public String playview(int movie_num, HttpSession session){
		
		CustomerDTO customerDTO = (CustomerDTO)session.getAttribute("member");
		String id = customerDTO.getId();
		int check = 0;
		String [] playview = customerDTO.getPlayView().split("/");
		String str = null;
		for(int i=0;i<playview.length;i++){
			if(playview[i].equals(movie_num)){
				customerDTO.setReView(customerDTO.getPlayView()+"/"+playview[i]);
				check=1;
			}else{
				str = str+"/"+playview[i];
			}
		}
		if(check==1){
			customerDTO.setPlayView(str);
			chattingService.playview(customerDTO);
			session.setAttribute("member", customerDTO);
			return "/index";
		}else{
			return "/index";
		}
	}
	
	@RequestMapping(value="playtimeUpdate", method=RequestMethod.POST)
	public String playtimeUpdate(Integer num, String play_Time, String startTime, String lastTime, Model model)throws Exception{
		RoomDTO roomDTO = new RoomDTO();
		roomDTO.setNum(num);
		roomDTO.setLastTime(lastTime);
		roomDTO.setPlay_Time(play_Time);
		Long starttt = Long.parseLong(startTime);
		starttt = starttt+40000;
		String startt = String.valueOf(starttt);
		roomDTO.setStartTime(startt);
		System.out.println(roomDTO.getStartTime());
		System.out.println(startt+40000);
		int a = roomService.playtimeUpdate(roomDTO);
		
		model.addAttribute("message", "asa");
		
		return "/commons/ajaxResult";
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*@RequestMapping("chat1")
	public String viewChattingPage(HttpServletRequest request,HttpServletResponse response) throws Exception{
		int ck=0;
		CustomerDTO customerDTO=(CustomerDTO)request.getSession().getAttribute("member");
		System.out.println(customerDTO.getId());
		RoomUserDTO rDto=new RoomUserDTO();
		rDto.setNum(Integer.parseInt(customerDTO.getPlayView()));
		rDto=roomUserService.selectone(1);
		System.out.println(rDto.getUser_array());
		List<RoomUserDTO> list = roomUserService.selectList();
		System.out.println(list.get(Integer.parseInt(customerDTO.getPlayView())-1).getUser_array());
		rDto.setNum(Integer.parseInt(customerDTO.getPlayView()));
		rDto.setUser_array(list.get(Integer.parseInt(customerDTO.getPlayView())-1).getUser_array()+"/"+customerDTO.getId());
		String str[] = list.get(Integer.parseInt(customerDTO.getPlayView())-1).getUser_array().split("/");
		for (int j = 0; j < str.length; j++) {
			if(str[j].equals(customerDTO.getId())){
				ck=1;
			}
			System.out.println(str[j]);
		}
		System.out.println("ck : "+ck);
		if(ck==0){
			System.out.println(rDto.getUser_array());
			roomUserService.update(rDto);
		}
		echoHandler.setId(customerDTO.getId());
		if(aaa==0){
			echoHandler.setRoomCount(roomUserService.count());
			this.aaa=1;
		}
		list=roomUserService.selectList();
		echoHandler.setRoomUserDTO(list);
		return "/chatting/chat";
	}*/
	
	/*@RequestMapping("chat2")
	public String viewChattingPage2(HttpServletRequest request,HttpServletResponse response) throws Exception{
		int ck=0;
		CustomerDTO customerDTO=(CustomerDTO)request.getSession().getAttribute("member");
		System.out.println(customerDTO.getId());
		RoomUserDTO rDto=new RoomUserDTO();		
		List<RoomUserDTO> list = roomUserService.selectList();
		System.out.println("제발좀 1좀주라 : "+Integer.parseInt(customerDTO.getPlayView()));
		System.out.println(list.get(Integer.parseInt(customerDTO.getPlayView())-1).getUser_array());
		rDto.setNum(Integer.parseInt(customerDTO.getPlayView()));
		rDto.setUser_array(list.get(Integer.parseInt(customerDTO.getPlayView())-1).getUser_array()+"/"+customerDTO.getId());
		String str[] = list.get(Integer.parseInt(customerDTO.getPlayView())-1).getUser_array().split("/");
		for (int j = 0; j < str.length; j++) {
			if(str[j].equals(customerDTO.getId())){
				ck=1;
			}
			System.out.println(str[j]);
		}
		System.out.println("ck : "+ck);
		if(ck==0){
			System.out.println(rDto.getUser_array());
			roomUserService.update(rDto);
		}
		echoHandler.setId(customerDTO.getId());
		if(aaa==0){
			echoHandler.setRoomCount(roomUserService.count());
			this.aaa=1;
		}
		list=roomUserService.selectList();
		echoHandler.setRoomUserDTO(list);
		return "/chatting/chat";
	}
	
	@RequestMapping("chat3")
	public String viewChattingPage3(HttpServletRequest request,String room_num,String ticket){
		CustomerDTO cdto=(CustomerDTO)request.getSession().getAttribute("member");
		MemberDTO dto=(MemberDTO)request.getSession().getAttribute("member");
		if(cdto.getTicket().equals(ticket)){
		return "/chatting/chat";
		}
		else{
			return "예매페이지ㄱㄱ";
		}
	}
	@RequestMapping("chat4")
	public String viewChattingPage4(HttpServletRequest request){		
		return "/chatting/chat";
	}
	@RequestMapping("chat5")
	public String viewChattingPage5(HttpServletRequest request){	
		return "/chatting/chat";
	}
	
	@RequestMapping("chatTest")
	public void viewChattingPage1(){
	}
	
	@RequestMapping("paint")
	public void viewPaintingPage(){
	}*/
}
