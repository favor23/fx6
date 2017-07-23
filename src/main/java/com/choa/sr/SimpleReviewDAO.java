package com.choa.sr;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.choa.util.ListInfo;

@Repository
public class SimpleReviewDAO {
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "SimpleReviewMapper.";
	
	public List<SimpleReviewDTO> srList(ListInfo listInfo) throws Exception {
		return sqlSession.selectList(NAMESPACE + "srList", listInfo);
	}
	
	public int srCount() throws Exception {
		return sqlSession.selectOne(NAMESPACE + "srCount");
	}
	
	public int srWrite(SimpleReviewDTO simpleReviewDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "srWrite", simpleReviewDTO);
	}
	
	public int srGood(int num) throws Exception {
		return sqlSession.update(NAMESPACE + "srGood", num);
	}
	
	public int srBad(int num) throws Exception {
		return sqlSession.update(NAMESPACE + "srBad", num);
	}
}
