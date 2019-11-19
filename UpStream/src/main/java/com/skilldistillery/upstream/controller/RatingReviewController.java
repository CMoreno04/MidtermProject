package com.skilldistillery.upstream.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.upstream.data.RatingReviewDAO;
import com.skilldistillery.upstream.data.UpStreamDAO;
import com.skilldistillery.upstream.entities.Content;
import com.skilldistillery.upstream.entities.RatingReview;
import com.skilldistillery.upstream.entities.User;
import com.skilldistillery.upstream.entities.UserContent;

@Controller
public class RatingReviewController {

	@Autowired
	private RatingReviewDAO dao;

	@Autowired
	private UpStreamDAO usDAO;

	@RequestMapping(path = "createReview.do", params = "contentId", method = RequestMethod.POST)
	public ModelAndView createReview(@RequestParam("contentId") int contentId, RatingReview rating, User user, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		rating.setContent(usDAO.getContent(contentId));
		Content content = usDAO.getContent(contentId);
		RatingReview createRev = dao.createReview(rating);
		rating.getContent();
		if (user != null) {
			User activeUser = (User) session.getAttribute("user");
			mv.addObject("user", activeUser);
			if (activeUser != null) {
				mv.addObject("userService", usDAO.getUserServices(activeUser));
				mv.addObject("userContent", usDAO.getUserContent(activeUser.getId()));
				if (dao.getRatingByUserId(activeUser.getId(), content.getId()).size() != 0) {
					mv.addObject("userreview", dao.getRatingByUserId(activeUser.getId(), content.getId()).get(0));
				}
			}
		} else {}
		mv.addObject("reviews", dao.getTopRatedByContentId(contentId));
		mv.addObject("contents", content);
		mv.addObject("averageRating", dao.getAverageRating(content.getId()).get(0));
		mv.setViewName("contentpage");
		return mv;
	}

	
	@RequestMapping(path = "updateReview.do", params = {"contentId", "updateById"}, method = RequestMethod.POST)
	public ModelAndView updateReview(@RequestParam("contentId") int contentId, int updateById, RatingReview rev, User user, HttpSession session) {
		rev.setContent(usDAO.getContent(contentId));
		ModelAndView mv = new ModelAndView();
		RatingReview forundReview = dao.updateReview(updateById, rev);
		Content content = usDAO.getContent(contentId);
		List<RatingReview> reviews = dao.getTopRatedByContentId(content.getId());
		if (user != null) {
			User activeUser = (User) session.getAttribute("user");
			mv.addObject("user", activeUser);
			if (activeUser != null) {
				mv.addObject("userService", usDAO.getUserServices(activeUser));
				mv.addObject("userContent", usDAO.getUserContent(activeUser.getId()));
				if (dao.getRatingByUserId(activeUser.getId(), content.getId()).size() != 0) {
					mv.addObject("userreview", dao.getRatingByUserId(activeUser.getId(), content.getId()).get(0));
				}
			}
		} else {}
		mv.addObject("reviews", reviews);
		mv.addObject("contents", content);
		mv.addObject("averageRating", dao.getAverageRating(content.getId()).get(0));
		mv.setViewName("contentpage");
		return mv;
	}
	
	@RequestMapping(path = "updateReviewFromProf.do", params = {"contentId", "updateById"}, method = RequestMethod.POST)
	public ModelAndView updateReviewFromProfile(@RequestParam("contentId") int contentId, int updateById, RatingReview rev, User user, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User activeUser = (User) session.getAttribute("user");
		try {
			rev.setContent(usDAO.getContent(contentId));
			RatingReview forundReview = dao.updateReview(updateById, rev);
			Content content = usDAO.getContent(contentId);
			mv.addObject("user", activeUser);
			mv.addObject("userService", usDAO.getUserServices(activeUser));
			mv.addObject("userContent", usDAO.getUserContent(activeUser.getId()));
			mv.addObject("reviews", usDAO.getReviewsOfUserByUserId(activeUser.getId()));
			mv.addObject("servTotal", usDAO.getTotalOfServicesByUser(activeUser.getId()));
			mv.setViewName("profile");
			return mv;
		} 
		catch (Exception e) {
			mv.addObject("user", activeUser);
			mv.addObject("userService", usDAO.getUserServices(activeUser));
			mv.addObject("userContent", usDAO.getUserContent(activeUser.getId()));
			mv.addObject("reviews", usDAO.getReviewsOfUserByUserId(activeUser.getId()));
			mv.addObject("servTotal", usDAO.getTotalOfServicesByUser(activeUser.getId()));
			mv.setViewName("profile");
			return mv;
		} 
	}
	
	
	
	
	@RequestMapping(path = "deleteReview.do", params = {"contentId", "revId"}, method = RequestMethod.POST)
	public ModelAndView deleteReview(@RequestParam("contentId") int contentId, int revId, User user, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Content content = usDAO.getContent(contentId);
		
		dao.deleteReview(revId);
		List<RatingReview> reviews = dao.getTopRatedByContentId(content.getId());
		
		if (user != null) {
			User activeUser = (User) session.getAttribute("user");
			mv.addObject("user", activeUser);
			if (activeUser != null) {
				mv.addObject("userService", usDAO.getUserServices(activeUser));
				mv.addObject("userContent", usDAO.getUserContent(activeUser.getId()));
				if (dao.getRatingByUserId(activeUser.getId(), content.getId()).size() != 0) {
					mv.addObject("userreview", dao.getRatingByUserId(activeUser.getId(), content.getId()).get(0));
				}
			}
		} else {}
		mv.addObject("reviews", reviews);
		mv.addObject("contents", content);
		mv.addObject("averageRating", dao.getAverageRating(content.getId()).get(0));
		mv.setViewName("contentpage");
		return mv;
	}
	
	@RequestMapping(path = "deleteReviewFromProfile.do", params = {"contentId", "revId"}, method = RequestMethod.POST)
	public ModelAndView deleteReviewFromProfile(@RequestParam("contentId") int contentId, int revId, User user, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User activeUser = (User) session.getAttribute("user");
		try {
		Content content = usDAO.getContent(contentId);
		dao.deleteReview(revId);		
		mv.addObject("user", activeUser);
		mv.addObject("userService", usDAO.getUserServices(activeUser));
		mv.addObject("userContent", usDAO.getUserContent(activeUser.getId()));
		mv.addObject("reviews", usDAO.getReviewsOfUserByUserId(activeUser.getId()));
		mv.addObject("servTotal", usDAO.getTotalOfServicesByUser(activeUser.getId()));
		mv.setViewName("profile");
		return mv;
		}
		catch (Exception e) {
			mv.addObject("user", activeUser);
			mv.addObject("userService", usDAO.getUserServices(activeUser));
			mv.addObject("userContent", usDAO.getUserContent(activeUser.getId()));
			mv.addObject("reviews", usDAO.getReviewsOfUserByUserId(activeUser.getId()));
			mv.addObject("servTotal", usDAO.getTotalOfServicesByUser(activeUser.getId()));
			mv.setViewName("profile");
			return mv;
		}
	}
	
//	@RequestMapping(path = "addToUserContent.do", params = "contentId", method = RequestMethod.POST)
//	public ModelAndView addContentToUser(@RequestParam("contentId") int contentId, User user, HttpSession session) {
//		User activeUser = (User) session.getAttribute("user");
//		//activeUser.getUserCont().add(usDAO.getContent(contentId));
//
//	}

}
