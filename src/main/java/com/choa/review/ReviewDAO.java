package com.choa.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.choa.util.ListInfo;

@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE="ReviewMapper.";
	
	
	
	public List<ReviewDTO> reviewList(ListInfo listInfo) throws Exception{	
		return sqlSession.selectList(NAMESPACE+"list", listInfo);		
	}
	
	public int reviewWrite(ReviewDTO reviewDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"write", reviewDTO);
	}
	
	public int reviewCount(ListInfo listInfo) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"count", listInfo);
	}
	
	public ReviewDTO reviewView(int num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"view", num);
	}
	
	public int reviewDelete(int num) throws Exception{
		return sqlSession.delete(NAMESPACE+"delete", num);
	}
	
	public int reviewUpdate(ReviewDTO reviewDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"update", reviewDTO);
	}
	
	public void reviewHit(int num) throws Exception{
		
	}
}
