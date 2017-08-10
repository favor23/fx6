package com.choa.customer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.choa.banList.BanlistDTO;
import com.choa.member.MemberDAO;
import com.choa.member.MemberDTO;
import com.choa.movie.MovieDTO;
import com.choa.pr.PrDTO;
import com.choa.util.ListInfo;

@Repository
public class CustomerDAO implements MemberDAO{
	//로그인, 로그아웃, 탈퇴. - member...
	//회원 가입
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="CustomerMapper.";
	
	
	//유저 탈퇴
	public int dropUser(String id)throws Exception{
		return sqlSession.delete(NAMESPACE+"dropuser", id);
	}
	
	//탈퇴하려는 유저의 비밀번호가 일치하는지 조회.
	public int dropUserCheck(MemberDTO memberDTO)throws Exception{
		String id=sqlSession.selectOne(NAMESPACE+"findPw", memberDTO);
		int num=0;
		if(id.equals(memberDTO.getId())){
			num=1;
		}
		return num;
	}
	
	
	public String gradeChecker(String id)throws Exception{
		 String grade = sqlSession.selectOne(NAMESPACE+"gradeChecker", id);
		 if(grade==null){
			 grade = "null";
		 }
		 return grade;
	}
	
	
	public int intoBan(BanlistDTO banlistDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"intoBan", banlistDTO);
	}
	
	
	public PrDTO view_pr(CustomerDTO customerDTO)throws Exception{
		
		 PrDTO prDTO = sqlSession.selectOne(NAMESPACE+"view_pr", customerDTO);
		 System.out.println("DAO : "+prDTO.getActivity());
		 return prDTO;
	}
	
	public int write_pr(PrDTO prDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"write_pr",prDTO);
		
	}
	
	
	public int movieCount(String[] ar) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("taste", ar);
		return sqlSession.selectOne(NAMESPACE + "movieCount",map);
	}
	
	public int movieCount2(String ar) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("taste", ar);
		return sqlSession.selectOne(NAMESPACE + "movieCount2",map);
	}
	
	public List<MovieDTO> movieList(ListInfo listInfo,String[] ar) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		for(int i=0;i<ar.length;i++){
			ar[i]="%"+ar[i]+"%";
		}
		map.put("taste", ar);
		map.put("listInfo", listInfo);
		return sqlSession.selectList(NAMESPACE + "movieList", map);
	}
	public List<MovieDTO> movieList2(ListInfo listInfo,String ar) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		ar="%"+ar+"%";
		map.put("taste", ar);
		map.put("listInfo", listInfo);
		return sqlSession.selectList(NAMESPACE + "movieList2", map);
	}
	
	
	
	public CustomerDTO pwCheck(CustomerDTO customerDTO)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customerDTO", customerDTO);
		sqlSession.selectOne(NAMESPACE+"pwCheck", map);
		List<CustomerDTO> list =(List<CustomerDTO>)map.get("check");
		if(list.isEmpty()){
			return null;				
		}else {
			return list.get(0);
		}
		
	}
	
	
	public CustomerDTO idCheck(CustomerDTO customerDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"idCheck", customerDTO);		
	}
	
	
	
	@Override
	public int join(MemberDTO memberDTO) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customerDTO", memberDTO);
		sqlSession.insert(NAMESPACE+"join", map);
		int result=(Integer)map.get("result");
		return result;
		
	}
	
	
	
	@Override
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		System.out.println("이거봐라이거:"+sqlSession);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customerDTO", memberDTO);
		sqlSession.selectOne(NAMESPACE+"login", map);
		List<CustomerDTO> list =(List<CustomerDTO>)map.get("customer");
		if(list.isEmpty()){
			return null;				
		}else {
			return list.get(0);
		}
		
	}
	

	

	@Override
	public int delete(MemberDTO memberDTO) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customerDTO", memberDTO);
		sqlSession.insert(NAMESPACE+"delete", map);
		int result=(Integer)map.get("result");
		return result;
	}
	
	@Override
	public int update(MemberDTO memberDTO) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dto", memberDTO);
		sqlSession.insert(NAMESPACE+"update", map);
		int result=(Integer)map.get("result");
		return result;
	}

	@Override
	public int logout(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	

}
