package com.choa.rent;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.choa.util.ListInfo;

@Repository
public class RentDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "RentMapper.";
	
	
	public  List<RentDTO> rentList(ListInfo listInfo) throws Exception{
		return sqlSession.selectList(NAMESPACE+"rentList", listInfo);
	}
	
	public int rentCount() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"rentCount");
	}
	
	public RentDTO rentView(int num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"rentView", num);
	}
	

	

	
}
