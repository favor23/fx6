package com.choa.campaign;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.choa.util.ListInfo;

@Repository
public class CampaignDAO {
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "CampaignMapper.";
	
	public List<CampaignDTO> campaignList(ListInfo listInfo) throws Exception {
		return sqlSession.selectList(NAMESPACE + "campaignList", listInfo);
	}
	
	public int campaignCount() throws Exception {
		return sqlSession.selectOne(NAMESPACE + "campaignCount");
	}
	
	public int campaignWrite() throws Exception {
		return sqlSession.insert(NAMESPACE + "campaignWrite");
	}
	
	public int numSelect() throws Exception {
		return sqlSession.selectOne(NAMESPACE + "numSelect");
	}
	
	public int campaignComplete(CampaignDTO campaignDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "campaignComplete", campaignDTO);
	}
	
	public List<CampaignDTO> campaignNew() throws Exception {
		return sqlSession.selectList(NAMESPACE + "campaignNew");
	}
	
	public List<CampaignDTO> campaignBest() throws Exception {
		return sqlSession.selectList(NAMESPACE + "campaignBest");
	}
	
	public List<CampaignDTO> campaignBest2() throws Exception {
		return sqlSession.selectList(NAMESPACE + "campaignBest2");
	}
	
	public List<CampaignDTO> campaignBest3() throws Exception {
		return sqlSession.selectList(NAMESPACE + "campaignBest3");
	}
}
