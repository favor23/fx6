package com.choa.controllor;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.choa.customer.CustomerDTO;
import com.choa.customer.CustomerServiceImpl;
import com.choa.member.MemberDTO;

@Controller
//@RequestMapping(value="/member/**")
public class MemberController {

	@Autowired
	private CustomerServiceImpl customerService;

	@RequestMapping(value="member/list")
	public String test1()throws Exception{
		return "/member/list";
	}
	
	
	
	//join!Form
	@RequestMapping(value="member/join")
	public String join()throws Exception{
		return "/member/joinForm";
	}

	//login!Form
	@RequestMapping(value="member/login")
	public String login()throws Exception{
		return "/member/login";
	}

	@RequestMapping(value="member/logOut")
	public String memberLogOut(HttpSession session){
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value="member/myPage")
	public String myPage()throws Exception{
		return "/member/myPage";
	}
	
	@RequestMapping(value="member/memberUpdate")
	public String memberUpdate()throws Exception{
		return "/member/memberUpdate";
	}
	
	@RequestMapping(value="member/myMovie")
	public String myMovie()throws Exception{
		return "member/myMovie";
	}
	

	//joinProccess
	@RequestMapping(value="member/customerJoin", method=RequestMethod.POST)
	public String join(CustomerDTO customerDTO)throws Exception{
		customerService.join(customerDTO);
		return "redirect:/";
	}
	
	@RequestMapping(value="member/customerUpdate",method=RequestMethod.POST)
	public String update(CustomerDTO customerDTO,HttpSession session)throws Exception{
		customerService.update(customerDTO);
		session.setAttribute("member",customerDTO);
		return "redirect:/";
	}
	

	//loginProccess
	@RequestMapping(value="member/customerLogin", method=RequestMethod.POST)
	public ModelAndView login(MemberDTO memberDTO,HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		memberDTO = customerService.login(memberDTO);
		String message = "일치하는 아이디와 패스워드가 없습니다.";
		String path="member/login";//로그인 실패시 경로.
		if(memberDTO != null){
			session.setAttribute("member",memberDTO);
			message = "success";
			path="../";
			mv.setViewName("commons/result");
			mv.addObject("path", path);
		}else {
			mv.setViewName(path);			
		}
		mv.addObject("message", message);


		return mv;
	}
	
	@RequestMapping(value="member/delete",method=RequestMethod.POST)
	public ModelAndView delete(MemberDTO memberDTO,HttpSession session)throws Exception{
		int result = customerService.delete(memberDTO);
		if(result>0){
			session.invalidate();
		}
			ModelAndView mv = new ModelAndView();
			mv.setViewName("commons/thanks");

		return mv;
		
	}
	




}
