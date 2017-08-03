package com.choa.controllor;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.choa.cart.CartDTO;
import com.choa.cart.CartService;
import com.choa.util.ListInfo;

@Controller
@RequestMapping(value="/board/cart/**")
public class CartController {
	
	
	@Autowired
	private CartService cartService;
	
	
	@RequestMapping(value="cartWrite", method=RequestMethod.POST)
	public String cartWrite(CartDTO cartDTO, Model model){
		
		
		Date startDate = cartDTO.getStart_date();
		long stStart = startDate.getTime();
		
		Date endDate = cartDTO.getEnd_date();
		long enEnd =endDate.getTime();
		
		
		long beforetotal=enEnd-stStart;
		long total_price = beforetotal/(1000*24*60*60);
		
		int date=(int)total_price;
		
		int quantity  = cartDTO.getQuantity();
		int price = cartDTO.getPrice();
		
		int total = date*quantity*price;
		
		System.out.println(total);
		cartDTO.setTotal(total);
		
		
		int result = 0;
		String message ="장바구니 담기를 실패했습니다.";
		
		
		try {
			result = cartService.cartWrite(cartDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(result>0){
			message="성공적으로 장바구니에 담았습니다.";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("path", "cartList");
		
		return "commons/result";
		
	}
	
	@RequestMapping(value="cartList", method=RequestMethod.GET)
	public String cartList(Model model, ListInfo listInfo){
		
		List<CartDTO> ar = null;
		
		
		try {
			ar = cartService.cartList(listInfo);
			model.addAttribute("cart", ar);
			model.addAttribute("listInfo", listInfo);
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "board/cart/cartList";
		
	}
	
	@RequestMapping(value="cartDelete", method=RequestMethod.GET)
	public String cartDelete(Model model, int cart_num){
		
		int result=0;
		String message=null;
		
		try {
			result = cartService.cartDelete(cart_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		message ="삭제를 완료했습니다.";
		
		if(result>0){
			message="삭제를 성공했습니다.";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("path", "cartList");
		
		return "commons/result";
	}
	
	
	@RequestMapping(value="cartDelete2", method=RequestMethod.GET)
	public String cartDelete2(@RequestParam ArrayList<Integer> checkOne, Model model){
		
		int result=0;
		String message=null;
		try {
			for(Integer cart_num : checkOne){
			result = cartService.cartDelete(cart_num);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		message ="삭제를 완료했습니다.";
		
		if(result>0){
			message="삭제를 성공했습니다.";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("path", "cartList");
		
		return "commons/result";
	}
	
	
	
}
