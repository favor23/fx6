package com.choa.admin.work;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WorkDAO {

	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE="WorkMapper.";
	
	//추가
	public int insert(WorkDTO workDTO) {
		return sqlSession.insert(NAMESPACE+"insert", workDTO);		
	}
	
	//수정
	public int update(WorkDTO workDTO){
		return sqlSession.update(NAMESPACE+"update", workDTO);
	}
	
	//삭제
	public int delete(WorkDTO workDTO){
		return sqlSession.delete(NAMESPACE+"delete", workDTO);
	}
	
	//퍼센트 수정 0~100
	public int progress(WorkDTO workDTO){
		return sqlSession.update(NAMESPACE+"update_pro", workDTO);
	}
	
	//전체 리스트
	public List<WorkDTO> list(){
		return sqlSession.selectList(NAMESPACE+"selectList");
	}
	
	//리스트 원
	public WorkDTO listone(WorkDTO workDTO){
		return sqlSession.selectOne(NAMESPACE+"selectOne",workDTO);
	}
}
