package com.choa.room.roomuser;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.choa.customer.CustomerDTO;
import com.choa.util.ListInfo;

@Repository
public class RoomUserDAO {

	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE="RoomUserMapper.";
	
	//전체리스트
	public List<RoomUserDTO> selectList(){
		System.out.println("DAO실행");
		return sqlSession.selectList(NAMESPACE + "roomUserList");
	}
	
	
	//갯수
	public int count() throws Exception {
		return sqlSession.selectOne(NAMESPACE + "roomUserCount");
	}
	
	//입력
	public int update(RoomUserDTO rDto){
		
		return sqlSession.insert(NAMESPACE + "update", rDto);
	}
	
	public RoomUserDTO selectone(int num){
		return sqlSession.selectOne(NAMESPACE+"selectone", num);
	}
	
	
	
	//삭제
	
	
	
	
}
