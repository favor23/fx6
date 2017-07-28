package com.choa.controllor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choa.benefit.BenefitDTO;
import com.choa.benefit.BenefitService;

@Controller
@RequestMapping(value = "/crowd_funding/benefit/**")
public class BenefitController {
	@Autowired
	private BenefitService benefitService;
	
	@RequestMapping(value = "benefitWrite", method = RequestMethod.GET)
	public String benefitWrite(BenefitDTO benefitDTO, Model model) {
		int result = 0;
		String message = "혜택 등록 실패! 자세한 사항은 담당자에게 문의하세요.";
		
		try {
			result = benefitService.benefitWrite(benefitDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(result>0) {
			message = "혜택 등록 성공!";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("path", "../campaign/campaignCreateForm3");
		
		return "commons/result";
	}
	
	@RequestMapping(value = "benefitList/{campaign_num}", method = RequestMethod.GET)
	@ResponseBody
	public List<BenefitDTO> benefitList(@PathVariable("campaign_num") Integer campaign_num) {
		List<BenefitDTO> list = null;
		
		try {
			list = benefitService.benefitList(campaign_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
}
