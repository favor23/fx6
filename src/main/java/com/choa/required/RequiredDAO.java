package com.choa.required;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.mvc.method.annotation.RequestResponseBodyMethodProcessor;

import com.choa.util.ListInfo;


@Repository
public class RequiredDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE ="RequiredMapper.";
	
	
	//영화 요청 전체 리스트 불러오는것.
	public List<RequiredDTO> requiredListAll() throws Exception{
		return sqlSession.selectList(NAMESPACE+"list_id");
	}
	
	public List<RequiredDTO> requiredList(ListInfo listInfo) throws Exception{
		return sqlSession.selectList(NAMESPACE+"list", listInfo);
	}
	
	public int requiredWrite(RequiredDTO requiredDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"write", requiredDTO);
	}
	
	public int requiredDelete(int num) throws Exception{
		return sqlSession.delete(NAMESPACE+"delete", num);
	}
	
	public int requiredUpdate(RequiredDTO requiredDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"update", requiredDTO);
	}
	
	public RequiredDTO requiredView(int num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"view", num);
	}
	
	public int requiredCount(ListInfo listInfo) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"count", listInfo);
	}
	
	public int requiredHit(int num) throws Exception{
		return sqlSession.update(NAMESPACE+"hit", num);
	}
	
	public int requiredReply(RequiredDTO requiredDTO) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("requiredDTO", requiredDTO);
		sqlSession.insert(NAMESPACE+"requiredReply", map);
		int result = (Integer)map.get("result");
		
		return result;
		
		
	}

}
