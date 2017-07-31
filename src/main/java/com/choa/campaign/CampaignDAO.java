package com.choa.campaign;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CampaignDAO {
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "CampaignMapper.";
	
	public int campaignWrite() throws Exception {
		return sqlSession.insert(NAMESPACE + "campaignWrite");
	}
	
	public int numSelect() throws Exception {
		return sqlSession.selectOne(NAMESPACE + "numSelect");
	}
	
	public int campaignComplete(CampaignDTO campaignDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "campaignComplete", campaignDTO);
	}
}
