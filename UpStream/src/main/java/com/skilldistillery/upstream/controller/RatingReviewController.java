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
		double total = 0;
		int i = 0;
		for (i = 0; i < content.getRatingReviews().size(); i++) {
			total += content.getRatingReviews().get(i).getRating();
		}
		if (i != 0) {
			mv.addObject("average", total / i);
		} else {
			mv.addObject("average", "Content has not been rated yet.");
		}
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
		mv.addObject("review", rating);
		mv.setViewName("contentpage");
		return mv;
	}

	
	@RequestMapping(path = "updateReview.do", params = {"contentId", "updateById"}, method = RequestMethod.POST)
	public ModelAndView updateReview(@RequestParam("contentId") int contentId, int updateById, RatingReview rev, User user, HttpSession session) {
		rev.setContent(usDAO.getContent(contentId));
		
		ModelAndView mv = new ModelAndView();
		
		RatingReview forundReview = dao.updateReview(updateById, rev);
		
		// need to fix to update when page is refreshed and all content is deleted.  maybe via a dao and sql.
		Content content = usDAO.getContent(contentId);
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
		mv.setViewName("contentpage");
		return mv;
	}
	
	
	
	@RequestMapping(path = "deleteReview.do", params = {"contentId", "revId"}, method = RequestMethod.POST)
	public ModelAndView deleteReview(@RequestParam("contentId") int contentId, int revId, User user, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Content content = usDAO.getContent(contentId);
		dao.deleteReview(revId);
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
		mv.setViewName("contentpage");
		return mv;
	}
}
