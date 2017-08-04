package com.choa.chatting;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChattingDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "ChattingMapper.";

	
	//자신이 쓴글일때 그냥 넣어줌
	public int chatting(Integer num, String writer, String contents, String grade)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("room_num", num);
		map.put("writer", writer);
		map.put("contents", contents);
		map.put("grade", grade);
		return sqlSession.insert(NAMESPACE+"chatting", map);
	}
	
	//자신이 쓴 글이 아닐때 상대방 grade를 받아와서 넣어주고 insert 
	public int chatting2(Integer num, String writer, String contents)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("room_num", num);
		map.put("writer", writer);
		map.put("contents", contents);
		return sqlSession.insert(NAMESPACE+"chatting2", map);
	}
	
	
}
