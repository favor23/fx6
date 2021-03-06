package com.choa.rent;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.choa.util.ListInfo;

@Service
public class RentService {

	@Autowired
	private RentDAO rentDAO;
	
	//list
	public List<RentDTO> rentList() throws Exception{
		int totalCount = rentDAO.rentCount();
		
	
		
		return rentDAO.rentList();
	}
	
	//count
	public int rentCount() throws Exception{
		return rentDAO.rentCount();
	}
	
	//view
	public RentDTO rentView(int num) throws Exception{
		return rentDAO.rentView(num);
	}
	
	
}
