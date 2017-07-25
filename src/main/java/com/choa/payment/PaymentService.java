package com.choa.payment;

public interface PaymentService {

	//결제
	public int insert(PaymentDTO paymentDTO)throws Exception;
	
	//결제 검색 id
	public PaymentDTO selectone(String id)throws Exception;
	
	//환불 refund 0=>1
	public int refundUpdate(int num)throws Exception;

	
	
}
