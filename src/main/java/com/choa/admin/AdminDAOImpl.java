package com.choa.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.choa.banList.BanlistDTO;
import com.choa.banList.ReasonDTO;
import com.choa.chatting.ChattingDTO;
import com.choa.customer.CustomerDTO;
import com.choa.member.MemberDAO;
import com.choa.member.MemberDTO;
import com.choa.util.ListInfo;


@Repository
public class AdminDAOImpl implements MemberDAO{

	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE="AdminMapper.";
	
	public int totalCount(String id)throws Exception{
		int totalCount=0;
		if(id.equals("n")){
			totalCount = sqlSession.selectOne(NAMESPACE+"totalCount");
		}else {
			totalCount = sqlSession.selectOne(NAMESPACE+"totalCount2",id);
		}
		return totalCount;
	}
	
	public List<BanlistDTO> banProccessListAll(ListInfo listInfo)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("listInfo", listInfo);
		
		return sqlSession.selectList(NAMESPACE+"callBanListAll",map);
	}
	
	public List<BanlistDTO> banProccessListSearch(ListInfo listInfo,String id)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("listInfo", listInfo);
		map.put("id", id);
		return sqlSession.selectList(NAMESPACE+"callBanListSearch",map);
	}
	
	//reason counting
	public ReasonDTO reasonCount(String id)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"reasonCount", id);
	}
	
	public List<ChattingDTO> chatLog(String id)throws Exception{
		List<ChattingDTO> list = new ArrayList<ChattingDTO>();
		list = sqlSession.selectList(NAMESPACE+"chatLog", id);
		return list;
	}
	
	//ban+1
	public int banPlus(String num,String ban,String id)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("ban", ban);
		map.put("id", id);
		
		return sqlSession.update(NAMESPACE+"banPlus", map);
	}
	
	public int proccess(int num,String id,String ban)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("num", num);
		map.put("ban", ban);
		return sqlSession.update(NAMESPACE+"proccess",map);
		
	}
	
	public int banReset(String id)throws Exception{
		return sqlSession.update(NAMESPACE+"banReset",id);
	}
	
	//banList
	public List<BanlistDTO> callBanList()throws Exception{
		return sqlSession.selectList(NAMESPACE+"callBanList");
	}
	
	public int banCount()throws Exception{
		return sqlSession.selectOne(NAMESPACE+"banCount");
	}
	
	public CustomerDTO chkBan(String id)throws Exception {
		CustomerDTO customerDTO = new CustomerDTO();
		customerDTO = sqlSession.selectOne(NAMESPACE+"chkBan",id);
		return customerDTO;
	}
	
	
	
	
	@Override
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"admin_login",memberDTO);		
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
