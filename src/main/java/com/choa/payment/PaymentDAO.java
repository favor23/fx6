package com.choa.payment;

public interface PaymentDAO {

	//결제
	public int pay_start(PaymentDTO paymentDTO)throws Exception;	
	
	//결제 검색 id
	public PaymentDTO pay(String id)throws Exception;
	
	//환불 refund 0 =>1
	public int payRefund(int num)throws Exception;
		
}
