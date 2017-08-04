package com.choa.chatting;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChattingService {

	@Autowired
	private ChattingDAO chattingDAO;
	
	public int chatting(Integer num, String writer, String contents, String grade) throws Exception{
		return chattingDAO.chatting(num, writer, contents, grade);
	}
	
	public int chatting2(Integer num, String writer, String contents) throws Exception{
		return chattingDAO.chatting2(num, writer, contents);
	}
}
