package com.choa.controllor;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.choa.admin.AdminServiceImpl;
import com.choa.member.MemberDTO;

@Controller
public class AdminController {

	@Autowired
	private AdminServiceImpl adminService;
	@Autowired
	private WorkController workController;

	// loginProccess
	@RequestMapping(value = "member/adminLogin", method = RequestMethod.POST)
	public String login(MemberDTO memberDTO, HttpSession session) throws Exception {
		memberDTO = adminService.login(memberDTO);
		if (memberDTO != null) {
			session.setAttribute("member", memberDTO);
		}
		return "/index";
	}

	@RequestMapping(value = "admin/adminPage", method = RequestMethod.GET)
	public void adminPage() {

	}

	@RequestMapping(value = "admin/adminBusiness", method = RequestMethod.GET)
	public void adminBusiness() {

	}

	@RequestMapping(value = "admin/adminSchedule", method = RequestMethod.GET)
	public void adminSchedule() {

	}

	@RequestMapping(value = "admin/adminRequest", method = RequestMethod.GET)
	public void adminRequest() {

	}
	/*@ResponseBody
	@RequestMapping(value = "admin/adminManager", method = RequestMethod.GET)
	public Map<String, Object> adminManager() {
		System.out.println("aaa : "+workController.list().get("worklist"));
		return workController.list();
	}*/

	
	@RequestMapping(value = "admin/adminManager", method = RequestMethod.GET)
	public void adminManager() {
		
	}

}
