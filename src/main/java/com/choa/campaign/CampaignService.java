package com.choa.campaign;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CampaignService {
	@Autowired
	private CampaignDAO campaignDAO;
	
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
