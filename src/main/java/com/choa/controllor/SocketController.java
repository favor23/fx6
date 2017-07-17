package com.choa.controllor;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.choa.chat.EchoHandler;
import com.choa.customer.CustomerDTO;
import com.choa.member.MemberDTO;
import com.choa.room.roomuser.RoomUserDTO;
import com.choa.room.roomuser.RoomUserService;

@Controller
@RequestMapping(value="/chatting/**")
public class SocketController {
	
	@Inject
	private EchoHandler echoHandler;
	private RoomUserService roomUserService;	
	
	@RequestMapping("chat1")
	public String viewChattingPage(HttpServletRequest request) throws Exception{
		CustomerDTO customerDTO=(CustomerDTO)request.getSession().getAttribute("member");
		roomUserService.update(customerDTO);
		echoHandler.setRoomCount(roomUserService.count());
		List<RoomUserDTO> list=roomUserService.selectList();
		echoHandler.setRoomUserDTO(list);
		return "/chatting/chat";
	}
	
	@RequestMapping("chat2")
	public String viewChattingPage2(HttpServletRequest request,String room_num,String ticket){
		CustomerDTO cdto=(CustomerDTO)request.getSession().getAttribute("member");
		MemberDTO dto=(MemberDTO)request.getSession().getAttribute("member");		
		if(cdto.getTicket().equals("152")){
			return "/chatting/chat";
		}
		else{
			return "예매페이지ㄱㄱ";
		}
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
	}
}
