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
import com.skilldistillery.upstream.entities.User;

@Controller
public class UserProfileController {
	
	@Autowired UpStreamDAO USdao;
	@Autowired RegisterDAO rdao;
	
	@RequestMapping(path= "goProfile.do", method=RequestMethod.GET)
	public String userProfile(@Valid User user, Model model, HttpSession session) {
		User activeUser = (User) session.getAttribute("user");
		model.addAttribute("user", activeUser);
		model.addAttribute("userService", USdao.getUserServices(activeUser));
		model.addAttribute("userContent", USdao.getUserContent(activeUser.getId()));

		return "profile";
		
		
	}
    @RequestMapping(path = "goToUpdateUser.do", method = RequestMethod.GET)
    public ModelAndView goToUpdateActor(@Valid User user, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        User oldUser = (User) session.getAttribute("user");
        mv.addObject("user", oldUser);
//        System.out.println("UserProfileControler.goToUpdateActor(): " + oldUser);
        mv.setViewName("updateUser");
        return mv;
    }
	
	 @RequestMapping(path = "updateUser.do", params = "username", method = RequestMethod.POST)
	    public ModelAndView updateActor(@Valid User user, HttpSession session) {
	        ModelAndView mv = new ModelAndView();
	        User updatedUser = rdao.updateUser(user);
//	        if (!user.equals(updatedUser)) {
//	            mv.setViewName("updateUser");
//	        } else {
	        	session.removeAttribute("user");
	        	session.setAttribute("user", updatedUser);
	            mv.addObject("user", updatedUser);
	            mv.setViewName("profile");
	        	mv.addObject("userService", USdao.getUserServices(updatedUser));
				mv.addObject("userContent", USdao.getUserContent(updatedUser.getId()));

//	        }
	        return mv;
	    }

}
