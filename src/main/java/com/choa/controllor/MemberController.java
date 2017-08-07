package com.choa.controllor;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

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
import com.choa.customer.CustomerDTO;
import com.choa.customer.CustomerServiceImpl;
import com.choa.file.FileDTO;
import com.choa.file.FileService;
import com.choa.member.Hash;
import com.choa.member.MemberDTO;
import com.choa.movie.MovieDTO;
import com.choa.movie.MovieRcdDTO;
import com.choa.movie.MovieService;
import com.choa.oauth.NaverService;
import com.choa.pr.PrDTO;
import com.choa.prfile.PrFileDTO;
import com.choa.prfile.PrFileService;
import com.choa.taste.TasteDTO;
import com.choa.util.ListInfo;

@Controller
//@RequestMapping(value="/member/**")
public class MemberController {

	@Autowired
	private CustomerServiceImpl customerService;
	
	@Autowired
	private MovieService movieService;
	
	@Autowired
	private NaverService naverService;
	
	@Autowired
	private AdminServiceImpl adminService;
	
	@Autowired
	private PrFileService fileService;
	
	@Autowired
	private Hash hash;
	
	@RequestMapping(value="/naverJoin")
	public String imTester(CustomerDTO customerDTO)throws Exception{
		naverService.join(customerDTO);
		return "/commons/thanksToJoin";
	}
	
	@RequestMapping(value="/loginForm")
	public String loginForm()throws Exception{
		return "/member/login";
	}
	
	@RequestMapping(value="member/joinForm",method=RequestMethod.POST)
	public void readThis(String agree,Model model)throws Exception{
		if(agree.equals("ok")){
			model.addAttribute("check", true);
		}else {
			model.addAttribute("check",false);
		}
	}
	
	@RequestMapping(value="/member/myGenre",method=RequestMethod.GET)
	public void callGraphPage(String id,Model model)throws Exception{
		
	}
	
	@RequestMapping(value="/member/myGenre",method=RequestMethod.POST)
	public void graph1(int num,Model model)throws Exception{
		MovieDTO movieDTO = null;
		
		try {
			movieDTO = movieService.movieView(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("dto", movieDTO);
		MovieRcdDTO movieRcdDTO = new MovieRcdDTO();
		movieRcdDTO = movieService.rcd(num);
		model.addAttribute("rcd", movieRcdDTO);
	}
	
	
	@RequestMapping(value="/member/reportUser",method=RequestMethod.GET)
	public void reportPage(BanlistDTO banlistDTO,Model model)throws Exception{
		model.addAttribute("blist", banlistDTO);
	}
	@RequestMapping(value="/member/reportUser",method=RequestMethod.POST)
	public String reportPage2(BanlistDTO banlistDTO,Model model)throws Exception{
		int result = customerService.intoBan(banlistDTO);
		String message = "error";
		if(result>0){
			message="done";
			model.addAttribute("message", message);
		}
			return "/commons/ajaxResult";
	}
	
	
	
	@RequestMapping(value="member/idCheck")
	public ModelAndView idCheck(String id)throws Exception{
		CustomerDTO customerDTO = new CustomerDTO();
		customerDTO.setId(id);
		customerDTO = customerService.idCheck(customerDTO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("customerDTO", customerDTO);
		mv.setViewName("commons/idCheckResult");
		return mv;
	}

	@RequestMapping(value="member/myPr",method=RequestMethod.POST)
	public ModelAndView pr2(PrDTO prDTO)throws Exception{
		ModelAndView mv = null;
		int result = customerService.write_pr(prDTO);
		mv = new ModelAndView();
		if(result>0){
			mv.addObject("message", "작성 완료");
		}else {
			mv.addObject("message", "작성 실패");
		}
		
		mv.addObject("path", "../member/myPage");
		mv.setViewName("commons/result");
		return mv;
	}
	
	@RequestMapping(value="member/myPr",method=RequestMethod.GET)
	public void pr1(CustomerDTO customerDTO,Model model)throws Exception{
		PrFileDTO fileDTO = new PrFileDTO();
		fileDTO=fileView(customerDTO.getId());
		PrDTO prDTO = new PrDTO();
		prDTO = customerService.view_pr(customerDTO);
		if(prDTO!=null){
			model.addAttribute("prDTO", prDTO);
			model.addAttribute("file", fileDTO);
		}else {
			model.addAttribute("prDTO", null);
		}		
	}
	
	
	public PrFileDTO fileView(String id)throws Exception{		
		PrFileDTO fileDTO = fileService.view(id);
		return fileDTO;
	}
	
	
	@RequestMapping(value="member/list")
	public String test1()throws Exception{
		return "/member/list";
	}
	
	@RequestMapping(value = "member/myGenreList", method = RequestMethod.POST)
	public void movieList(Integer curPage,String[] ar,Model model) {
		List<MovieDTO> list = null;
		ListInfo listInfo = new ListInfo();
		listInfo.setCurPage(curPage);
		try {
			list = customerService.movieList(listInfo,ar);
			model.addAttribute("taste", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@RequestMapping(value = "member/myGenreList2", method = RequestMethod.POST)
	public String movieList(Integer curPage,String ar,Model model) {
		List<MovieDTO> list = null;
		ListInfo listInfo = new ListInfo();
		listInfo.setCurPage(curPage);
		try {
			list = customerService.movieList2(listInfo,ar);
			model.addAttribute("taste", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/member/myGenreList";
	}
	
	
	//join!Form
	@RequestMapping(value="member/join")
	public String join()throws Exception{
		return "/member/readThis";
	}


	@RequestMapping(value="member/logOut")
	public String memberLogOut(HttpSession session){
		session.invalidate();
		return "/index";
	}	
	
	@RequestMapping(value="member/memberUpdate")
	public void memberUpdate()throws Exception{
	}
	
	@RequestMapping(value="member/myMovie")
	public String myMovie()throws Exception{
		return "member/myMovie";
	}
	
	@RequestMapping(value="member/memberInfo")
	public String memberInfo()throws Exception{
		return "member/memberInfo";
	}
	
	@RequestMapping(value="commons/thanksToJoin")
	public void thanksToJoin()throws Exception{
	}
	
	//joinProccess
	@RequestMapping(value="/member/customerJoin", method=RequestMethod.POST)
	public String join(CustomerDTO customerDTO)throws Exception{
		customerDTO.setPw(hash.hashtest(customerDTO));
		
		customerService.join(customerDTO);
		return "commons/thanksToJoin";
	}
	
	@RequestMapping(value="member/customerUpdate",method=RequestMethod.POST)
	public String update(CustomerDTO customerDTO,HttpSession session)throws Exception{
		customerDTO.setPw(hash.hashtest(customerDTO));
		int num = customerService.update(customerDTO);
		if(num>0){
		customerDTO =(CustomerDTO)customerService.login(customerDTO);
			if(customerDTO!=null){
				session.setAttribute("member",customerDTO);
			}
		}			
		return "member/myPage";
	}
	

	//loginProccess
	@RequestMapping(value="member/customerLogin", method=RequestMethod.POST)
	public String login(MemberDTO memberDTO,HttpSession session,Model model)throws Exception{
		memberDTO.setPw(hash.hashtest(memberDTO));
		String grade = customerService.gradeChecker(memberDTO.getId());
		String message = "일치하는 아이디와 패스워드가 없습니다.";
		String path="member/login";//로그인 실패시 경로.
		if(grade.equals("admin")){
			memberDTO = adminService.login(memberDTO);
			if (memberDTO != null) {
				session.setAttribute("member", memberDTO);
				path="/index";
			}
		}else {
			memberDTO = customerService.login(memberDTO);
			if(memberDTO != null){
				session.setAttribute("member",memberDTO);
				message = "success";
				path="/index";
			}
			model.addAttribute("message", message);


		}
		return path;
	}

	@RequestMapping(value="member/delete",method=RequestMethod.POST)
	public String delete(MemberDTO memberDTO,HttpSession session,Model model)throws Exception{
		int result = customerService.delete(memberDTO);
		if(result>0){
			session.invalidate();
		}
			
		return "../commons/thanks";
		
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



}
