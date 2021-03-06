package com.skilldistillery.upstream.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.upstream.data.RegisterDAO;
import com.skilldistillery.upstream.data.UpStreamDAO;
import com.skilldistillery.upstream.data.UserProfileDao;
import com.skilldistillery.upstream.entities.User;
import com.skilldistillery.upstream.entities.UserImage;

@Controller
public class UserProfileController {

	@Autowired
	UpStreamDAO USdao;
	@Autowired
	RegisterDAO rdao;

	@Autowired
	UserProfileDao updao;

	@RequestMapping(path = "goProfile.do", method = RequestMethod.GET)
	public String userProfile(@Valid User user, Model model, HttpSession session) {
		User activeUser = (User) session.getAttribute("user");
		model.addAttribute("user", activeUser);
		model.addAttribute("userService", USdao.getUserServices(activeUser));
		model.addAttribute("userContent", USdao.getUserContent(activeUser.getId()));
		model.addAttribute("reviews", USdao.getReviewsOfUserByUserId(activeUser.getId()));
		model.addAttribute("servTotal", USdao.getTotalOfServicesByUser(activeUser.getId()));
		return "profile";

	}

	@RequestMapping(path = "updateProfilePic.do", method = RequestMethod.GET)
	public ModelAndView goToUpdateProfilePic(@Valid User user, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User oldUser = (User) session.getAttribute("user");
		UserImage ui = new UserImage();
		mv.addObject("user", oldUser);
		mv.addObject("userImage", ui);
		mv.setViewName("updatePicture");
		return mv;
	}
	
	@RequestMapping(path = "updateProfilePic.do", method = RequestMethod.POST)
	public ModelAndView updateProfilePic(@Valid UserImage ui, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		UserImage newImg = updao.getImageById(ui.getId());
		User user = (User) session.getAttribute("user");
//		updatedUser.setUserImage(newImg);
		User updatedUser = updao.addUserProfilePic(user.getId(), newImg.getId());
		session.removeAttribute("user");
		session.setAttribute("user", updatedUser);
		mv.addObject("reviews", USdao.getReviewsOfUserByUserId(updatedUser.getId()));
		mv.addObject("user", updatedUser);
		mv.addObject("servTotal", USdao.getTotalOfServicesByUser(updatedUser.getId()));
		mv.setViewName("profile");
		mv.addObject("userService", USdao.getUserServices(updatedUser));
		mv.addObject("userContent", USdao.getUserContent(updatedUser.getId()));
		return mv;
	}
	
	@RequestMapping(path = "goToUpdateUser.do", method = RequestMethod.GET)
	public ModelAndView goToUpdateUser(@Valid User user, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User oldUser = (User) session.getAttribute("user");
		mv.addObject("user", oldUser);
//        System.out.println("UserProfileControler.goToUpdateActor(): " + oldUser);
		mv.setViewName("updateUser");
		return mv;
	}

	@RequestMapping(path = "updateUser.do", params = "username", method = RequestMethod.POST)
	public ModelAndView updateUser(@Valid User user, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User updatedUser = rdao.updateUser(user);
//	        if (!user.equals(updatedUser)) {
//	            mv.setViewName("updateUser");
//	        } else {
		session.removeAttribute("user");
		session.setAttribute("user", updatedUser);
		mv.addObject("reviews", USdao.getReviewsOfUserByUserId(updatedUser.getId()));
		mv.addObject("user", updatedUser);
		mv.addObject("servTotal", USdao.getTotalOfServicesByUser(updatedUser.getId()));
		mv.setViewName("profile");
		mv.addObject("userService", USdao.getUserServices(updatedUser));
		mv.addObject("userContent", USdao.getUserContent(updatedUser.getId()));

//	        }
		return mv;
	}

	@RequestMapping(path = "deleteUser.do", method = RequestMethod.GET)
	public ModelAndView goToDeleteUser(@Valid User user, HttpSession session, Model model) {

		ModelAndView mv = new ModelAndView();

		User oldUser = (User) session.getAttribute("user");
		boolean userDeleted = USdao.disableUser(oldUser);

		if (userDeleted) {

			session.setAttribute("user", null);
			model.addAttribute("user", null);

			mv.setViewName("deleteUser");

		}

		else {
			mv.setViewName("index");
		}
		return mv;
	}

	@RequestMapping(path = "deleteService.do", params = "servId", method = RequestMethod.POST)
	public String userDeleteService(@Valid User user, int servId, Model model, HttpSession session) {
		User activeUser = (User) session.getAttribute("user");
		USdao.removeUserService(((int) activeUser.getId()), servId);

		activeUser.setUserService(USdao.getUserServicesByUserId(((int) activeUser.getId())));

		session.setAttribute("user", activeUser);

		model.addAttribute("user", activeUser);
		model.addAttribute("userService", USdao.getUserServices(activeUser));
		model.addAttribute("userContent", USdao.getUserContent(activeUser.getId()));
		model.addAttribute("reviews", USdao.getReviewsOfUserByUserId(activeUser.getId()));
		model.addAttribute("servTotal", USdao.getTotalOfServicesByUser(activeUser.getId()));
		return "profile";
	}

	@RequestMapping(path = "deleteContent.do", params = { "contentId", "servId" }, method = RequestMethod.POST)
	public String userDeleteContent(@Valid User user, int servId, int contentId, Model model, HttpSession session) {
		User activeUser = (User) session.getAttribute("user");

		USdao.removeUserContent(((int) activeUser.getId()), contentId);

		activeUser.setUserService(USdao.getUserServicesByUserId(((int) activeUser.getId())));

		session.setAttribute("user", activeUser);

		model.addAttribute("user", activeUser);
		model.addAttribute("userService", USdao.getUserServices(activeUser));
		model.addAttribute("userContent", USdao.getUserContent(activeUser.getId()));
		model.addAttribute("reviews", USdao.getReviewsOfUserByUserId(activeUser.getId()));
		model.addAttribute("servTotal", USdao.getTotalOfServicesByUser(activeUser.getId()));
		return "profile";
	}

}