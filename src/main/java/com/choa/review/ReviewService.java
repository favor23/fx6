package com.choa.review;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.choa.util.ListInfo;

@Service
public class ReviewService {
	
	@Inject
	private ReviewDAO reviewDAO;
	
	//list
	public List<ReviewDTO> reviewList(ListInfo listInfo) throws Exception{
		int result = reviewDAO.reviewCount(listInfo);
		listInfo.makePage(result);
		listInfo.setRow();
		
		return reviewDAO.reviewList(listInfo);
	}
	
	//write
	public int reviewWrite(ReviewDTO reviewDTO) throws Exception{		
		return reviewDAO.reviewWrite(reviewDTO);
	}

	
	//view
	public ReviewDTO reviewView(int num) throws Exception{		
		return reviewDAO.reviewView(num);
	}
	
	//delete
	public int reviewDelete(int num) throws Exception{
		return reviewDAO.reviewDelete(num);
	}
	
	//update
	public int reviewUpdate(ReviewDTO reviewDTO) throws Exception{
		return reviewDAO.reviewUpdate(reviewDTO);
	}
}
