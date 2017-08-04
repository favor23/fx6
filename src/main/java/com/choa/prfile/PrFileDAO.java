package com.choa.prfile;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PrFileDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="PrFileMapper.";
	
	public int upload(String id, String fname,String oname)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("oname", oname);
		map.put("fname", fname);
		return sqlSession.insert(NAMESPACE+"upload", map);
	}
	
	public PrFileDTO view(String id)throws Exception{
		
		return sqlSession.selectOne(NAMESPACE+"view", id);
		
	}
	
}
