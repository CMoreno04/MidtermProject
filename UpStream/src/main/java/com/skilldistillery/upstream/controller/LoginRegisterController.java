package com.skilldistillery.upstream.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.upstream.data.LoginDAO;
import com.skilldistillery.upstream.data.RegisterDAO;
import com.skilldistillery.upstream.data.UpStreamDAO;
import com.skilldistillery.upstream.entities.User;

@Controller
public class LoginRegisterController {
	
	@Autowired 
	private RegisterDAO rdao;

	@Autowired
	private LoginDAO dao;

	@Autowired
	private UpStreamDAO USdao;

	@RequestMapping(path = "login.do", method = RequestMethod.GET)
	public String login() {

		return "login";

	}

	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public String logindo(@Valid User user, HttpSession session, Model model, Errors error) {

		user = dao.findUserByUsernameAndPassword(user.getUsername(), user.getPassword());

		if (rdao.checkIsUniqueUser(user)) {

			if (user == null) {
				user = null;
				session.removeAttribute("user");
				model = null;
				return "redirect:login.do";
			}

			session.setAttribute("user", user);

			model.addAttribute("user", user);
			model.addAttribute("userService", USdao.getUserServices(user));
			model.addAttribute("userContent", USdao.getUserContent(user.getId()));
			model.addAttribute("reviews", USdao.getReviewsOfUserByUserId(user.getId()));
			return "profile";

		}

		else {
			user = null;
			session.removeAttribute("user");
			Boolean err = false;
			model.addAttribute("Error", err);
			
			return "redirect:login.do";
		}

	}
	@RequestMapping(path="register.do", method=RequestMethod.GET)
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView();
		User u = new User();
		mv.addObject("user", u);
		mv.setViewName("registration");
		return mv;
	}
	

	@RequestMapping(path = "register.do", method = RequestMethod.POST)
	public String registerNewUser(@Valid User user, HttpSession session, Model model, Errors error) {
		if (rdao.checkIsUniqueUser(user)) {
			
			if (user != null) {
				 error.rejectValue("username", "error.username", "Username already in use");
				 ((ModelAndView) model).addObject("Error", error);
				return "registration";
			}
			
			
			return "registration";
		}
		
		else {
			
			User newUser = rdao.addUser(user);
			System.out.println(user);
			System.out.println(newUser);
			session.setAttribute("user", newUser);
			model.addAttribute("user", newUser);
			model.addAttribute("userService", USdao.getUserServices(newUser));
			model.addAttribute("userContent", USdao.getUserContent(newUser.getId()));
			return "profile";
			
		}
		

	}
	@RequestMapping(path = "logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:login.do";
	}

}
