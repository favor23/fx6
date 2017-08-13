package com.choa.order_rent;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.choa.util.ListInfo;

@Service
public class Order_rentService {

	@Autowired
	private Order_rentDAO order_rentDAO;
	
	public int order_rentapproved(Order_rentDTO order_rentDTO) throws Exception{
		return order_rentDAO.order_rentapproved(order_rentDTO);
	}
	
	public int order_rentInsert(Order_rentDTO order_rentDTO) throws Exception{
		return order_rentDAO.order_rentInsert(order_rentDTO);
	}
	
	public Order_rentDTO order_rentList(Integer num) throws Exception{
		return order_rentDAO.order_rentList(num);
	}
	
	public int order_rentDelete(int num) throws Exception{
		return order_rentDAO.order_rentDelete(num);
	}
	
	public List<Order_rentDTO> orderList(ListInfo listInfo) throws Exception{
		int result = order_rentDAO.order_rentCount(listInfo);
		listInfo.makePage(result);
		listInfo.setRow();
		
		return order_rentDAO.orderList(listInfo);
	}
}
