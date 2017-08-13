package com.choa.controllor;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.choa.paySystem.Bank;
import com.choa.payment.PaymentDTO;
import com.choa.payment.support.PaymentSupportDTO;
import com.choa.payment.support.PaymentSupportServiceImpl;

@Controller
public class PaymentSupportController {
	
	@Inject
	private PaymentSupportServiceImpl paymentSupportServiceImpl;	

	@RequestMapping(value="support_bank", method=RequestMethod.POST)
	public String bank(PaymentSupportDTO paymentSupportDTO,String cardNum1, String cardNum2, String cardNum3, String cardNum4, Model model) throws Exception{		
		 String str = cardNum1 + cardNum2 + cardNum3 + cardNum4;
		 Bank bank_ck=new Bank();
		 String message=bank_ck.number_ck(str);
		 System.out.println(message);
		 int result=0;
		 if(message.equals("올바른 카드번호")){
			 paymentSupportDTO.setCard_num(str);
			 System.out.println(paymentSupportDTO.getAddress());
			 System.out.println(paymentSupportDTO.getCard_num());
			 System.out.println(paymentSupportDTO.getId());
			 System.out.println(paymentSupportDTO.getMoney());
			 System.out.println(paymentSupportDTO.getPresent());
			 System.out.println(paymentSupportDTO.getProject_num());
			 System.out.println(paymentSupportDTO.getType());
			result=paymentSupportServiceImpl.insert(paymentSupportDTO);
			if(result>0){
				message="결제성공";
			}else{
				message="결제실패";
			}
		 }
		model.addAttribute("message", message);
		return "/paySystem/paysuccess";		 
	}
	@RequestMapping(value="/paySystem/pay24_s", method=RequestMethod.POST)
	public void pay24_s(){
		
	}
}
