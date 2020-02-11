package com.foodOrderingSystem.jee;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class WelcomeController {
	
	@RequestMapping(value="/welcome")
	public String welcome() {
		return "welcome";
	}
	
	@RequestMapping(value="/")
	public String index() {
		return "index";
	}
}
