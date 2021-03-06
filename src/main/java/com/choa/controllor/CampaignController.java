package com.choa.controllor;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.choa.benefit.BenefitDTO;
import com.choa.campaign.CampaignDTO;
import com.choa.campaign.CampaignService;
import com.choa.campaign.SupportDTO;
import com.choa.file.FileService;
import com.choa.util.ListInfo;

@Controller
@RequestMapping(value = "/crowd_funding/campaign/**")
public class CampaignController {
	@Autowired
	private CampaignService campaignService;
	
	
	
	public void approved_go(CampaignDTO campaignDTO){
		campaignService.approved_go(campaignDTO);
	}
	
	
	
	@RequestMapping(value = "campaignDone/{support_price}/{campaign_num}/{benefit_num}", method = RequestMethod.GET)
	@ResponseBody
	public int campaignDone(@PathVariable("support_price") Integer support_price, @PathVariable("campaign_num") Integer campaign_num, @PathVariable("benefit_num") Integer benefit_num) {
		int result = 0;
		
		CampaignDTO campaignDTO = new CampaignDTO();
		
		campaignDTO.setSupport_price(support_price);
		campaignDTO.setCampaign_num(campaign_num);
		
		try {
			result = campaignService.campaignDone(campaignDTO);
			
			if(result>0) {
				result = campaignService.campaignDone2(benefit_num);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping(value = "campaignBadge/{campaign_num}", method = RequestMethod.GET)
	@ResponseBody
	public CampaignDTO campaignBadge(@PathVariable("campaign_num") Integer campaign_num) {
		CampaignDTO campaignDTO = null;
		
		try {
			campaignDTO = campaignService.campaignView(campaign_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return campaignDTO;
	}
	
	@RequestMapping(value = "campaignUp", method = RequestMethod.POST)
	public String campaignUp(Integer campaign_num) {
		int result = 0;
		
		try {
			result = campaignService.campaignUp(campaign_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "crowd_funding/campaign/campaignView?campaign_num=" + campaign_num;
	}
	
	@RequestMapping(value = "campaignDown", method = RequestMethod.POST)
	public String campaignDown(Integer campaign_num) {
		int result = 0;
		
		try {
			result = campaignService.campaignDown(campaign_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "crowd_funding/campaign/campaignView?campaign_num=" + campaign_num;
	}
	
	@RequestMapping(value = "campaignSupport", method = RequestMethod.GET)
	public void campaignSupport(Integer campaign_num, Model model) {
		model.addAttribute("campaign_num", campaign_num);
	}
	
	@RequestMapping(value = "campaignSupport", method = RequestMethod.POST)
	public String campaignSupport(SupportDTO supportDTO,Model model, HttpSession session) {
		session.setAttribute("support", supportDTO);
		CampaignDTO campaignDTO=new CampaignDTO();
		try {
			campaignDTO=campaignService.campaignView(supportDTO.getCampaign_num());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session.setAttribute("psupport", campaignDTO);
		// 경로 추가
		return "paySystem/pay24_s";
	}
	
	@RequestMapping(value = "campaignView", method = RequestMethod.GET)
	public void campaignView(Integer campaign_num, Model model) {
		CampaignDTO campaignDTO = null;
		java.util.Date date = new java.util.Date();
		List<BenefitDTO> list = null;
		
		long until_end = 0;
		
		try {
			campaignDTO = campaignService.campaignView(campaign_num);
			list = campaignService.benefitView(campaign_num);
			
			campaignDTO.setPer((int)(((double)campaignDTO.getSupport_price()/campaignDTO.getGoal_price())*100));
				
			until_end = campaignDTO.getCampaign_end().getTime() - date.getTime();
			until_end = until_end/(1000*24*60*60);
				
			campaignDTO.setUntil_end((int)until_end);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("dto", campaignDTO);
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value = "campaignCreate", method = RequestMethod.GET)
	public void campaignCreate() {
		
	}
	
	@RequestMapping(value = "campaignList", method = RequestMethod.GET)
	public void campaignList(Model model) {
		int totalCount = 0;
		
		try {
			totalCount = campaignService.campaignCount();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("totalCount", totalCount);
	}
	
	@RequestMapping(value = "getCampaignList", method = RequestMethod.POST)
	public void campaignList(Integer curPage, String dual, Model model) {
		List<CampaignDTO> list = new ArrayList<CampaignDTO>();
		ListInfo listInfo = new ListInfo();
		java.util.Date date = new java.util.Date();
		
		long until_end = 0;
		
		listInfo.setCurPage(curPage);
		
		try {
			if(dual.equals("")) {
				list = campaignService.campaignList(listInfo);				
			} else if(dual.equals("many_support")) {
				list = campaignService.campaignList2(listInfo);
			} else if(dual.equals("many_price")) {
				list = campaignService.campaignList3(listInfo);
			} else if(dual.equals("soon_end")) {
				list = campaignService.campaignList4(listInfo);
			} else {
				list = campaignService.campaignList5(listInfo);
			}

			for(CampaignDTO dto: list) {
				dto.setPer((int)(((double)dto.getSupport_price()/dto.getGoal_price())*100));
				
				until_end = dto.getCampaign_end().getTime() - date.getTime();
				until_end = until_end/(1000*24*60*60);
				
				dto.setUntil_end((int)until_end);
			}
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("list", list);
	}
	
/*	@RequestMapping(value = "campaignPermit", method = RequestMethod.POST)
	public String campaignPermit(Integer curPage, Model model) {
		List<CampaignDTO> list = new ArrayList<CampaignDTO>();
		ListInfo listInfo = new ListInfo();
		
		int totalCount = 0;
		
		listInfo.setCurPage(curPage);
		
		try {
			totalCount = campaignService.campaignCount();

			listInfo.makePage(totalCount);
			listInfo.setRow();
			
			list = campaignService.campaignPermit(listInfo);
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("list", list);
		model.addAttribute("listInfo", listInfo);
		
		return "admin/admin_hi/admin_Request_hi_1";
	}*/
	//이거 경로도 달라졋긴한데 음...ㅠㅠ
	@RequestMapping(value = "campaignPermit", method = RequestMethod.POST)
	public String campaignPermit(Integer curPage, Model model) {
		List<CampaignDTO> list = new ArrayList<CampaignDTO>();
		ListInfo listInfo = new ListInfo();
		
		int totalCount = 0;
		
		listInfo.setCurPage(curPage);
		
		try {
			totalCount = campaignService.campaignCount();

			listInfo.makePage(totalCount);
			listInfo.setRow();
			
			list = campaignService.campaignList6(listInfo);
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("list", list);
		model.addAttribute("listInfo", listInfo);
		
		return "admin/admin_Request_hi_1";
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
		campaignDTO.setStory(campaignDTO.getStory().replace("\r\n", "<br>"));
		
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
