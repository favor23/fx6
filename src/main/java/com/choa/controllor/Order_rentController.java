package com.choa.controllor;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.choa.order_rent.Order_rentDTO;
import com.choa.order_rent.Order_rentService;
import com.choa.util.ListInfo;

@Controller
@RequestMapping(value="/board/order_rent/**")
public class Order_rentController {
	
	@Autowired
	private Order_rentService order_rentService;
	
	@RequestMapping(value="orderList", method=RequestMethod.GET)
	public String orderList(Model model, ListInfo listInfo){
		
		List<Order_rentDTO> ar = null;
		
		
		try {
			ar= order_rentService.orderList(listInfo);
			model.addAttribute("list", ar);
			model.addAttribute("listInfo", listInfo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "board/order_rent/orderList";
	}
	
	
	
	@RequestMapping(value="order_rentInsert", method=RequestMethod.POST)
	public String order_rentInsert(Order_rentDTO order_rentDTO, Model model){
		
		int result = 0;
		String message ="요청을 실패했습니다.";
		
		try {
			result = order_rentService.order_rentInsert(order_rentDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(result>0){
			message="요청을 완료했습니다.";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("path", "../../index");
		
		return "commons/result";
		
	}
	@RequestMapping(value="order_rentList", method=RequestMethod.GET)
	public String order_rentList(@RequestParam ArrayList<Integer> checkOne, Model model){
		
		
		int result = 0;
		List<Order_rentDTO> list= new ArrayList<Order_rentDTO>();
		String message = null;
		Order_rentDTO order_rentDTO = null;
		
		try {
			for(Integer num : checkOne){
			order_rentDTO = order_rentService.order_rentList(num);
			list.add(order_rentDTO);
			order_rentService.order_rentDelete(num);
			
			}
			
			for(Order_rentDTO dto : list){
				result =order_rentService.order_rentInsert(order_rentDTO);
			}
			
		
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		message = "요청을 실패했습니다 관리자에게 문의해주세요.";
		
		if(result>0){
			message="요청을 성공했습니다. 자세한 사항은 물품 요청 내역을 확인해주세요.";
			
		}
		
		model.addAttribute("message", message);
		model.addAttribute("path", "../cart/cartList");
		
		return "commons/result";
		
		
		
		
	}
}
