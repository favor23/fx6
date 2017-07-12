package com.choa.member;

import org.springframework.stereotype.Service;

@Service
public interface MemberService {

	public int join(MemberDTO memberDTO)throws Exception;
	
	public MemberDTO login(MemberDTO memberDTO)throws Exception;
	
	public int logout(MemberDTO memberDTO)throws Exception;
	
	public int delete(MemberDTO memberDTO)throws Exception;
	
	public int update(MemberDTO memberDTO)throws Exception;
}
