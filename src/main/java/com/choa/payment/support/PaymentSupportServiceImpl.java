package com.choa.payment.support;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.choa.payment.PaymentDTO;
import com.choa.payment.PaymentService;
import com.choa.util.ListInfo;

@Service
public class PaymentSupportServiceImpl implements PaymentService{

	@Inject
	private PaymentSupportDAOImpl paymentSupportDAOImpl;
	
	
	public List<PaymentSupportDTO> psList(ListInfo listInfo){
		int totalCount = paymentSupportDAOImpl.count();
		
		listInfo.makePage(totalCount);
		listInfo.setRow();
		return paymentSupportDAOImpl.psList(listInfo);
	}
	
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
