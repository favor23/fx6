package com.choa.sr;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.choa.util.ListInfo;

@Service
public class SimpleReviewService {
	@Autowired
	private SimpleReviewDAO simpleReviewDAO;
	
	public List<SimpleReviewDTO> srList(ListInfo listInfo) throws Exception {
		int totalCount = simpleReviewDAO.srCount();
		
		listInfo.makePage(totalCount);
		listInfo.setRow();
		
		return simpleReviewDAO.srList(listInfo);
	}
}
