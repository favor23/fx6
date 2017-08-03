package com.choa.matching;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.choa.util.ListInfo;

@Service
public class MatchingService {
	
	@Autowired
	private MatchingDAO matchingDAO;
	
	
	public List<MatchingDTO> matchingList(ListInfo listInfo) throws Exception{
		
		int totalCount = matchingDAO.matchingCount();
		
		listInfo.makePage(totalCount);
		listInfo.setRow();
		
		return matchingDAO.matchingList(listInfo);
	}
	
	public int matchingCount() throws Exception{
		return matchingDAO.matchingCount();	
	}
	
	public MatchingDTO matchingDetail(int matching_num) throws Exception{
		return matchingDAO.matchingDetail(matching_num);
	}
	
	public MatchingDTO matchingDetail2(int matching_num) throws Exception{
		return matchingDAO.matchingDetail2(matching_num);
	}
	
	public int mathingWrite(MatchingDTO matchingDTO) throws Exception{
		return matchingDAO.matchingWrite(matchingDTO);
	}
	
	public MatchingDTO matchingView(int matching_num) throws Exception{
		return matchingDAO.matchingView(matching_num);
	}
	
	public int matchingWrite(MatchingDTO matchingDTO) throws Exception{
		return matchingDAO.matchingWrite(matchingDTO);
	}
	
	public int matchingUpdate(MatchingDTO matchingDTO) throws Exception{
		return matchingDAO.matchingUpdate(matchingDTO);
	}
	
	public int matchingDelete(int matching_num) throws Exception{
		return matchingDAO.matchingDelete(matching_num);
	}



}
