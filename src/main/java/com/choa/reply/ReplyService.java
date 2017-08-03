package com.choa.reply;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.choa.util.ListInfo;

@Service
public class ReplyService {

	@Inject
	private ReplyDAO replyDAO;
	
	public List<ReplyDTO> replyList(ListInfo listInfo , Integer review_num) throws Exception{
		int result = replyDAO.replyCount(listInfo);
		listInfo.makePage(result);
		listInfo.setRow();
		listInfo.setReview_num(review_num);
		
		return replyDAO.replyList(listInfo);
	}
	
	public int replyWirte(ReplyDTO replyDTO) throws Exception{
		return replyDAO.replyWrite(replyDTO);
	}
	
	public int replyDelete(int num) throws Exception{
		return replyDAO.replyDelete(num);
	}
	
	public int replyUpdate(ReplyDTO replyDTO) throws Exception{
		return replyDAO.replyUpdate(replyDTO);
	}

}
