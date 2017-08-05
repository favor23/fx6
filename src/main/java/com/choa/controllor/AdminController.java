package com.choa.controllor;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.choa.admin.AdminDTO;
import com.choa.admin.AdminServiceImpl;
import com.choa.banList.BanlistDTO;
import com.choa.chatting.ChattingDTO;
import com.choa.customer.CustomerDTO;
import com.choa.member.Hash;
import com.choa.member.MemberDTO;

@Controller
public class AdminController {

	@Autowired
	private AdminServiceImpl adminService;
	@Autowired
	private WorkController workController;
	@Autowired
	private Hash hash;

	
	@RequestMapping(value="admin/banProccessList")
	public void banProccessList(Model model)throws Exception{
		List<BanlistDTO> list = adminService.banProccessList();
		model.addAttribute("banList", list);
	}
	
	@RequestMapping(value="member/log",method=RequestMethod.GET)
	public String chatLog(String id,Model model)throws Exception{
		List<ChattingDTO> list = new ArrayList<ChattingDTO>();
		list = adminService.chatLog(id);
		model.addAttribute("list", list);
		return "commons/chatLog";
	}

	
	@RequestMapping(value="chatting/reset")
	public String banReset(String id,Model model)throws Exception {
		int a =adminService.banReset(id);
		System.out.println("밴 초기화 완료 되었으면 1>>>"+a);
		model.addAttribute("message", a);
		return "/commons/ajaxResult";
	}
	
	@RequestMapping(value="chatting/chkBan")
	public String banChk(String id,Model model)throws Exception{
		int ban=0;
		CustomerDTO customerDTO = new CustomerDTO();
		customerDTO = adminService.chkBan(id);
		int result = customerDTO.getBan();
		if(result>0){
			ban=customerDTO.getBanLog();
		}else {
			ban=0;
		}
		model.addAttribute("message", ban);
		return "commons/ajaxResult";
		
	}
	
	@RequestMapping(value="chatting/proccess")
	public String proccess(int num,String id,Model model)throws Exception{
		System.out.println("무고때림");
		adminService.proccess(num,id,"0");
		model.addAttribute("message", "삭제 성공");
		return "/commons/ajaxResult";
	}
	
	@RequestMapping(value="chatting/addBan")
	public String banPlus(String num,String ban,String id,String tid,Model model)throws Exception{
		System.out.println("밴때림");
		adminService.banPlus(num,ban,id);
		int result =Integer.valueOf(num);
		adminService.proccess(result,tid,ban);
		model.addAttribute("message", "밴 추가 성공");
		return "/commons/ajaxResult";
	}
	
	@RequestMapping(value="/admin/list")
	public String callBanlist(Model model)throws Exception{
		List<BanlistDTO> list = adminService.callBanList();
		model.addAttribute("banList", list);
		return "/member/reportList";
	}
	
	//처리 안된 신고목록..의 갯수 가져오기
	@RequestMapping(value="/admin/getBanCount")
	public String banCount(Model model)throws Exception{
		int count = adminService.banCount();
		model.addAttribute("message", count);
		return "/commons/ajaxResult";
	}
	/*영화 종료시 밴 초기화 시켜주는거 필요함.
	 * 
	 * 
	 * 
	 * 
	 * 
	 * */

	// loginProccess
	@RequestMapping(value = "member/adminLogin", method = RequestMethod.POST)
	public String login(MemberDTO memberDTO, HttpSession session) throws Exception {
		memberDTO.setPw(hash.hashtest(memberDTO));
		memberDTO = adminService.login(memberDTO);
		if (memberDTO != null) {
			session.setAttribute("member", memberDTO);
		}
		return "/index";
	}

	@RequestMapping(value = "admin/adminPage", method = RequestMethod.GET)
	public void adminPage(HttpServletRequest request,Model model) {
		List<AdminDTO> list=new ArrayList<AdminDTO>();
		list=adminService.selectlist();
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value = "admin/admin_mod", method = RequestMethod.GET)
	public void admin_mod() {
		
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
	@RequestMapping(value = "admin/admin_list", method = RequestMethod.GET)
	public void admin_list(String department,Model model) {
		model.addAttribute("department", department);
		List<AdminDTO> list=new ArrayList<AdminDTO>();
		list=adminService.selectlist();
		model.addAttribute("list", list);
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
	
	@RequestMapping(value = "admin/admin_modal", method = RequestMethod.GET)
	public void admin_modal(AdminDTO adminDTO,Model model) {
		adminDTO=adminService.selectOne(adminDTO);
		model.addAttribute("s_dto", adminDTO );		
	}

}
