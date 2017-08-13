package com.choa.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.choa.banList.BanlistDTO;
import com.choa.banList.ReasonDTO;
import com.choa.chatting.ChattingDTO;
import com.choa.customer.CustomerDTO;
import com.choa.member.MemberDTO;
import com.choa.member.MemberService;
import com.choa.util.ListInfo;


@Service
public class AdminServiceImpl implements MemberService{

	@Autowired
	private AdminDAOImpl adminDAO;

	public List<String> workers()throws Exception{
	   return adminDAO.workers();
	}
	
	public int totalCount(String id)throws Exception{
		return adminDAO.totalCount(id);
	}
	
	public List<BanlistDTO> banProccessListAll(ListInfo listInfo)throws Exception{
		return adminDAO.banProccessListAll(listInfo);
	}
	
	public List<BanlistDTO> banProccessListSearch(ListInfo listInfo,String id)throws Exception{
		return adminDAO.banProccessListSearch(listInfo, id);
	}
	
	public List<ChattingDTO> chatLog(String id)throws Exception{
		return adminDAO.chatLog(id);
	}
	
	public ReasonDTO reasonCount(String id)throws Exception{
		return adminDAO.reasonCount(id);
	}
	
	public int banReset(String id)throws Exception{
		return adminDAO.banReset(id);
	}
	
	public List<BanlistDTO> callBanList()throws Exception{
		return adminDAO.callBanList();
	}
	
	public int proccess(int num,String id,String ban)throws Exception{
		return adminDAO.proccess(num,id,ban);
	}
	
	public int banCount()throws Exception{
		return adminDAO.banCount();
	}
	
	public int banPlus(String num,String ban,String id)throws Exception{
		return adminDAO.banPlus(num,ban,id);
	}
	
	public CustomerDTO chkBan(String id)throws Exception{
		return adminDAO.chkBan(id);
	}
	
	@Override
	public int join(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		return adminDAO.login(memberDTO);
	}

	@Override
	public int logout(MemberDTO memberDTO) throws Exception {
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
		return adminDAO.selectlist();
	}	

	public AdminDTO selectOne(AdminDTO AdminDTO) {
		return adminDAO.selectOne(AdminDTO);
	}	
	
}