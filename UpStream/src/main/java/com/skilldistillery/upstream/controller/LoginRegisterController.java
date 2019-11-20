package com.skilldistillery.upstream.controller;

import java.util.List;

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
import com.skilldistillery.upstream.data.UserProfileDao;
import com.skilldistillery.upstream.entities.User;
import com.skilldistillery.upstream.entities.UserImage;

@Controller
public class LoginRegisterController {

	@Autowired
	private RegisterDAO rdao;

	@Autowired
	private LoginDAO dao;

	@Autowired
	private UpStreamDAO USdao;
	@Autowired
	private UserProfileDao upDao;

	@RequestMapping(path = "login.do", method = RequestMethod.GET)
	public ModelAndView login() {
		User user = new User();
		ModelAndView mv = new ModelAndView();
		mv.addObject("user", user);
		mv.setViewName("login");

		return mv;

	}

	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public String logindo(@Valid User user, HttpSession session, Model model, Errors error) {

		user = dao.findUserByUsernameAndPassword(user.getUsername(), user.getPassword());

		session.setAttribute("user", user);

		if (rdao.checkIsUniqueUser(user)) {
			System.out.println("IF");

			if (user == null) {
				user = null;
				session.removeAttribute("user");

				model.addAttribute("user", new User());
				model.addAttribute("message", "Invalid User!");

				return "login";
			}

			user = USdao.getUserById(((int) user.getId()));

			if (user.isActive() == true) {

				session.setAttribute("user", user);

				model.addAttribute("user", user);
				model.addAttribute("userService", USdao.getUserServices(user));
				model.addAttribute("userContent", USdao.getUserContent(user.getId()));
				model.addAttribute("reviews", USdao.getReviewsOfUserByUserId(user.getId()));
				model.addAttribute("servTotal", USdao.getTotalOfServicesByUser(user.getId()));

				return "profile";
			}

			else {
				session.removeAttribute("user");

				model.addAttribute("user", new User());
				model.addAttribute("message", "Invalid User!");

				return "login";

			}

		}

		else {
			user = null;
			session.removeAttribute("user");

			model.addAttribute("user", new User());
			model.addAttribute("message", "Invalid User!");

			return "login";
		}

	}

	@RequestMapping(path = "register.do", method = RequestMethod.GET)
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
			List<UserImage> imgs = upDao.getProfilePics();
			if (user == null) {
				return "redirect:register.do";
			}
			user = null;
			session.removeAttribute("user");

			model.addAttribute("user", new User());
			model.addAttribute("profileImg", imgs);
			model.addAttribute("message", "Username Already Exists!");

			return "registration";
		} else {
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
