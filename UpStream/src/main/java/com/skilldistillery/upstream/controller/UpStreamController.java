package com.skilldistillery.upstream.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UpStreamController {


	@Autowired
//	private DAO 

	@RequestMapping(path = "/")
	public String getFilm(Model model) {
		
		
		return "index";
	}
	
	@RequestMapping(path = "**.do", method = RequestMethod.GET)
	  public String get_Something() {

	    return null;
	  }
	
	
	
	
	
	
	
}
