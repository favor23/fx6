package com.choa.movieupload;

import java.sql.Connection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.cursor.Cursor;
import org.apache.ibatis.executor.BatchResult;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Repository
public class MovieUploadDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "MovieUploadMapper.";
	
	public int upload(String fname, String oname, String playtime, String startTime, String lastTime)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("oname", oname);
		map.put("fname", fname);
		map.put("playtime", playtime);
		map.put("starttime", startTime);
		map.put("lasttime", lastTime);
		return sqlSession.insert(NAMESPACE+"upload", map);
	}
	
	public MovieUploadDTO view(Integer movie_num)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"view", movie_num);
	}
	
}
