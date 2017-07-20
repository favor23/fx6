package com.choa.movie;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.choa.util.ListInfo;

@Repository
public class MovieDAO {
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "MovieMapper.";
	
	public List<MovieDTO> movieList(ListInfo listInfo) throws Exception {
		return sqlSession.selectList(NAMESPACE + "movieList", listInfo);
	}
	
	public int movieCount() throws Exception {
		return sqlSession.selectOne(NAMESPACE + "movieCount");
	}
	
	public MovieDTO movieView(int movie_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "movieView", movie_num);
	}
	
	public Double movieStars(int movie_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "movieStars", movie_num);
	}
}
