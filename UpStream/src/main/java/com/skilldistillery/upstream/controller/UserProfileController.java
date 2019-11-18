package com.skilldistillery.upstream.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.upstream.data.UpStreamDAO;
import com.skilldistillery.upstream.entities.User;

@Controller
public class UserProfileController {
	
	@Autowired UpStreamDAO USdao;
	
	@RequestMapping(path= "goProfile.do", method=RequestMethod.GET)
	public String userProfile(@Valid User user, Model model, HttpSession session) {
		User activeUser = (User) session.getAttribute("user");
		model.addAttribute("user", activeUser);
		model.addAttribute("userService", USdao.getUserServices(activeUser));
		model.addAttribute("userContent", USdao.getUserContent(activeUser.getId()));


		return "profile";
		
		
		
	}
	

}
