package com.choa.fx6;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.choa.payment.movie.PaymentMovieDTO;
import com.choa.payment.movie.PaymentMovieServiceImpl;
import com.choa.payment.support.PaymentSupportDTO;
import com.choa.payment.support.PaymentSupportServiceImpl;

public class payTEST extends MyAbstractTestUnit {

	/*@Autowired
	private PaymentMovieServiceImpl PaymentMovieServiceImpl;*/
	@Autowired
	private PaymentSupportServiceImpl paymentSupportServiceImpl;
	private static PaymentMovieDTO DTO;
	private static PaymentSupportDTO sdto;
	
	
	/*public void test() throws Exception {
		DTO=new PaymentMovieDTO();
		DTO.setMoney(10000);
		DTO.setId("test");
		DTO.setMovie_num(152);
		DTO.setType("Movie");
		int result=PaymentMovieServiceImpl.insert(DTO);
		
		if(result>0)
		{
			System.out.println("성공");
		}else{
			System.out.println("실패");
		}
	}*/

	@Test
	public void test2() throws Exception {
		sdto=new PaymentSupportDTO();
		sdto.setMoney(10000);
		sdto.setId("test");
		sdto.setType("support");
		sdto.setPresent("게임기");
		sdto.setAddress("집집집");
		sdto.setProject_num(2);
		
		int result=paymentSupportServiceImpl.insert(sdto);
		
		if(result>0)
		{
			System.out.println("성공");
		}else{
			System.out.println("실패");
		}
	}
}
