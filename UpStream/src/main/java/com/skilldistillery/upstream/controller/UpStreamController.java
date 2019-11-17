package com.skilldistillery.upstream.controller;

import java.util.ArrayList;
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

import com.skilldistillery.upstream.data.UpStreamDAO;
import com.skilldistillery.upstream.entities.Content;
import com.skilldistillery.upstream.entities.RatingReview;
import com.skilldistillery.upstream.entities.StreamService;
import com.skilldistillery.upstream.entities.User;

@Controller
public class UpStreamController {

	@Autowired
	private UpStreamDAO dao; 

	@RequestMapping(path = {"/", "index.do"})
	public String getFilm(Model model) {		
		List<Content> content = null;
		List<StreamService> services = dao.getServices();
		List<List<Content>> contentByService = new ArrayList<List<Content>>();
		for (StreamService streamService : services) {
			content = dao.getTopContent(streamService.getId());
			contentByService.add(content);
		}
		model.addAttribute("services", contentByService);
		model.addAttribute("serviceType", services);
		return "index";
	}
	
	@RequestMapping(path = "getService.do", method = RequestMethod.GET) 
	public ModelAndView getService(int id) {
		ModelAndView mv = new ModelAndView();
		StreamService serv = dao.getService(id);	
		List<Content> content = null;
		List<StreamService> services = dao.getServices();
		List<List<Content>> contentByService = new ArrayList<List<Content>>();
		for (StreamService streamService : services) {
			content = dao.getTopContent(streamService.getId());
			contentByService.add(content);
		}
		mv.addObject("content", contentByService);
		mv.addObject("serv", serv);
		mv.setViewName("service");
		return mv;
	}
	

	@RequestMapping(path = "topContByServ.do", method = RequestMethod.GET)
	public ModelAndView getContentByRating(int id) {		
		ModelAndView mv = new ModelAndView();
		List<RatingReview> topContent= dao.getTopRatedByService(id);		
		mv.addObject("content", topContent);
		mv.setViewName("ratingsort");
		return mv;
	}
	
	@RequestMapping( path = "login", method = RequestMethod.GET)
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
//		mv.addObject("user", loggedInUser);
		
		mv.setViewName("profile");
	
		return mv;
		
	}
	@RequestMapping(path = "register.do", method = RequestMethod.GET)
	public String createPlayerForm(User user) {

		return "register";
	}

}
