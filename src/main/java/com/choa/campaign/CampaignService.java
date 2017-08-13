package com.choa.campaign;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.choa.benefit.BenefitDTO;
import com.choa.util.ListInfo;

@Service
public class CampaignService {
	@Autowired
	private CampaignDAO campaignDAO;
	
	public int campaignDone2(int benefit_num) throws Exception {
		return campaignDAO.campaignDone2(benefit_num);
	}
	
	public int campaignDone(CampaignDTO campaignDTO) throws Exception {
		return campaignDAO.campaignDone(campaignDTO);
	}
	
	public List<BenefitDTO> benefitView(int campaign_num) throws Exception {
		return campaignDAO.benefitView(campaign_num);
	}
	
	public int campaignUp(int campaign_num) throws Exception {
		return campaignDAO.campaignUp(campaign_num);
	}
	
	public int campaignDown(int campaign_num) throws Exception {
		return campaignDAO.campaignDown(campaign_num);
	}
	
	public int campaignHit(int campaign_num) throws Exception {
		return campaignDAO.campaignHit(campaign_num);
	}
	
	public CampaignDTO campaignView(int campaign_num) throws Exception {
		return campaignDAO.campaignView(campaign_num);
	}
	
	public List<CampaignDTO> campaignList(ListInfo listInfo) throws Exception {
		int totalCount = campaignDAO.campaignCount();
		
		listInfo.makePage(totalCount);
		listInfo.setRow();
		
		return campaignDAO.campaignList(listInfo);
	}
	
	public List<CampaignDTO> campaignList2(ListInfo listInfo) throws Exception {
		int totalCount = campaignDAO.campaignCount();
		
		listInfo.makePage(totalCount);
		listInfo.setRow();
		
		return campaignDAO.campaignList2(listInfo);
	}
	
	public List<CampaignDTO> campaignList3(ListInfo listInfo) throws Exception {
		int totalCount = campaignDAO.campaignCount();
		
		listInfo.makePage(totalCount);
		listInfo.setRow();
		
		return campaignDAO.campaignList3(listInfo);
	}
	
	public List<CampaignDTO> campaignList4(ListInfo listInfo) throws Exception {
		int totalCount = campaignDAO.campaignCount();
		
		listInfo.makePage(totalCount);
		listInfo.setRow();
		
		return campaignDAO.campaignList4(listInfo);
	}
	
	public List<CampaignDTO> campaignList5(ListInfo listInfo) throws Exception {
		int totalCount = campaignDAO.campaignCount();
		
		listInfo.makePage(totalCount);
		listInfo.setRow();
		
		return campaignDAO.campaignList5(listInfo);
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
