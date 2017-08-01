package com.choa.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.choa.member.MemberDTO;
import com.choa.member.MemberService;


@Service
public class AdminServiceImpl implements MemberService{

	@Autowired
	private AdminDAOImpl adminDAO;

	@Override
	public int join(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		return adminDAO.login(memberDTO);
	}

	@Override
	public int logout(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public int update(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	/* =======================================인트라넷 =============================== */
	
	// admin모두 부르기
	public List<AdminDTO> selectlist() {
		return adminDAO.selectlist();
	}	

	public AdminDTO selectOne(AdminDTO AdminDTO) {
		return adminDAO.selectOne(AdminDTO);
	}	
	
}