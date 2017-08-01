package com.choa.benefit;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BenefitService {
	@Autowired
	private BenefitDAO benefitDAO;
	
	public int benefitWrite(BenefitDTO benefitDTO) throws Exception {
		return benefitDAO.benefitWrite(benefitDTO);
	}
	
	public List<BenefitDTO> benefitList(int campaign_num) throws Exception {
		return benefitDAO.benefitList(campaign_num);
	}
	
	public int benefitCount(int campaign_num) throws Exception {
		return benefitDAO.benefitCount(campaign_num);
	}
	
	public int benefitDelete(int benefit_num) throws Exception {
		return benefitDAO.benefitDelete(benefit_num);
	}
}
