package com.choa.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.choa.util.ListInfo;

@Service
public class CartService {

	@Autowired
	private CartDAO cartDAO;
	
	public int cartWrite(CartDTO cartDTO) throws Exception{
		return cartDAO.cartWrite(cartDTO);
	}
	
	public List<CartDTO> cartList(ListInfo listInfo) throws Exception{
		int result = cartDAO.cartCount(listInfo);
		listInfo.makePage(result);
		listInfo.setRow();
		
		return cartDAO.cartList(listInfo);
	}
	
	public int cartDelete(int cart_num) throws Exception{
		return cartDAO.cartDelete(cart_num);
		
	}
}
