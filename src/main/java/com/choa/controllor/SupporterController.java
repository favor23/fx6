package com.choa.controllor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choa.supporter.SupporterDTO;
import com.choa.supporter.SupporterService;

@Controller
public class SupporterController {
	@Autowired
	private SupporterService supporterService;
	
	@RequestMapping(value = "/supporter/supporterList/{campaign_num}", method = RequestMethod.GET)
	@ResponseBody
	public List<SupporterDTO> supporterList(@PathVariable("campaign_num") Integer campaign_num, Model model) {
		List<SupporterDTO> list = null;
		
		try {
			list = supporterService.supporterList(campaign_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	@RequestMapping(value = "/supporter/supporterWrite/{id}/{name}/{campaign_num}/{support_price}/{benefit_num}/{email}/{benefit_title}", method = RequestMethod.GET)
	public int supporterWrite(@PathVariable("id") String id, @PathVariable("name") String name, @PathVariable("campaign_num") Integer campaign_num, @PathVariable("support_price") Integer support_price, @PathVariable("benefit_num") Integer benefit_num, @PathVariable("email") String email, @PathVariable("benefit_title") String benefit_title) {
		int result = 0;
		
		SupporterDTO supporterDTO = new SupporterDTO();
		
		supporterDTO.setId(id);
		supporterDTO.setName(name);
		supporterDTO.setCampaign_num(campaign_num);
		supporterDTO.setSupport_price(support_price);
		supporterDTO.setBenefit_num(benefit_num);
		supporterDTO.setEmail(email);
		supporterDTO.setBenefit_title(benefit_title);
		System.out.println(supporterDTO.getSupport_price());
		System.out.println(supporterDTO.getEmail());
		try {
			result = supporterService.supporterWrite(supporterDTO);
			System.out.println(result+"==");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
}
