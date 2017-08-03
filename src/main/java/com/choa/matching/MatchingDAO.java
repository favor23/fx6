package com.choa.matching;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.choa.util.ListInfo;

@Repository
public class MatchingDAO {

	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "MatchingMapper.";
	
	public List<MatchingDTO> matchingList(ListInfo listInfo) throws Exception{
		return sqlSession.selectList(NAMESPACE+"matchingList", listInfo);
	}
	
	public int matchingCount() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"matchingCount");
	}
	
	public MatchingDTO matchingDetail(int matching_num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"matchingDetail", matching_num);
	}
	
	public MatchingDTO matchingDetail2(int matching_num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"matchingDetail2", matching_num);
	}
	
	public int matchingWrite(MatchingDTO matchingDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"matchingWrite", matchingDTO);
	}
	
	public MatchingDTO matchingView(int matching_num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"matchingView", matching_num);
	}
	
	public int matchingUpdate(MatchingDTO matchingDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"matchingUpdate", matchingDTO);
	}
	
	public int matchingDelete(int matching_num) throws Exception{
		return sqlSession.delete(NAMESPACE+"matchingDelete", matching_num);
	}
}
