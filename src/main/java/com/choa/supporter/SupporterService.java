package com.choa.supporter;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SupporterService {
	@Autowired
	private SupporterDAO supporterDAO;
	
	public List<SupporterDTO> supporterList(int campaign_num) throws Exception {
		return supporterDAO.supporterList(campaign_num);
	}
}
