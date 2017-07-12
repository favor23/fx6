package com.choa.customer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.choa.member.MemberDAO;
import com.choa.member.MemberDTO;

@Repository
public class CustomerDAO implements MemberDAO{
	//로그인, 로그아웃, 탈퇴. - member...
	//회원 가입
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="CustomerMapper.";
	
	
	@Override
	public int join(MemberDTO memberDTO) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customerDTO", memberDTO);
		System.out.println(memberDTO.getId());
		sqlSession.insert(NAMESPACE+"join", map);
		int result=(Integer)map.get("result");
		return result;
		
	}
	
	
	
	@Override
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customerDTO", memberDTO);
		sqlSession.selectOne(NAMESPACE+"login", map);
		List<CustomerDTO> list =(List<CustomerDTO>)map.get("customer");
		if(list.isEmpty()){
			return null;				
		}else {
			return list.get(0);
		}
		
	}
	
	
@Override
	public int logout(MemberDTO memberDTO) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customerDTO", memberDTO);
		sqlSession.insert(NAMESPACE+"join", map);
		int result=(Integer)map.get("result");
	return result;
	}
	

	@Override
	public int delete(MemberDTO memberDTO) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customerDTO", memberDTO);
		sqlSession.insert(NAMESPACE+"delete", map);
		int result=(Integer)map.get("result");
		return result;
	}
	
	@Override
	public int update(MemberDTO memberDTO) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dto", memberDTO);
		sqlSession.insert(NAMESPACE+"update", map);
		int result=(Integer)map.get("result");
		return result;
	}
	
	

}
