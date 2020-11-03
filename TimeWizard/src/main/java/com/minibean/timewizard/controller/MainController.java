package com.minibean.timewizard.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.minibean.timewizard.model.biz.UserInfoBiz;
import com.minibean.timewizard.model.dto.UserInfoDto;

@Controller
public class MainController {
	
	@Autowired
	private UserInfoBiz userInfoBiz;
	private Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value="/main")
	public String PlainMain(HttpSession session) {
		logger.info(">> [CONTROLLER-MAIN] move to main page");
//		return "finalactionpage";
		UserInfoDto dto = (UserInfoDto) session.getAttribute("login");
		String user_distinct = dto.getUser_distinct();
		UserInfoDto linked = userInfoBiz.selectOne(user_distinct);
		session.setAttribute("linked", linked);
		return "redirect:/user/"+user_distinct;
	}
	
	/* 이부분을 줄일 수 있으면 좋을 듯...? */
	
	@RequestMapping(value="/user/{user_distinct}")
	public String Main(@PathVariable String user_distinct, HttpSession session, Model model) {
		logger.info(">> [CONTROLLER-MAIN] move to (personal) page");
		
		UserInfoDto linked = userInfoBiz.selectOne(user_distinct);
		session.setAttribute("linked", linked);
		return "finalactionpage";
	}
	
	@RequestMapping(value = "/tiwimap", method = RequestMethod.GET)
	public String tiwiMap(Model model) {
		
		return "tiwimap";
	}
	
	@RequestMapping(value = "/kakaomes", method = RequestMethod.GET)
	public String kakaoShare(Model model) {
		
		return "kakaoshare";
	}

}
