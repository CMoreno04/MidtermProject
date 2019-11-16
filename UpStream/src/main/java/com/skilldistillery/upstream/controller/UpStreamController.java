package com.skilldistillery.upstream.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.upstream.data.UpStreamDAO;

@Controller
public class UpStreamController {


//	@Autowired
//	private UpStreamDAO upstreamdao; 

	@RequestMapping(path = {"/", "index.do"})
	public String getFilm() {
		//Model model
//		List<Memes> memes = dao.findAll();
//		model.addAttribute("memes", memes);
//		
		return "index";
	}
	
//	@RequestMapping(path = "**.do", method = RequestMethod.GET)
//	  public String get_Something() {
//
//	    return null;
//	  }
}
