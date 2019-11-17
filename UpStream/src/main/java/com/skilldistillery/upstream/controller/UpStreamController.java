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
		List<Double> rev = new ArrayList<Double>();
		int i = 0;
		double total = 0;
		for (int j = 0; j < content.size(); j++) {
//			List<RatingReview> rr = content.get(j).getRatingReviews();
			for (i = 0; i < content.get(j).getRatingReviews().size(); i++) {
				total += content.get(j).getRatingReviews().get(i).getRating();
			}
			if (j != 0) {
				rev.add(total/j);
			} else {
				rev.add(0.0);
			}
		}
		mv.addObject("rating", contentByService);
		
		mv.addObject("content", contentByService);
		mv.addObject("serv", serv);
		mv.setViewName("service");
		return mv;
	}
	

	@RequestMapping(path = "topContByServ.do", method = RequestMethod.GET)
	public ModelAndView getContentByRating(int id) {		
		ModelAndView mv = new ModelAndView();
		Content content = null;
		List<StreamService> services = dao.getServices();
		List<RatingReview> contentByService = new ArrayList<RatingReview>();
		List<List<Content>> contents = new ArrayList<List<Content>>();
		List<Content> conts = new ArrayList<Content>();
	
		for (int i = 0; i < services.size(); i++) {
			
			contentByService = dao.getTopRatedByService(services.get(i).getId());
			
			for (RatingReview review: contentByService) {
				content = review.getContent();
				conts.add(content);
			}
			contents.add(conts);
		}
		mv.addObject("services", contents);
		mv.addObject("serviceType", services);
		mv.setViewName("ratingsort");
		return mv;
		}
	
	
	/// NEW STRETCH GOAL ONLY HAVE SO MANY "REVIEWS" ON ONE PAGE BEFORE HAVING TO CLICK A NEXT BUTTON
	//THIS WAS DONE IN THE SESSIONS LABS
	@RequestMapping(path = "getContents.do", method = RequestMethod.GET)
	public ModelAndView getContents(int id) {
		ModelAndView mv = new ModelAndView();
		Content content = dao.getContent(id);
		double total = 0;
		int i = 0;
		for (i = 0; i < content.getRatingReviews().size(); i++) {
			total += content.getRatingReviews().get(i).getRating();
		}
		if (i != 0) {
			mv.addObject("average", total/i);
		} else {
			mv.addObject("average", "Content has not been rated yet.");
		}
		
		List<RatingReview> reviews = content.getRatingReviews();
		
		mv.addObject("reviews", reviews);
		mv.addObject("contents", content);
		mv.setViewName("contentpage");
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
	
	@RequestMapping(path = "registration.do", method = RequestMethod.GET)
	public String registerNewUser(User user) {

		return "register";
	}

}
