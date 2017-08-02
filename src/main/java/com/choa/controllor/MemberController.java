package com.choa.controllor;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.choa.admin.AdminDTO;
import com.choa.admin.AdminServiceImpl;
import com.choa.customer.CustomerDTO;
import com.choa.customer.CustomerServiceImpl;
import com.choa.member.MemberDTO;

@Controller
//@RequestMapping(value="/member/**")
public class MemberController {

	@Autowired
	private CustomerServiceImpl customerService;

	@Autowired
	private AdminServiceImpl adminService;
	
	@RequestMapping(value="member/idCheck")
	public ModelAndView idCheck(CustomerDTO customerDTO)throws Exception{
		customerDTO = customerService.idCheck(customerDTO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("customerDTO", customerDTO);
		mv.setViewName("commons/idCheckResult");
		return mv;
	}
	
	
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
	
	//마이페이지 나누기 변경
	@RequestMapping(value="member/myPage")
	public String myPage(HttpServletRequest request, Model model)throws Exception{
		MemberDTO memberDTO=(MemberDTO)request.getSession().getAttribute("member");
		System.out.println(memberDTO.getGrade());
		if(memberDTO.getGrade().equals("admin")){
			List<AdminDTO> list=new ArrayList<AdminDTO>();
			list=adminService.selectlist();
			model.addAttribute("list", list);
			return "/admin/adminPage";
		}
		else{
		return "/member/myPage";
		}
	}
	
	@RequestMapping(value="member/memberUpdate")
	public String memberUpdate()throws Exception{
		return "/member/memberUpdate";
	}
	
	@RequestMapping(value="member/myMovie")
	public String myMovie()throws Exception{
		return "member/myMovie";
	}
	
	@RequestMapping(value="member/memberInfo")
	public String memberInfo()throws Exception{
		return "member/memberInfo";
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
	public String login(MemberDTO memberDTO,HttpSession session,Model model)throws Exception{	
		System.out.println("pw : "+memberDTO.getPw());
		memberDTO = customerService.login(memberDTO);
		String message = "일치하는 아이디와 패스워드가 없습니다.";
		String path="member/login";//로그인 실패시 경로.
		if(memberDTO != null){
			session.setAttribute("member",memberDTO);
			message = "success";
			path="/index";
		}
		model.addAttribute("message", message);
		

		return path;
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
