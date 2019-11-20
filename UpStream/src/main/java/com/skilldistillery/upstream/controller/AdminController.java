package com.skilldistillery.upstream.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.upstream.data.UpStreamDAO;
import com.skilldistillery.upstream.entities.Content;

@Controller
public class AdminController {

	@Autowired
	private UpStreamDAO dao;
	
	@RequestMapping(path = "createContent.do", method = RequestMethod.POST)
	public ModelAndView createContent(Content content) {
		ModelAndView mv = new ModelAndView();
		Content addContent = dao.createContent(content);
			mv.addObject("content", addContent);
			mv.setViewName("WEB-INF/profile.jsp");
		return mv;
	}
}
