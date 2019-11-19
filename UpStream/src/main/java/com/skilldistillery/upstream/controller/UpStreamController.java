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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.upstream.data.RatingReviewDAO;
import com.skilldistillery.upstream.data.UpStreamDAO;
import com.skilldistillery.upstream.entities.Content;
import com.skilldistillery.upstream.entities.RatingReview;
import com.skilldistillery.upstream.entities.StreamService;
import com.skilldistillery.upstream.entities.User;

@Controller
public class UpStreamController {

	@Autowired
	private UpStreamDAO dao;

	@Autowired
	private RatingReviewDAO rrDao;

	//INDEX REQUEST MAPPING
	@RequestMapping(path = { "/", "index.do" })
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

	//BRINGS TO SERVICE PAGE WITH LIST OF FILMS/SHOWS.
	@RequestMapping(path = "getService.do", method = RequestMethod.GET)
	public ModelAndView getService(int id) {
		ModelAndView mv = new ModelAndView();
		List<Content> content = rrDao.getService(id);
		List<Double> rev = new ArrayList<Double>();
		for (Content contents : content) {
			rev.add(rrDao.getAverageRating(contents.getId()).get(0));
		}
		mv.addObject("serviceName", content.get(0).getService());
		mv.addObject("rating", rev);
		mv.addObject("content", content);
		mv.setViewName("service");
		return mv;
	}

	/// NEW STRETCH GOAL ONLY HAVE SO MANY "REVIEWS" ON ONE PAGE BEFORE HAVING TO
	/// CLICK A NEXT BUTTON
	// THIS WAS DONE IN THE SESSIONS LABS
	
	//INDIVIDUAL SHOW OR MOVIE CONTENT PAGE.
	@RequestMapping(path = "getContents.do", method = RequestMethod.GET)
	public ModelAndView getContents(User user, HttpSession session, int id) {
		ModelAndView mv = new ModelAndView();
		Content content = dao.getContent(id);
		List<RatingReview> reviews = rrDao.getTopRatedByContentId(content.getId());
		if (user != null) {
			User activeUser = (User) session.getAttribute("user");
			mv.addObject("user", activeUser);
			if (activeUser != null) {
				mv.addObject("userService", dao.getUserServices(activeUser));
				mv.addObject("userContent", dao.getUserContent(activeUser.getId()));
				if (rrDao.getRatingByUserId(activeUser.getId(), content.getId()).size() != 0) {
					mv.addObject("userreview", rrDao.getRatingByUserId(activeUser.getId(), content.getId()).get(0));
				}
			}
		} else {}
		mv.addObject("averageRating", rrDao.getAverageRating(content.getId()).get(0));
		mv.addObject("reviews", reviews);
		mv.addObject("contents", content);
		mv.setViewName("contentpage");
		return mv;
	}

	//IF USER CLICKS GET SERVICES ON MENU WILL SHOW LIST OF SERVICES WITH PRICES
	@RequestMapping(path = "getServices.do", method = RequestMethod.GET)
	public ModelAndView getServices(User user, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		List<StreamService> servs = dao.getServices();
		mv.addObject("serv", servs);
		mv.addObject("user", user);
		mv.setViewName("servicespage");
		return mv;
	}
	
	@RequestMapping(path = "addUserService.do", params = "servId", method = RequestMethod.GET)
	public ModelAndView addUserService(int servId, User user, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User activeUser = (User) session.getAttribute("user");
		
		boolean service = dao.addUserService(activeUser, servId);
		if (service) {	
			mv.addObject("user", activeUser);
			mv.addObject("userService", dao.getUserServices(activeUser));
			mv.addObject("userContent", dao.getUserContent(activeUser.getId()));
			mv.addObject("reviews", dao.getReviewsOfUserByUserId(activeUser.getId()));
			mv.setViewName("profile");
			
		} else {
			mv.addObject("user", activeUser);
			mv.addObject("userService", dao.getUserServices(activeUser));
			mv.addObject("userContent", dao.getUserContent(activeUser.getId()));
			mv.addObject("reviews", dao.getReviewsOfUserByUserId(activeUser.getId()));
			mv.setViewName("servicespage");
		}
		return mv;
		
	}
	
}