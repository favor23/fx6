package com.choa.controllor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.choa.rent.RentDTO;
import com.choa.rent.RentService;
import com.choa.util.ListInfo;

@Controller
@RequestMapping(value="/board/rent/**")
public class RentController {

	@Autowired
	private RentService rentService;
	
	@RequestMapping(value="rentList", method=RequestMethod.GET)
	public String rentList(Model model, ListInfo listInfo){
		
		
		List<RentDTO> ar = null;
		
		try {
			ar = rentService.rentList(listInfo);
			model.addAttribute("list", ar);
			model.addAttribute("listInfo", listInfo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "board/rent/rentList";
		
	}
	
	
	@RequestMapping(value="rentListdrone", method=RequestMethod.GET)
	public String rentListdrone(Model model, ListInfo listInfo){
		
		
		List<RentDTO> ar = null;
		
		try {
			ar = rentService.rentList(listInfo);
			model.addAttribute("list", ar);
			model.addAttribute("listInfo", listInfo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "board/rent/rentListdrone";
		
	}
	
	
	@RequestMapping(value="rentView", method=RequestMethod.GET)
	public String rentView(Model model, Integer num){
		
		RentDTO rentDTO =null;
		
		try {
			rentDTO = rentService.rentView(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("view", rentDTO);
		
		
		return "board/rent/rentView";
	}
	
	
	
	
}
