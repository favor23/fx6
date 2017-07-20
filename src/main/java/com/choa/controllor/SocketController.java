package com.choa.controllor;

import java.lang.reflect.Parameter;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	@Inject
	private RoomUserService roomUserService;	
	private int aaa=0;
	
	
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
			System.out.println("사람아디 : "+str[j]);
		}
		System.out.println("ck : "+ck);
		
		if(ck==0){
			System.out.println(rDto.getUser_array());
			roomUserService.update(rDto);
		}		
		
		list = roomUserService.selectList();
		str = list.get(Integer.parseInt(customerDTO.getPlayView())-1).getUser_array().split("/");
		model.addAttribute("count", str.length);
		model.addAttribute("str",str);
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value="aaa1")
	public String aaa1(){
		return "/paySystem/aaa";		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("chat1")
	public String viewChattingPage(HttpServletRequest request,HttpServletResponse response) throws Exception{
		int ck=0;
		CustomerDTO customerDTO=(CustomerDTO)request.getSession().getAttribute("member");
		System.out.println(customerDTO.getId());
		RoomUserDTO rDto=new RoomUserDTO();
		/*rDto.setNum(Integer.parseInt(customerDTO.getPlayView()));*/
		/*rDto=roomUserService.selectone(1);
		System.out.println(rDto.getUser_array());*/
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
	}
	
	@RequestMapping("chat2")
	public String viewChattingPage2(HttpServletRequest request,HttpServletResponse response) throws Exception{
		int ck=0;
		CustomerDTO customerDTO=(CustomerDTO)request.getSession().getAttribute("member");
		System.out.println(customerDTO.getId());
		RoomUserDTO rDto=new RoomUserDTO();
		/*rDto.setNum(Integer.parseInt(customerDTO.getPlayView()));*/
		/*rDto=roomUserService.selectone(1);
		System.out.println(rDto.getUser_array());*/
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
	}
}
