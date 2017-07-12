package com.choa.payment.support;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.choa.payment.PaymentDTO;
import com.choa.payment.PaymentService;

@Service
public class PaymentSupportServiceImpl implements PaymentService{

	@Inject
	private PaymentSupportDAOImpl paymentSupportDAOImpl;
	
	@Override
	public int insert(PaymentDTO paymentDTO) throws Exception {
		return paymentSupportDAOImpl.pay_start(paymentDTO);		
		
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
