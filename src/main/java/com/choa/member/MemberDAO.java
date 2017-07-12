package com.choa.member;

public interface MemberDAO {

	
	public int join(MemberDTO memberDTO)throws Exception;
	
	public MemberDTO login(MemberDTO memberDTO)throws Exception;
	
	public int logout(MemberDTO memberDTO)throws Exception;
	
	public int delete(MemberDTO memberDTO)throws Exception;
	
	public int update(MemberDTO memberDTO)throws Exception;
}
