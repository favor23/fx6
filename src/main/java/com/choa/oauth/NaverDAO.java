package com.choa.oauth;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.choa.customer.CustomerDTO;

@Repository
public class NaverDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="NaverMapper.";
	
	public int check(String id)throws Exception{
		id="N"+id;
		return sqlSession.selectOne(NAMESPACE+"check", id);
	}
	
	public int join(CustomerDTO customerDTO)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		customerDTO.setId("N"+customerDTO.getId());
		map.put("dto", customerDTO);
		return sqlSession.insert(NAMESPACE+"social_join", map);
	}
	
	public CustomerDTO login(String id)throws Exception{
		id="N"+id;
		return sqlSession.selectOne(NAMESPACE+"social_login", id);
	}
	
	
	
}
