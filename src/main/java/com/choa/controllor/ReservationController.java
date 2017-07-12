package com.choa.controllor;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/reservation")
public class ReservationController {

	@RequestMapping(value="reservation_ticket")
	public void reservation_ticket(){
		
	}
}
