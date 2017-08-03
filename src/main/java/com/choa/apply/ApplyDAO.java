package com.choa.apply;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.choa.util.ListInfo;

@Repository
public class ApplyDAO {

	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE="ApplyMapper.";
	
	
	public int ApplyWrite(ApplyDTO applyDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"apply", applyDTO);
	}
	
	public List<ApplyDTO> applyList(ApplyDTO applyDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"applyList", applyDTO);
	}
	
	public int applyCount() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"applyCount");
	}
}
