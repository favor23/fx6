package com.choa.payment.support;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choa.payment.PaymentDAO;
import com.choa.payment.PaymentDTO;

@Repository
public class PaymentSupportDAOImpl implements PaymentDAO{

	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="PaymentSupportMapper.";
	
	@Override
	public int pay_start(PaymentDTO paymentDTO) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("dto", paymentDTO);
		sqlSession.insert(NAMESPACE+"insert", map);
		int result=(Integer)map.get("result");
		return result;
	}

	@Override
	public PaymentDTO pay(String id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int payRefund(int num) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
