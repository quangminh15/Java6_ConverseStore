package com.conversestore.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.conversestore.model.Customer;
import com.conversestore.model.Favorites;
import com.conversestore.service.FavoriteService;

@Controller
public class FavoriteController {
	@Autowired
	FavoriteService faService;
	
	@RequestMapping("/yeuthich")
	public String list(Model model, HttpServletRequest request) {
//		String username = request.getRemoteUser();
//		model.addAttribute("yeuthich", faService.findByUsername(username));
		List<Favorites> list = faService.findAll();
		model.addAttribute("fa", list);
		
		return "user/yeuthich";
	}
}
