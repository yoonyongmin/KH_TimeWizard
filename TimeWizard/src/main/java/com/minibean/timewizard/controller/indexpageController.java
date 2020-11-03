package com.minibean.timewizard.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class indexpageController {
	
	private Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping("/indexpage")
	public String Indexpage() {
		logger.info("[indexpage]");
		return "indexpage";
	}

}
