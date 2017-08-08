package com.choa.oauth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.choa.customer.CustomerDTO;

@Service
public class NaverService {

	@Autowired
	private NaverDAO naverDAO;

	public int check(String id)throws Exception{
		return naverDAO.check(id);
	}
	
	public int join(CustomerDTO customerDTO)throws Exception{
		return naverDAO.join(customerDTO);
	}
	
	public CustomerDTO login(String id)throws Exception{
		return naverDAO.login(id);
	}
	
	
}
