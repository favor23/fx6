package com.choa.campaign;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CampaignService {
	@Autowired
	private CampaignDAO campaignDAO;
}
