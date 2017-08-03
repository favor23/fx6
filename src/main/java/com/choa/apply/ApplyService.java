package com.choa.apply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.choa.util.ListInfo;

@Service
public class ApplyService {
	
	@Autowired
	private ApplyDAO applyDAO;
	
	public int applyWrite(ApplyDTO applyDTO) throws Exception{
		return applyDAO.ApplyWrite(applyDTO);
	}
	
	public List<ApplyDTO> applyList(ApplyDTO applyDTO) throws Exception{
		
		return applyDAO.applyList(applyDTO);
		
	}
	
}
