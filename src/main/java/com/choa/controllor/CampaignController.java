package com.choa.controllor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.choa.campaign.CampaignService;

@Controller
@RequestMapping(value = "/crowd_funding/campaign/**")
public class CampaignController {
	@Autowired
	private CampaignService campaignService; 
	
	@RequestMapping(value = "campaignCreate", method = RequestMethod.GET)
	public void campaignCreate() {
		
	}
}
