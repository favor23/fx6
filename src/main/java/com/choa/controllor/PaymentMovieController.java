package com.choa.controllor;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.choa.customer.CustomerDTO;
import com.choa.movie.MovieDTO;
import com.choa.paySystem.Bank;
import com.choa.payment.PaymentDTO;
import com.choa.payment.movie.PaymentMovieDTO;
import com.choa.payment.movie.PaymentMovieServiceImpl;

@Controller
public class PaymentMovieController {
	
	@Inject
	private PaymentMovieServiceImpl paymentMovieServiceImpl;
	@Inject
	private MovieController movieController;
	
	@RequestMapping(value="/paySystem/pay24", method=RequestMethod.POST)
	public void pay24(MovieDTO movieDTO, HttpSession session, Model model){//가격
		try {
			movieDTO=movieController.movieViewdto(movieDTO.getMovie_num(), model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<MovieDTO> list=new ArrayList<MovieDTO>();		
		list.add(movieDTO);
		int totalpay=0;
		for(int i=0;i<list.size();i++){
			totalpay+=list.get(i).getMovie_price();
		}
		session.setAttribute("list", list);
		session.setAttribute("totalpay",totalpay);
	}
	
	@RequestMapping(value="/paySystem/pay24")
	public void pay24(){			
	}
	
	@RequestMapping(value="/paySystem/movie_bank", method=RequestMethod.POST)
	public String bank(PaymentMovieDTO paymentMovieDTO,String cardNum1, String cardNum2, String cardNum3, String cardNum4, Model model, HttpServletRequest request) throws Exception{		
		 String str = cardNum1 + cardNum2 + cardNum3 + cardNum4;		
		 System.out.println(str);
		 
		 Bank bank_ck=new Bank();
		 String message=bank_ck.number_ck(str);
		 int result=0;
		 if(message.equals("올바른 카드번호")){
			 paymentMovieDTO.setCard_num(str);
			 System.out.println(paymentMovieDTO.getId());
			 System.out.println(paymentMovieDTO.getCard_num());
			 System.out.println(paymentMovieDTO.getMoney());
			 System.out.println(paymentMovieDTO.getMovie_num());
			 System.out.println(paymentMovieDTO.getType());
			result=paymentMovieServiceImpl.insert(paymentMovieDTO);
			if(result>0){
				message="결제성공";				
			}
			else{
				message="결제실패";
			}
		 }
		model.addAttribute("message", message);
		return "/paySystem/pay_result";		 
	}
	
	@RequestMapping(value="/paySystem/movie_bank_0", method=RequestMethod.POST)
	public String bank(PaymentDTO paymentDTO, Model model, HttpServletRequest request) throws Exception{		
		 CustomerDTO customerDTO=(CustomerDTO)request.getAttribute("member");
		 int result=0;
		 result=paymentMovieServiceImpl.insert(paymentDTO);
		
		model.addAttribute("message", "성공");
		return "/paySystem/pay_result";		 
	}
}