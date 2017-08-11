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
	
	public List<MovieDTO> movieList2(ListInfo listInfo) throws Exception {
		return sqlSession.selectList(NAMESPACE + "movieList2", listInfo);
	}
	
	public List<MovieDTO> movieList3(ListInfo listInfo) throws Exception {
		return sqlSession.selectList(NAMESPACE + "movieList3", listInfo);
	}
	
	public List<MovieDTO> movieList4(ListInfo listInfo) throws Exception {
		return sqlSession.selectList(NAMESPACE + "movieList4", listInfo);
	}
	
	public List<MovieDTO> movieList5() throws Exception {
		return sqlSession.selectList(NAMESPACE + "movieList5");
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
	
	public int movieWrite(MovieDTO movieDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "movieWrite", movieDTO);
	}
	
	public int movieUpdate(MovieDTO movieDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "movieUpdate", movieDTO);
	}
	
	public int movieDelete(int movie_num) throws Exception {
		return sqlSession.delete(NAMESPACE + "movieDelete", movie_num);
	}
	
	public Double movieSrStars(int movie_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "movieSrStars", movie_num);
	}
	
	public MovieRcdDTO rcd(int num)throws Exception {
		return sqlSession.selectOne(NAMESPACE+"rcd",num);
	}
}
