package com.choa.sr;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.choa.review.ReviewDAO;
import com.choa.review.ReviewDTO;
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
	
	public int srWrite(SimpleReviewDTO simpleReviewDTO) throws Exception {
		return simpleReviewDAO.srWrite(simpleReviewDTO);
	}
	
	public int srGood(int num) throws Exception {
		return simpleReviewDAO.srGood(num);
	}
	
	public int srBad(int num) throws Exception {
		return simpleReviewDAO.srBad(num);
	}
	
	public int srDelete(int num) throws Exception {
		return simpleReviewDAO.srDelete(num);
	}
	
	public List<ReviewDTO> rList(ListInfo listInfo) throws Exception {
		int totalCount = simpleReviewDAO.rCount(listInfo.getMovie_num());
		
		listInfo.makePage(totalCount);
		listInfo.setRow();
		
		return simpleReviewDAO.rList(listInfo);
	}
	
	public int rCount(int movie_num) throws Exception {
		return simpleReviewDAO.rCount(movie_num);
	}
	
	public List<ReviewDTO> rUpList(ListInfo listInfo) throws Exception {
		int totalCount = simpleReviewDAO.rCount(listInfo.getMovie_num());
		
		listInfo.makePage(totalCount);
		listInfo.setRow();
		
		return simpleReviewDAO.rUpList(listInfo);
	}
}
