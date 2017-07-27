package com.choa.controllor;

import java.sql.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.choa.campaign.CampaignDTO;
import com.choa.campaign.CampaignService;
import com.choa.file.FileService;

@Controller
@RequestMapping(value = "/crowd_funding/campaign/**")
public class CampaignController {
	@Autowired
	private CampaignService campaignService; 
	
	@RequestMapping(value = "campaignCreate", method = RequestMethod.GET)
	public void campaignCreate() {
		
	}
	
	@RequestMapping(value = "campaignCreateForm", method = RequestMethod.POST)
	public String calpaignCreateForm(String campaign_title, Integer goal_price, Integer period, @RequestParam("campaign_end") String campaign_end, @RequestParam("campaign_img") MultipartFile campaign_img, HttpSession session, Model model) {
		FileService fileService = new FileService();
		CampaignDTO campaignDTO = new CampaignDTO();
		
		String fileName = "";
		
		campaignDTO.setCampaign_title(campaign_title);
		campaignDTO.setGoal_price(goal_price);
		campaignDTO.setPeriod(period);
		campaignDTO.setCampaign_end(Date.valueOf(campaign_end));
		
		try {
			fileName = fileService.fileSave2(campaign_img, session);
			
			campaignDTO.setCampaign_img("/img/campaign/" + fileName);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("dto", campaignDTO);
		
		return "crowd_funding/campaign/campaignCreateForm2";
	}
	
	@RequestMapping(value = "campaignCreateForm2", method = RequestMethod.POST)
	public String campaignCreateForm2(CampaignDTO campaignDTO, Model model) {		
		model.addAttribute("dto", campaignDTO);
		
		return "crowd_funding/campaign/campaignCreateForm3";
	}
	
	@RequestMapping(value = "campaignCreateForm3", method = RequestMethod.GET)
	public void campaignCreateForm3() {
		
	}
	
	@RequestMapping(value = "campaignCreateForm4", method = RequestMethod.GET)
	public void campaignCreateForm4() {
		
	}
}
