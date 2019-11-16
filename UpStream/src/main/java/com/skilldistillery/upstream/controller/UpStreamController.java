package com.skilldistillery.upstream.controller;

import java.util.ArrayList;
import java.util.List;

import org.eclipse.jdt.internal.compiler.ast.ForeachStatement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.upstream.data.UpStreamDAO;
import com.skilldistillery.upstream.entities.Content;
import com.skilldistillery.upstream.entities.StreamService;

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
		mv.addObject("content", contentByService);
		mv.addObject("serv", serv);
		mv.setViewName("service");
		return mv;
	}
}
