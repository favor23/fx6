package com.choa.controllor;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.choa.movie.MovieDTO;
import com.choa.paySystem.Bank;
import com.choa.payment.PaymentDTO;
import com.choa.payment.movie.PaymentMovieServiceImpl;

@Controller
public class PaymentMovieController {
	
	@Inject
	private PaymentMovieServiceImpl paymentMovieServiceImpl;
	@Inject
	private MovieController movieController;	
	
	@RequestMapping(value="/paySystem/pay24", method=RequestMethod.POST)
	public void pay24(MovieDTO movieDTO, HttpSession session, Model model) throws Exception{//가격
		movieDTO=movieController.movieViewdto(movieDTO.getMovie_num(), model);
		List<MovieDTO> list=new ArrayList<MovieDTO>();		
		list.add(movieDTO);
		session.setAttribute("list", list);
	}
	
	@RequestMapping(value="/paySystem/pay24")
	public void pay24(){			
	}
	
	@RequestMapping(value="movie_bank", method=RequestMethod.POST)
	public String bank(PaymentDTO paymentDTO,String cardNum1, String cardNum2, String cardNum3, String cardNum4, Model model) throws Exception{		
		 String str = cardNum1 + cardNum2 + cardNum3 + cardNum4;
		 Bank bank_ck=new Bank();
		 String message=bank_ck.number_ck(str);
		 int result=0;
		 if(message.equals("올바른 카드번호")){
			result=paymentMovieServiceImpl.insert(paymentDTO);
			if(result==0){
				message="결제성공";
			}
		 }
		model.addAttribute("message", message);
		return "/paySystem/pay_result";		 
	}
}