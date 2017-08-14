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

import com.choa.admin.AdminDAOImpl;
import com.choa.admin.AdminDTO;
import com.choa.admin.AdminServiceImpl;
import com.choa.banList.BanlistDTO;
import com.choa.customer.CustomerDAO;
import com.choa.customer.CustomerDTO;
import com.choa.customer.CustomerServiceImpl;
import com.choa.dropuser.DropUserDTO;
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
import com.choa.required.RequiredDTO;
import com.choa.required.RequiredService;
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

	@Autowired
	private RequiredController requiredController;

	@Autowired
	private RequiredService requiredService;
	
	@Autowired
	private CinemaController cinemaController;

	@Autowired
	private AdminController adminController;

	@RequestMapping(value="/member/movie_req")
	public String movie_req(String id,Model model)throws Exception{
		List<RequiredDTO> list = new ArrayList<RequiredDTO>();
		list = customerService.movie_req(id);
		model.addAttribute("list", list);	
		return "/member/myMovieReq";
	}
	
	
	@RequestMapping(value="/member/myMovieList")
	public String myMovieList(int curPage,Model model, HttpSession session, ListInfo listInfo)throws Exception{
		cinemaController.cinema_my(curPage, model, session, listInfo);
		return "/member/myMovie";
	}
	
	
	@RequestMapping(value="/member/myMovieReq")
	public void myMovieReq(Model model)throws Exception{
		List<RequiredDTO> list = requiredService.requiredListAll();
		model.addAttribute("list",list);

	}

	@RequestMapping(value="/member/dropUserForm",method=RequestMethod.POST)
	public void dropUserForm()throws Exception{
	}
	
	@RequestMapping(value="/member/dropUser",method=RequestMethod.POST)
	public String dropUser(DropUserDTO dropUserDTO)throws Exception{
		int num = customerService.dropUser(dropUserDTO);
		return "/commons/thanks";
	}

	@RequestMapping(value="/member/memberUpdate",method=RequestMethod.POST)
	public void memberUpdate()throws Exception{
	}
	
	@RequestMapping(value="/member/findPw",method=RequestMethod.GET)
	public void findPwForm(int val,Model model)throws Exception{
		model.addAttribute("val", val);//0이면 수정, 1이면 탈퇴
	}
	
	@RequestMapping(value="/member/findPw2",method=RequestMethod.POST)
	public String findPw(MemberDTO memberDTO,Model model)throws Exception{
		memberDTO.setPw(hash.hashtest(memberDTO));
		int num=customerService.dropUserCheck(memberDTO);
		model.addAttribute("message", num);
		return "/commons/ajaxResult";
	}
	
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
	public String graph1(int num,Model model)throws Exception{
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
		
		return "/member/myGenreView";
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
	public String pr2(PrDTO prDTO,Model model)throws Exception{
		int result = customerService.write_pr(prDTO);
		String message="작성 실패";
		if(result>0){
			message="작성 완료";
		}
		model.addAttribute("message", message);
		model.addAttribute("path","/member/memberInfo");
		return "/commons/result";
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
		System.out.println("로그인");
		memberDTO.setPw(hash.hashtest(memberDTO));
		String grade = customerService.gradeChecker(memberDTO.getId());
		int message = 0; //로그인에 실패했을 경우. 아이디가 있는데 비밀번호가 틀렸음.
			if(grade.equals("admin")){
				memberDTO = adminService.login(memberDTO);
				if (memberDTO != null) {
					session.setAttribute("member", memberDTO);
					message=1; // 로그인에 성공했을 경우.
				}
			}else if(grade.equals("null")){
				message=2;	//아이디가 없을 경우.
			}else {
				memberDTO = customerService.login(memberDTO);
				if(memberDTO != null){
					session.setAttribute("member",memberDTO);
					message =1;
				}
			}
		
		model.addAttribute("message", message);
		return "/commons/ajaxResult";
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
