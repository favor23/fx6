package com.choa.payment.movie;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.choa.payment.PaymentDAO;
import com.choa.payment.PaymentDTO;

@Repository
public class PaymentMovieDAOImpl implements PaymentDAO{

	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE="PaymentMovieMapper.";
	
	
	
	public int refund(PaymentDTO paymentDTO){
		return sqlSession.update(NAMESPACE+"refund",paymentDTO);	
	}
	
	
	public int refund_set(PaymentDTO paymentDTO){
		return sqlSession.update(NAMESPACE+"refund_set",paymentDTO);
	}
	
	
	@Override
	public int pay_start(PaymentDTO paymentDTO) throws Exception {
		System.out.println("DAO");
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
