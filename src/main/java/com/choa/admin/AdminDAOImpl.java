package com.choa.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.choa.customer.CustomerDTO;
import com.choa.member.MemberDAO;
import com.choa.member.MemberDTO;


@Repository
public class AdminDAOImpl implements MemberDAO{

	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE="AdminMapper.";
	
	
	
	@Override
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("adminDTO", memberDTO);
		sqlSession.selectOne(NAMESPACE+"login", map);
		List<AdminDTO> list =(List<AdminDTO>)map.get("admin");
		if(list.isEmpty()){
			return null;				
		}else {
			return list.get(0);
		}
		
	}
	
	
	@Override
	public int logout(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int join(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int delete(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	/* =======================================인트라넷 =============================== */
	
	// admin모두 부르기
	public List<AdminDTO> selectlist() {
		return sqlSession.selectList(NAMESPACE+"admin_selectList");
	}
	

	public AdminDTO selectOne(AdminDTO AdminDTO) {
		return sqlSession.selectOne(NAMESPACE+"admin_selectOne",AdminDTO);
	}
	
	
	
}
