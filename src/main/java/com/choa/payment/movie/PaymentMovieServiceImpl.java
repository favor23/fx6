package com.choa.payment.movie;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.choa.payment.PaymentDTO;
import com.choa.payment.PaymentService;
import com.choa.util.ListInfo;

@Service
public class PaymentMovieServiceImpl implements PaymentService {

	@Autowired
	private PaymentMovieDAOImpl paymentMovieDAOImpl;
	
	public List<PaymentMovieDTO> pmList(ListInfo listInfo){
		int totalCount = paymentMovieDAOImpl.count();
		
		listInfo.makePage(totalCount);
		listInfo.setRow();
		return paymentMovieDAOImpl.pmList(listInfo);
	}
	
	public int refund(PaymentDTO paymentDTO){
		return paymentMovieDAOImpl.refund(paymentDTO);	
	}
	
	
	public int refund_set(PaymentDTO paymentDTO){
		return paymentMovieDAOImpl.refund(paymentDTO);
	}
	
	
	@Override
	public int insert(PaymentDTO paymentDTO) throws Exception {
		System.out.println("서비스");
		return paymentMovieDAOImpl.pay_start(paymentDTO);				
	}
	
	@Override
	public PaymentDTO selectone(String id) throws Exception {
		
		
		return null;		
	}

	@Override
	public int refundUpdate(int num) throws Exception {
		
		
		return num;		
	}

}
