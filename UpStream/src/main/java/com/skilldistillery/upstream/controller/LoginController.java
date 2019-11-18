package com.skilldistillery.upstream.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.upstream.data.LoginDAO;
import com.skilldistillery.upstream.data.UpStreamDAO;
import com.skilldistillery.upstream.entities.User;

@Controller
public class LoginController {

	@Autowired
	private LoginDAO dao;

	@Autowired
	private UpStreamDAO USdao;

	@RequestMapping(path = "login.do", method = RequestMethod.GET)
	public String login(User user, Model model, HttpSession session) {

		model.addAttribute("user", user);

		return "login";

	}

	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public String logindo(User user, HttpSession session, Model model) {
		
		user = dao.findUserByUsernameAndPassword(user.getUsername(), user.getPassword());
		
		if (dao.checkIsUniqueUser(user)) {

			session.setAttribute("user", user);
			
			model.addAttribute("user", user);
			model.addAttribute("userService", USdao.getUserServices(user));
			model.addAttribute("userContent", USdao.getUserContent(user.getId()));

			return "profile";

		}

		else {

			return "login";
		}

	}

	@RequestMapping(path = "register.do", method = RequestMethod.GET)
	public String registerNewUser(User user) {

		return "registration";
	}

}
