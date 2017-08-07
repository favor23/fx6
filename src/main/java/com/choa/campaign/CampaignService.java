package com.choa.campaign;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.choa.util.ListInfo;

@Service
public class CampaignService {
	@Autowired
	private CampaignDAO campaignDAO;
	
	public List<CampaignDTO> campaignList(ListInfo listInfo) throws Exception {
		int totalCount = campaignDAO.campaignCount();
		
		listInfo.makePage(totalCount);
		listInfo.setRow();
		
		return campaignDAO.campaignList(listInfo);
	}
	
	public int campaignCount() throws Exception {
		return campaignDAO.campaignCount();
	}
	
	public int campaignWrite() throws Exception {
		return campaignDAO.campaignWrite();
	}
	
	public int numSelect() throws Exception {
		return campaignDAO.numSelect();
	}
	
	public int campaignComplete(CampaignDTO campaignDTO) throws Exception {
		return campaignDAO.campaignComplete(campaignDTO);
	}
	
	public List<CampaignDTO> campaignNew() throws Exception {
		return campaignDAO.campaignNew();
	}
	
	public List<CampaignDTO> campaignBest() throws Exception {
		return campaignDAO.campaignBest();
	}
	
	public List<CampaignDTO> campaignBest2() throws Exception {
		return campaignDAO.campaignBest2();
	}
	
	public List<CampaignDTO> campaignBest3() throws Exception {
		return campaignDAO.campaignBest3();
	}
}
