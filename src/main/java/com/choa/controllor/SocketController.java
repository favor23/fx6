package com.choa.controllor;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.choa.chat.EchoHandler;
import com.choa.customer.CustomerDTO;
import com.choa.member.MemberDTO;

@Controller
@RequestMapping(value="/chatting/**")
public class SocketController {
	
	@Inject
	private EchoHandler echoHandler;
	
	@RequestMapping("chat1")
	public String viewChattingPage(HttpServletRequest request){
		echoHandler.setRoom_num("1");
		return "/chatting/chat";
	}
	
	@RequestMapping("chat2")
	public String viewChattingPage2(HttpServletRequest request,String room_num,String ticket){
		CustomerDTO cdto=(CustomerDTO)request.getSession().getAttribute("member");
		MemberDTO dto=(MemberDTO)request.getSession().getAttribute("member");
		echoHandler.setId(dto.getId());
		echoHandler.setRoom_num("2");
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
		echoHandler.setId(dto.getId());	
		echoHandler.setRoom_num(room_num);
		if(cdto.getTicket().equals(ticket)){
		return "/chatting/chat";
		}
		else{
			return "예매페이지ㄱㄱ";
		}
	}
	@RequestMapping("chat4")
	public String viewChattingPage4(HttpServletRequest request){		
		echoHandler.setRoom_num("4");
		return "/chatting/chat";
	}
	@RequestMapping("chat5")
	public String viewChattingPage5(HttpServletRequest request){		
		echoHandler.setRoom_num("5");
		return "/chatting/chat";
	}
	
	@RequestMapping("chatTest")
	public void viewChattingPage1(){
	}
	
	@RequestMapping("paint")
	public void viewPaintingPage(){
	}
}
