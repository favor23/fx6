package com.choa.benefit;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BenefitDAO {
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "BenefitMapper.";
	
	public int benefitWrite(BenefitDTO benefitDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "benefitWrite", benefitDTO);
	}
	
	public List<BenefitDTO> benefitList(int campaign_num) throws Exception {
		return sqlSession.selectList(NAMESPACE + "benefitList", campaign_num);
	}
	
	public int benefitCount(int campaign_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "benefitCount", campaign_num);
	}
	
	public int benefitDelete(int benefit_num) throws Exception {
		return sqlSession.delete(NAMESPACE + "benefitDelete", benefit_num);
	}
}
