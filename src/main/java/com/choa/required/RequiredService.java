package com.choa.required;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.choa.util.ListInfo;

@Service
public class RequiredService {
	
	@Autowired
	private RequiredDAO requiredDAO;
	
	//list
	public List<RequiredDTO> requireList(ListInfo listInfo) throws Exception{
		int result = requiredDAO.requiredCount(listInfo);
		listInfo.makePage(result);
		listInfo.setRow();
		
		return requiredDAO.requiredList(listInfo);
	}
	
	//write
	public int requiredWrite(RequiredDTO requiredDTO) throws Exception{
		return requiredDAO.requiredWrite(requiredDTO);
		
	}
	
	//view
	public RequiredDTO requiredView(int num) throws Exception{
		return requiredDAO.requiredView(num);
	}
	
	//delete
	public int requiredDelete(int num) throws Exception{
		return requiredDAO.requiredDelete(num);
	}
	
	//update
	public int requiredUpdate(RequiredDTO requiredDTO) throws Exception{
		return requiredDAO.requiredUpdate(requiredDTO);
	}
	
	
	//replyWrite
	public int requiredReply(RequiredDTO requiredDTO) throws Exception{
		return requiredDAO.requiredReply(requiredDTO);
	}

}
