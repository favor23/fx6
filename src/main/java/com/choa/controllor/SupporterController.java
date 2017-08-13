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
}
