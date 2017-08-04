package com.choa.customer;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.choa.banList.BanlistDTO;
import com.choa.member.MemberDTO;
import com.choa.member.MemberService;
import com.choa.movie.MovieDTO;
import com.choa.pr.PrDTO;
import com.choa.taste.TasteDTO;
import com.choa.util.ListInfo;


@Service
public class CustomerServiceImpl implements MemberService{

	@Autowired
	private CustomerDAO customerDAO;
	
	public int intoBan(BanlistDTO banlistDTO)throws Exception{
		return customerDAO.intoBan(banlistDTO);
	}
	
	
	public PrDTO view_pr(CustomerDTO customerDTO)throws Exception{
		return customerDAO.view_pr(customerDTO);
		
	}
	
	public int write_pr(PrDTO prDTO)throws Exception {
		return customerDAO.write_pr(prDTO);
	}
	
	
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
	
	public CustomerDTO idCheck(CustomerDTO customerDTO)throws Exception{
		return customerDAO.idCheck(customerDTO);
	}
	
	public CustomerDTO pwCheck(CustomerDTO customerDTO)throws Exception{
		return customerDAO.pwCheck(customerDTO);
	}
	
	public List<MovieDTO> movieList(ListInfo listInfo,String[] ar) throws Exception {
		int totalCount = customerDAO.movieCount(ar);
		listInfo.makePage(totalCount);
		listInfo.setRow();
		
		return customerDAO.movieList(listInfo,ar);
	}
	
	public List<MovieDTO> movieList2(ListInfo listInfo,String ar) throws Exception {
		int totalCount = customerDAO.movieCount2(ar);
		listInfo.makePage(totalCount);
		listInfo.setRow();
		
		return customerDAO.movieList2(listInfo,ar);
	}
	
	public int movieCount(String[] ar) throws Exception {
		return customerDAO.movieCount(ar);
	}
	
}
