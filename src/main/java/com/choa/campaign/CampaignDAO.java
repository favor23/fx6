package com.choa.campaign;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CampaignDAO {
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "CampaignMapper.";
}
