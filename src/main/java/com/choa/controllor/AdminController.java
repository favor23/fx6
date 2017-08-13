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
import com.choa.util.ListInfo;
import com.choa.util.MakePage;
import com.choa.util.PageMaker;

@Controller
public class AdminController {

	@Autowired
	private AdminServiceImpl adminService;
	@Autowired
	private WorkController workController;
	@Autowired
	private Hash hash;
	@Autowired
	private Order_rentController order_rentController; 

	@RequestMapping(value="admin/banProccessList")
	public void bpl()throws Exception{}
	
	
	
	@RequestMapping(value="admin/banProccessListAll")
	public String banProccessListAll(int curPage,String id,Model model)throws Exception{
		int totalCount = adminService.totalCount(id);
		ListInfo lf = new ListInfo();
		lf.setCurPage(curPage);
		lf.makePage(totalCount);
		lf.setRow();
		List<BanlistDTO> list = adminService.banProccessListAll(lf);
		model.addAttribute("banList", list);
		model.addAttribute("listInfo", lf);
		model.addAttribute("verf", "all");
		return "/admin/bplAjax";
	}
	
	@RequestMapping(value="admin/banProccessListSearch")
	public String banProccessListSearch(int curPage,String id,Model model)throws Exception{
		int totalCount = adminService.totalCount(id);
		ListInfo lf = new ListInfo();
		lf.setCurPage(curPage);
		lf.makePage(totalCount);
		lf.setRow();
		List<BanlistDTO> list = adminService.banProccessListSearch(lf,id);
		model.addAttribute("banList", list);
		model.addAttribute("listInfo", lf);
		model.addAttribute("verf", id);
		return "/admin/bplAjax";
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
	public void adminRequest(Model model,ListInfo listInfo) {
		order_rentController.orderList(model, listInfo);
	}
	
	@RequestMapping(value = "admin/adminRequest_hi", method = RequestMethod.GET)
	public void adminRequest_hi(Model model,ListInfo listInfo) {
		order_rentController.orderList(model, listInfo);
	}
	//펀딩목록
	@RequestMapping(value = "admin/admin_hi/admin_Request_hi_1", method = RequestMethod.GET)
	public void adminRequest_hi_1(Model model,ListInfo listInfo) {
		order_rentController.orderList(model, listInfo);
		
	}
	//대여목록
	@RequestMapping(value = "admin/admin_hi/admin_Request_hi_2", method = RequestMethod.GET)
	public void adminRequest_hi_2(Model model,ListInfo listInfo) {
		order_rentController.orderList(model, listInfo);
		
	}
	
	//티켓구매목록
	@RequestMapping(value = "admin/admin_hi/admin_Request_hi_3", method = RequestMethod.GET)
	public void adminRequest_hi_3(Model model,ListInfo listInfo) {
		order_rentController.orderList(model, listInfo);
		
	}
	
	//상영방목록
	@RequestMapping(value = "admin/admin_hi/admin_Request_hi_4", method = RequestMethod.GET)
	public void adminRequest_hi_4(Model model,ListInfo listInfo) {
		order_rentController.orderList(model, listInfo);		
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
	public void adminManager(Model model) {
		List<AdminDTO> list2=new ArrayList<AdminDTO>();
		list2=adminService.selectlist();
		model.addAttribute("admin_list", list2);
	}
	
	@RequestMapping(value = "admin/admin_modal3", method = RequestMethod.GET)
	public void admin_modal3(String[] jbAry,String[] delAry,Model model) {
		List<AdminDTO> list2=new ArrayList<AdminDTO>();
		list2=adminService.selectlist();
		String str_plus="";
		
		for(int x=0;x<jbAry.length;x++){
			for(int y=0;y<jbAry.length;y++){
				if(x!=y){
					if(jbAry[x].equals(jbAry[y])){
						jbAry[x]="del";	
						jbAry[y]="del";	
						break;
					}
				}
			}
		}
		
		for(int i=0;i<jbAry.length;i++){
			for(int j=0;j<delAry.length;j++){
				if(jbAry[i].equals(delAry[j])){
					jbAry[i]="del";	
					delAry[j]="del_s";
				}
				System.out.println(delAry[j]);
			}
			if(!jbAry.equals(null)&&!jbAry[i].equals("del")){
				str_plus+=jbAry[i]+"/";
			}
		}
		
		
		model.addAttribute("admin_list", list2);
		model.addAttribute("jbAry",jbAry);
		model.addAttribute("jbAry_count",jbAry.length);
		model.addAttribute("str_plus",str_plus);
	}
	
	
	
	@RequestMapping(value = "admin/admin_modal", method = RequestMethod.GET)
	public void admin_modal(AdminDTO adminDTO,Model model) {
		adminDTO=adminService.selectOne(adminDTO);
		model.addAttribute("s_dto", adminDTO );		
	}
	@RequestMapping(value="admin/admin_modal2")
	public void admin_modal2(Model model)
	{
		List<AdminDTO> list2=new ArrayList<AdminDTO>();
		list2=adminService.selectlist();
		model.addAttribute("admin_list", list2);		
	}
	
	@RequestMapping(value="admin/admin_modal4")
	public void admin_modal4(String[] jbAry,String[] delAry,Model model) {
		List<AdminDTO> list2=new ArrayList<AdminDTO>();
		list2=adminService.selectlist();
		String str_plus="";
		
		for(int x=0;x<jbAry.length;x++){
			for(int y=0;y<jbAry.length;y++){
				if(x!=y){
					if(jbAry[x].equals(jbAry[y])){
						jbAry[x]="del";	
						jbAry[y]="del";	
						break;
					}
				}
			}
		}
		
		for(int i=0;i<jbAry.length;i++){
			for(int j=0;j<delAry.length;j++){
				if(jbAry[i].equals(delAry[j])){
					jbAry[i]="del";	
					delAry[j]="del_s";
				}
				System.out.println(delAry[j]);
			}
			if(!jbAry.equals(null)&&!jbAry[i].equals("del")){
				str_plus+=jbAry[i]+"/";
			}
		}
		
		
		model.addAttribute("admin_list", list2);
		model.addAttribute("jbAry",jbAry);
		model.addAttribute("str_plus",str_plus);
	}
	/*public void admin_modal4(String persons,String nopersons, Model model)
	{
		String[] str=persons.split("/");
		persons="";
		for(int i=0;i<str.length;i++){
			if(str[i].equals(nopersons)){
				str[i]="del";
			}else{
				persons+=str[i]+"/";
			}
		}
		List<AdminDTO> list2=new ArrayList<AdminDTO>();
		list2=adminService.selectlist();
		model.addAttribute("admin_list", list2);
		model.addAttribute("str", str);
		model.addAttribute("str_plus", persons);
	}*/
	/*@RequestMapping(value = "admin/admin_workinsert_cr_modal", method = RequestMethod.GET)
	public void admin_modal_list(Model model) {
		List<AdminDTO> list=new ArrayList<AdminDTO>();
		list=adminService.selectlist();
		model.addAttribute("admin_list", list);
	}*/
	@RequestMapping(value = "admin/admin_modal5", method = RequestMethod.GET)
	public void admin_modal5(String[] jbAry,String[] delAry,Model model) {
		List<AdminDTO> list2=new ArrayList<AdminDTO>();
		list2=adminService.selectlist();
		String str_plus="";
		
		for(int x=0;x<jbAry.length;x++){
			for(int y=0;y<jbAry.length;y++){
				if(x!=y){
					if(jbAry[x].equals(jbAry[y])){
						jbAry[x]="del";	
						jbAry[y]="del";	
						break;
					}
				}
			}
		}
		
		for(int i=0;i<jbAry.length;i++){
			for(int j=0;j<delAry.length;j++){
				if(jbAry[i].equals(delAry[j])){
					jbAry[i]="del";	
					delAry[j]="del_s";
				}
				System.out.println(delAry[j]);
			}
			if(!jbAry.equals(null)&&!jbAry[i].equals("del")){
				str_plus+=jbAry[i]+"/";
			}
		}
		
		
		model.addAttribute("admin_list", list2);
		model.addAttribute("jbAry",jbAry);
		model.addAttribute("jbAry_count",jbAry.length);
		model.addAttribute("str_plus",str_plus);
	}
}
