package com.choa.room;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.choa.util.ListInfo;

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
	
	public int roomCount(ListInfo listInfo)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"roomcount", listInfo);
	}
	
	public List<RoomDTO> roomList(ListInfo listInfo)throws Exception{
		return sqlSession.selectList(NAMESPACE+"roomList", listInfo);
	}
	
}
