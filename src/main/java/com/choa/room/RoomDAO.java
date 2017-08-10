package com.choa.room;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RoomDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="RoomMapper.";
	
	public RoomDTO playtime(Integer num)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"playtime", num);
	}
	
	public int playtimeUpdate(RoomDTO roomDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"playtimeUpdate", roomDTO);
	}
	
}
