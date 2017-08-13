package com.choa.controllor;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choa.certification.MailService;
import com.choa.certification.MailServiceImpl;
import com.choa.supporter.SupporterDTO;
import com.choa.supporter.SupporterService;

@Controller
public class MailController { 
	//private UserService userService;
	@Autowired
    private MailServiceImpl mailService;
	@Autowired
	private SupporterService supporterService;
 /*
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
 */
    public void setMailService(MailServiceImpl mailService) {
        this.mailService = mailService;
    }
    
    
    @RequestMapping(value="/email/mailcert")
    public void mailcert()throws Exception{}
 
    // 회원가입 이메일 인증 @ResponseBody
    @RequestMapping(value = "/sendMail/auth", method = RequestMethod.POST, produces = "application/json")
    public String sendMailAuth(HttpSession session, @RequestParam String email,Model model) {
        int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
        String joinCode = String.valueOf(ran);
        session.setAttribute("joinCode", joinCode);
 
        String subject = "회원가입 인증 코드 발급 안내 입니다.";
        StringBuilder sb = new StringBuilder();
        sb.append("귀하의 인증 코드는 " + joinCode + " 입니다.");
        boolean chk=mailService.send(subject, sb.toString(), "no-reply@gmail.com", email, null);
        String message="";
        if(chk){
        	message=joinCode;
        }else {
        	message="인증번호 발급에 실패했습니다.";
        }
        model.addAttribute("message", message);
        return "commons/ajaxResult";
    }
    
    @RequestMapping(value = "/sendMail/campaign", method = RequestMethod.POST, produces = "application/json")
    public String sendMailCampaign(HttpSession session, Integer campaign_num, Model model) {
        String subject = "[영화를 찍으시조]후원 캠페인 종료에 따른 안내 메일입니다.";
        StringBuilder sb = new StringBuilder();
        List<SupporterDTO> list = null;
        
        String message="";
        boolean chk = false;
        
		try {
			list = supporterService.supporterList(campaign_num);
			
			for(SupporterDTO dto: list) {
				sb.delete(0, sb.length());
		        sb.append(dto.getName() + " 귀하께서 후원해주신 캠페인 종료에 따라<br><br>");
		        sb.append("다음과 같은 혜택이 제공될 예정입니다.<br><br>");
		        sb.append("**" + dto.getBenefit_title() + "<br><br>");
		        sb.append("저희에 대한 무한한 관심에 감사드리며 앞으로도 최선을 다하겠습니다.");
		        
		        chk=mailService.send(subject, sb.toString(), "lu.nyang4505@gmail.com", dto.getEmail(), null);    
	        }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        if(chk){
        	message="메일 전송 성공!";
        }else {
        	message="메일 전송 실패!";
        }
        
        model.addAttribute("message", message);
        
        return "commons/ajaxResult";
    }
    /*
    // 아이디 찾기
    @RequestMapping(value = "/sendMail/id", method = RequestMethod.POST)
    public String sendMailId(HttpSession session, @RequestParam String email, @RequestParam String captcha, RedirectAttributes ra) {
        String captchaValue = (String) session.getAttribute("captcha");
        if (captchaValue == null || !captchaValue.equals(captcha)) {
            ra.addFlashAttribute("resultMsg", "자동 방지 코드가 일치하지 않습니다.");
            return "redirect:/find/id";
        }
 
        User user = userService.findAccount(email);
        if (user != null) {
            String subject = "아이디 찾기 안내 입니다.";
            StringBuilder sb = new StringBuilder();
            sb.append("귀하의 아이디는 " + user.getId() + " 입니다.");
            mailService.send(subject, sb.toString(), "아이디@gmail.com", email, null);
            ra.addFlashAttribute("resultMsg", "귀하의 이메일 주소로 해당 이메일로 가입된 아이디를 발송 하였습니다.");
        } else {
            ra.addFlashAttribute("resultMsg", "귀하의 이메일로 가입된 아이디가 존재하지 않습니다.");
        }
        return "redirect:/find/id";
    }
 
    // 비밀번호 찾기
    @RequestMapping(value = "/sendMail/password", method = RequestMethod.POST)
    public String sendMailPassword(HttpSession session, @RequestParam String id, @RequestParam String email, @RequestParam String captcha, RedirectAttributes ra) {
        String captchaValue = (String) session.getAttribute("captcha");
        if (captchaValue == null || !captchaValue.equals(captcha)) {
            ra.addFlashAttribute("resultMsg", "자동 방지 코드가 일치하지 않습니다.");
            return "redirect:/find/password";
        }
 
        User user = userService.findAccount(email);
        if (user != null) {
            if (!user.getId().equals(id)) {
                ra.addFlashAttribute("resultMsg", "입력하신 이메일의 회원정보와 가입된 아이디가 일치하지 않습니다.");
                return "redirect:/find/password";
            }
            int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
            String password = String.valueOf(ran);
            userService.updateInfo(user.getNo(), "password", password); // 해당 유저의 DB정보 변경
 
            String subject = "임시 비밀번호 발급 안내 입니다.";
            StringBuilder sb = new StringBuilder();
            sb.append("귀하의 임시 비밀번호는 " + password + " 입니다.");
            mailService.send(subject, sb.toString(), "아이디@gmail.com", email, null);
            ra.addFlashAttribute("resultMsg", "귀하의 이메일 주소로 새로운 임시 비밀번호를 발송 하였습니다.");
        } else {
            ra.addFlashAttribute("resultMsg", "귀하의 이메일로 가입된 아이디가 존재하지 않습니다.");
        }
        return "redirect:/find/password";
    }
    */
}
