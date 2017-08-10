package com.choa.cinema;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.choa.customer.CustomerDTO;
import com.choa.movie.MovieDTO;
import com.choa.util.ListInfo;

import oracle.jdbc.internal.OracleStatement.SqlKind;

@Repository
public class CinemaDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "CinemaMapper.";
	
	public CustomerDTO myTicket(String id){
		return sqlSession.selectOne("myTicket", id);
	}
	
	public List<MovieDTO> listAll(ListInfo listInfo)throws Exception{
		return sqlSession.selectList(NAMESPACE+"listAll", listInfo);
	}
	
	public List<MovieDTO> myList(String id, ListInfo listInfo, int [] ticketar)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("listInfo", listInfo);
		map.put("ticketar", ticketar);
		return sqlSession.selectList(NAMESPACE+"myList", map);
	}
	
	public List<MovieDTO> hotList(ListInfo listInfo, String [] genre)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("genre", genre);
		map.put("listInfo", listInfo);
		return sqlSession.selectList(NAMESPACE+"hotList", map);
	}
	
	public List<MovieDTO> schedule()throws Exception{
		return sqlSession.selectList(NAMESPACE+"schedule");
	}
	
	public int countAll(ListInfo listInfo) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"count", listInfo);
	}
	
	public int countMy(ListInfo listInfo, int [] ticketar) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ticketar", ticketar);
		map.put("listInfo", listInfo);
		return sqlSession.selectOne(NAMESPACE+"countMy", map);
	}
	
	public int countHot(ListInfo listInfo, String [] genre) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("genre", genre);
		map.put("listInfo", listInfo);
		return sqlSession.selectOne(NAMESPACE+"countHot", map);
	}
}
