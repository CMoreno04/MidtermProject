package com.skilldistillery.upstream.controller;

import javax.servlet.http.HttpSession;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.upstream.data.LoginDAO;
import com.skilldistillery.upstream.entities.User;

@Controller
public class LoginController {
	
	@Autowired 
	private LoginDAO dao;
	
	@RequestMapping( path = "login.do", method = RequestMethod.GET)
	public ModelAndView login() {
		User u = new User();
		ModelAndView mv = new ModelAndView("login", "user", u);
		return mv;
		
	}
	
	@RequestMapping( path = "login.do", method = RequestMethod.POST)
	public ModelAndView logindo(@Valid User user, HttpSession session, Errors errors) {
		ModelAndView mv = new ModelAndView();
		User loggedInUser = dao.checkUserRegistration(user);
		
		if(loggedInUser == null) {
			errors.rejectValue("user", "error.user", "Username and/or Password do not match our system");
		}
		if (errors.getErrorCount() != 0) {
			mv.setViewName("login");
			return mv;
		}
		session.setAttribute("user", loggedInUser);
		mv.setViewName("profile");
	
		return mv;
		
	}
	
	@RequestMapping(path = "registration.do", method = RequestMethod.GET)
	public String registerNewUser(User user) {

		return "register";
	}
	


}
