package com.skilldistillery.upstream.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.upstream.data.AdminDAOImpl;
import com.skilldistillery.upstream.data.UpStreamDAO;
import com.skilldistillery.upstream.entities.Content;
import com.skilldistillery.upstream.entities.User;

@Controller
public class AdminController {

	@Autowired
	private UpStreamDAO dao;
	
	@Autowired
	private AdminDAOImpl adao;
	
	@RequestMapping(path = "createContent.do", method = RequestMethod.POST)
	public ModelAndView createContent(Content content) {
		ModelAndView mv = new ModelAndView();
		Content addContent = dao.createContent(content);
			mv.addObject("content", addContent);
			mv.setViewName("WEB-INF/profile.jsp");
		return mv;
	}
	
	@RequestMapping(path = "peekaboo.do", method = RequestMethod.POST)
	public ModelAndView getUserList() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("userList", adao.getUsers());
		mv.setViewName("seeUsers");
		return mv;
	}
	
	@RequestMapping(path = "seeUserComments.do", method = RequestMethod.GET)
	public ModelAndView getUserComments(int id) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("userName", adao.getUser(id).get(0));
		mv.addObject("userRatings", adao.getReviews(id));
		mv.setViewName("userRatings");
		return mv;
	}
	
	
	@RequestMapping(path = "deleteUserFromAdmin.do", method = RequestMethod.GET)
	public ModelAndView goToDeleteUser(int userId) {
		ModelAndView mv = new ModelAndView();
		boolean userDeleted = dao.disableUserFromAdmin(userId);
		mv.addObject("userList", adao.getUsers());
		mv.setViewName("seeUsers");
		return mv;
	}
	
	@RequestMapping(path = "enableUserFromAdmin.do", method = RequestMethod.GET)
	public ModelAndView goToEnableUser(int userId) {
		ModelAndView mv = new ModelAndView();
		boolean userUpdated = dao.enableUserFromAdmin(userId);
		mv.addObject("userList", adao.getUsers());
		mv.setViewName("seeUsers");
		return mv;
	}
	
}
