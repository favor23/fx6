package com.choa.controllor;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/paySystem")
public class paySystemController {		
	
	
	@RequestMapping(value="g1")
	public void g1(){		
	}
	
	@RequestMapping(value="g2")
	public void g2(){		
	}	
	
	@RequestMapping(value="g4")
	public void g4(){		
	}
	@RequestMapping(value="g5")
	public void g5(){		
	}
	@RequestMapping(value="g6")
	public void g6(){		
	}
	
	@RequestMapping(value="paypost")
	public void paypost(){		
	}	
	@RequestMapping(value="paysuccess")
	public void paysucccess(){		
	}	
	@RequestMapping(value="paysuccess2")
	public void paysucccess2(){		
	}	
}
