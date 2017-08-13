package com.choa.supporter;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SupporterDAO {
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "SupporterMapper.";
	
	public List<SupporterDTO> supporterList(int campaign_num) throws Exception {
		return sqlSession.selectList(NAMESPACE + "supporterList", campaign_num);
	}
}
