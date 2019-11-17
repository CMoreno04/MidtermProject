package com.skilldistillery.upstream.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.upstream.data.UpStreamDAO;

public class UserProfileController {
	
	@Autowired UpStreamDAO usDAO;
	
	@RequestMapping(path= "goProfile.do", method=RequestMethod.GET)
	public ModelAndView userProfile(Model model, HttpSession session) {
		
		
		
		return null;
		
	}
	

}
