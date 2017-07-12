package com.choa.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.choa.member.MemberDTO;
import com.choa.member.MemberService;


@Service
public class CustomerServiceImpl implements MemberService{

	@Autowired
	private CustomerDAO customerDAO;
	
	@Override
	public int join(MemberDTO memberDTO) throws Exception {
		
		return customerDAO.join(memberDTO);
	}
	
	@Override
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		
		return customerDAO.login(memberDTO);
	}
	
	@Override
	public int logout(MemberDTO memberDTO) throws Exception {
		
		return customerDAO.logout(memberDTO);
	}
	
	
	
	@Override
	public int delete(MemberDTO memberDTO) throws Exception {
		
		return customerDAO.delete(memberDTO);
	}
	
	
	@Override
	public int update(MemberDTO memberDTO) throws Exception {
		
		return customerDAO.update(memberDTO);
	}
	
	
	
}
