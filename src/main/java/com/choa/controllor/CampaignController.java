package com.choa.controllor;

import java.sql.Date;
import java.util.List;

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
import com.choa.movie.MovieDTO;
import com.choa.util.ListInfo;

@Controller
@RequestMapping(value = "/crowd_funding/campaign/**")
public class CampaignController {
	@Autowired
	private CampaignService campaignService; 
	
	@RequestMapping(value = "campaignCreate", method = RequestMethod.GET)
	public void campaignCreate() {
		
	}
	
	@RequestMapping(value = "campaignList", method = RequestMethod.GET)
	public void campaignList() {
		
	}
	
	@RequestMapping(value = "getCampaignList", method = RequestMethod.POST)
	public void campaignList(Integer curPage, Model model) {
		
	}
	
	@RequestMapping(value = "campaignWrite", method = RequestMethod.GET)
	public String campaignWrite() {
		int result = 0;
		
		try {
			result = campaignService.campaignWrite();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "crowd_funding/campaign/campaignCreateForm";
	}
	
	@RequestMapping(value = "campaignCreateForm", method = RequestMethod.GET)
	public void campaignCreateForm() {
		
	}
	
	@RequestMapping(value = "campaignCreateForm", method = RequestMethod.POST)
	public String campaignCreateForm(String campaign_title, Integer goal_price, Integer period, @RequestParam("campaign_end") String campaign_end, @RequestParam("campaign_img") MultipartFile campaign_img, HttpSession session, Model model) {
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
		int num = 0;
		
		try {
			num = campaignService.numSelect();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("dto", campaignDTO);
		model.addAttribute("campaign_num", num);
		
		return "crowd_funding/campaign/campaignCreateForm3";
	}
	
	@RequestMapping(value = "campaignCreateForm3", method = RequestMethod.POST)
	public String campaignCreateForm3(CampaignDTO campaignDTO ,Model model) {
		int num = 0;
		
		try {
			num = campaignService.numSelect();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("dto", campaignDTO);
		model.addAttribute("campaign_num", num);
		
		return "crowd_funding/campaign/campaignCreateForm4";
	}
	
	@RequestMapping(value = "campaignCreateForm4", method = RequestMethod.POST)
	public String campaignCreateForm4(CampaignDTO campaignDTO, Model model) {
		int result = 0;
		String message = "캠페인 생성 실패! 자세한 사항은 담당자에게 문의하세요.";
		
		campaignDTO.setCampaign_num(campaignDTO.getCampaign_num()-1);
		
		try {
			result = campaignService.campaignComplete(campaignDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(result>0) {
			message = "캠페인이 생성되었습니다!";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("path", "../cf_index");
		
		return "commons/result";
	}
}
