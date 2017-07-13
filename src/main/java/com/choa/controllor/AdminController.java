package com.choa.controllor;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.choa.admin.AdminServiceImpl;
import com.choa.member.MemberDTO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminServiceImpl adminService;

	//loginProccess
		@RequestMapping(value="member/adminLogin", method=RequestMethod.POST)
		public ModelAndView login(MemberDTO memberDTO,HttpSession session)throws Exception{
			memberDTO = adminService.login(memberDTO);
			String message = "Fail";
			if(memberDTO != null){
				session.setAttribute("member",memberDTO);
				message = "success";
			}
			String path="../";
			ModelAndView mv = new ModelAndView();
			mv.addObject("path", path);
			mv.addObject("message", message);

			mv.setViewName("commons/result");

			return mv;
		}
	
	
}