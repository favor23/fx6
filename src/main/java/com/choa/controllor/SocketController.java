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
		public void aaa(HttpServletRequest request,Model model, int movieRoomNum) throws Exception{
		   System.out.println("aaa : "+movieRoomNum);
			CustomerDTO customerDTO=(CustomerDTO)request.getSession().getAttribute("member");
			RoomUserDTO rDto=new RoomUserDTO();
			List<RoomUserDTO> list = roomUserService.selectList();
			int ck=0;
			rDto.setNum(movieRoomNum);
			String [] playar = customerDTO.getPlayView().split("/");
			System.out.println("playar : "+playar);
			System.out.println("movieRoomNum : "+movieRoomNum);
			String [] userar = list.get(movieRoomNum-1).getUser_array().split("/");
			for (int j = 0; j < userar.length; j++) {
				if(userar[j].equals(customerDTO.getId())){
					ck=1;
				}
			}
			
			if(ck==0){
				roomUserService.update(rDto);
			}
			
			list = roomUserService.selectList();
			userar = list.get(movieRoomNum-1).getUser_array().split("/");
			MovieUploadDTO movieUploadDTO = new MovieUploadDTO();
			movieUploadDTO = movieView(movieRoomNum);
			RoomDTO roomDTO = new RoomDTO();
			roomDTO = roomService.playtime(movieRoomNum);

			roomDTO.getStartTime();
			
			if(movieUploadDTO!=null){
				model.addAttribute("view", movieUploadDTO);
			}
			
			model.addAttribute("movie_num", movieRoomNum);
			model.addAttribute("roomDTO", roomDTO);
			model.addAttribute("count", userar.length);
			model.addAttribute("str", userar);
			model.addAttribute("list", list);
		}
	   
	   
		@RequestMapping(value="bbb")
		public void bbb(HttpServletRequest request,Model model, int movieRoomNum) throws Exception{
			CustomerDTO customerDTO=(CustomerDTO)request.getSession().getAttribute("member");
			RoomUserDTO rDto=new RoomUserDTO();
			List<RoomUserDTO> list = roomUserService.selectList();	
			int ck=0;
			
			rDto.setNum(movieRoomNum);
			String [] playar = customerDTO.getPlayView().split("/");
			
			
			//movieRoomNum이 customer이 가지고 있는 티켓과 같은지 확인하고
			//rDto.getNum이 movieRoomNum이랑 같은지 확인하고 없으면 생성
			
			
			String [] userar = list.get(movieRoomNum-1).getUser_array().split("/");
			
			for(int q=0;q<userar.length;q++){
				if(!userar[q].equals(customerDTO.getId())){
					rDto.setUser_array(list.get(movieRoomNum-1).getUser_array()+"/"+customerDTO.getId());
					System.out.println("bbbbb : "+rDto.getUser_array());
					ck=1;
				}else{
					rDto.setUser_array(list.get(movieRoomNum-1).getUser_array());
					System.out.println("bbbbb : "+rDto.getUser_array());
					ck=0;
					break;
				}
			}
			
			/*if(rDto.getUser_array())*/
			
			/*String str[] = list.get(Integer.parseInt(customerDTO.getPlayView())-1).getUser_array().split("/");
			for (int j = 0; j < str.length; j++) {
				if(str[j].equals(customerDTO.getId())){
					ck=1;
				}
			}*/
			
			if(ck==1){
				roomUserService.update(rDto);
			}
			
			list = roomUserService.selectList();

			RoomDTO roomDTO = new RoomDTO();
			roomDTO = roomService.playtime(movieRoomNum);
			model.addAttribute("roomDTO", roomDTO);
			model.addAttribute("count", userar.length);
			model.addAttribute("str",userar);
			model.addAttribute("list", list);
			model.addAttribute("movie_num", movieRoomNum);
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
	

	
	@RequestMapping(value="ticket", method=RequestMethod.POST)
	public String ticket(Integer movie_num, HttpSession session){
		CustomerDTO customerDTO = (CustomerDTO)session.getAttribute("member");
		String id = customerDTO.getId();
		int check = 0;
		String [] ticket = customerDTO.getTicket().split("/");
		
		String str = "";
		for(int i=0;i<ticket.length;i++){
			if(ticket[i].equals(String.valueOf(movie_num))){
				customerDTO.setPlayView(customerDTO.getPlayView()+"/"+ticket[i]);
				check=1;
			}else{
				if(str.equals("")){
					str="0";
				}else{
					str = str+"/"+ticket[i];
				}
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
		System.out.println("playviw");
		CustomerDTO customerDTO = (CustomerDTO)session.getAttribute("member");
		String id = customerDTO.getId();
		System.out.println(id);
		System.out.println("movie_num : "+movie_num);
		int check = 0;
		String [] playview = customerDTO.getPlayView().split("/");
		System.out.println("playview length : "+playview.length);
		System.out.println("0 : "+playview[0]);
		System.out.println("1 : "+playview[1]);
		String str = "";
		System.out.println("length : "+playview.length);
		for(int i=0;i<playview.length;i++){
			System.out.println("for");
			System.out.println("for 안에 ticket:"+playview[i]);
			System.out.println("for 안에 movie_num:"+movie_num);
			if(playview[i].equals(String.valueOf(movie_num))){
				System.out.println("if");
				customerDTO.setReView(customerDTO.getReView()+"/"+playview[i]);
				check=1;
			}else{
				if(str.equals("")){
					str="0";
				}else{
					str = str+"/"+playview[i];
				}
			}
		}
		System.out.println("ticket : "+check);
		System.out.println("str : "+ str);
		if(check==1){
			customerDTO.setPlayView(str);
			System.out.println("ticket 끝 : "+customerDTO.getReView());
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
		roomDTO.setPlay_Time(play_Time);
		Long starttt = Long.parseLong(startTime);
		Long lastttt = Long.parseLong(lastTime);
		if(!startTime.substring(10, 14).equals("240000")){
			starttt = starttt+40000;
			lastttt = lastttt+40000;
		}else{
			starttt = starttt+860000;
			lastttt = lastttt+860000;
		}
		String startt = String.valueOf(starttt);
		String lasttt = String.valueOf(lastttt);
		roomDTO.setLastTime(lasttt);
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
