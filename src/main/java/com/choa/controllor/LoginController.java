package com.choa.controllor;

import java.io.IOException;

import javax.servlet.http.HttpSession;
import javax.swing.JPanel;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.choa.customer.CustomerDTO;
import com.choa.oauth.NaverLoginBO;
import com.choa.oauth.NaverService;
import com.github.scribejava.core.model.OAuth2AccessToken;

import oracle.net.aso.n;

@Controller
public class LoginController {
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private NaverService naverService;


	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	//로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {

		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);

		//네이버 
		model.addAttribute("url", naverAuthUrl);

		/* 생성한 인증 URL을 View로 전달 */
		return "/email/naverlogin";
	}

	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws Exception {
		System.out.println("여기는 callback");
		String path = "/email/naverSuccess";
		try{
			OAuth2AccessToken oauthToken;
			oauthToken = naverLoginBO.getAccessToken(session, code, state);
			//로그인 사용자 정보를 읽어온다.
			apiResult = naverLoginBO.getUserProfile(oauthToken);
			model.addAttribute("result", apiResult);
			JSONParser jp = new JSONParser();
			JSONObject jo = new JSONObject();
			jo=(JSONObject)jp.parse(apiResult);
			jo=(JSONObject)jo.get("response"); 
			String id=(String)jo.get("id");
			String name=(String)jo.get("name");
			String sung=(String)jo.get("gender");
			System.out.println(sung);
			if(sung.equals('M')){
				sung="m";
			}else if(sung.equals('F')){
				sung="f";
			}else {
				sung="u";
			}
			String email=(String)jo.get("email");
			CustomerDTO customerDTO = new CustomerDTO();
			customerDTO.setId(id);
			customerDTO.setName(name);
			customerDTO.setSung(sung);
			customerDTO.setEmail(email);
			path = "/email/naverSuccess";
			int result = naverService.check(id);
			if(result>0){
				customerDTO = naverService.login(id);
				session.setAttribute("member", customerDTO);
				path = "/index";
			}else {
				model.addAttribute("dto", customerDTO);
			}
		}catch(Exception e){
			e.printStackTrace();
		}

		/* 네이버 로그인 성공 페이지 View 호출 */
		return path;
	}

}
