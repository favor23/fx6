package com.choa.cinema;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.choa.movie.MovieDTO;
import com.choa.util.ListInfo;

import oracle.jdbc.internal.OracleStatement.SqlKind;

@Repository
public class CinemaDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "CinemaMapper.";
	
	public List<MovieDTO> listAll()throws Exception{
		return sqlSession.selectList(NAMESPACE+"listAll");
	}
	
	public List<MovieDTO> myList(String id, ListInfo listInfo)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("cinema DAO");
		map.put("id", id);
		map.put("listInfo", listInfo);
		return sqlSession.selectList(NAMESPACE+"myList", map);
	}
	
	public List<MovieDTO> hotList(String [] genrear, ListInfo listInfo)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("genre", genrear);
		map.put("listInfo", listInfo);
		return sqlSession.selectList(NAMESPACE+"hotList", map);
	}
	
	public List<MovieDTO> schedule()throws Exception{
		return sqlSession.selectList(NAMESPACE+"schedule");
	}
	
}
