package com.choa.reply;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.choa.util.ListInfo;

@Repository
public class ReplyDAO {
	
	
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE="ReplyMapper.";
	
	public int replyCount(ListInfo listInfo) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"count", listInfo);
	}
	
	public List<ReplyDTO> replyList(ListInfo listInfo) throws Exception{
		return sqlSession.selectList(NAMESPACE+"list", listInfo);
	}
	
	public int replyWrite(ReplyDTO replyDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"write", replyDTO);
	}
	
	public int replyDelete(int num) throws Exception{
		return sqlSession.delete(NAMESPACE+"delete", num);
	}
	
	public int replyUpdate(ReplyDTO replyDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"update", replyDTO);
	}
	
}
