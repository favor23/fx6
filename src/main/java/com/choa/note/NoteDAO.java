package com.choa.note;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.choa.util.ListInfo;

@Repository
public class NoteDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "NoteMapper.";
	
	public List<NoteDTO> noteList(ListInfo listInfo) throws Exception{
		return sqlSession.selectList(NAMESPACE+"list", listInfo);
	}
	
	public int noteCount(ListInfo listInfo) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"count", listInfo);
	}
	
	public int noteWrite(NoteDTO noteDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"write", noteDTO);
	}
	
	public NoteDTO noteView(int num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"view", num);
	}
	
	public int noteDelete(int num) throws Exception{
		return sqlSession.delete(NAMESPACE+"delete", num);
	}

}
