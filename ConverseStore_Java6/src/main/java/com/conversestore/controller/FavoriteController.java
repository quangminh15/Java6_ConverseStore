package com.conversestore.controller;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.conversestore.dao.CustomerDAO;
import com.conversestore.dao.FavoritesDAO;
import com.conversestore.model.Customer;
import com.conversestore.model.Favorites;
import com.conversestore.service.FavoriteService;
import com.conversestore.service.UserService;
import com.conversestore.service.impl.FavoriteServiceImpl;

@Controller
public class FavoriteController {
	
	@Autowired
	FavoriteServiceImpl favoImpl;
	
	@Autowired
	CustomerDAO cusDao;
	
	@Autowired
	FavoritesDAO favoDao;
	
	@Autowired
	UserService uService;
	
	@RequestMapping("/yeuthich")
	public String list(Model model, HttpServletRequest request, Favorites favo,Authentication  auth) {
//		String username = request.getRemoteUser();
//		model.addAttribute("yeuthich", faService.findByUsername(username));
//		List<Favorites> list = favoImpl.findFavoritesByID(3);
//		model.addAttribute("fa", list);
		System.out.println(uService.loadUserIdByAuth(auth));
		return "user/yeuthich";
	}
	
//	@RequestMapping("/addFavorite/{productID}")
//	public String add(@PathVariable("productID") Integer productID, Model model) {
//		Customer cus = cusDao.findById(3).get();
//		Date da = favoImpl.add(cus, null, productID);
//		return "redirect:/yeuthich";
//	}
}
