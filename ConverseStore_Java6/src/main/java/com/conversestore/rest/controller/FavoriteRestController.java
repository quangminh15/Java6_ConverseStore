package com.conversestore.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.conversestore.model.Favorites;
import com.conversestore.service.FavoriteService;
import com.conversestore.service.UserService;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/favorite")
public class FavoriteRestController {
	@Autowired
	FavoriteService faService;

	@Autowired 
	UserService uService;
	
//	@GetMapping()
//	public List<Favorites> getAll(){
//		return faService.findAll();
//	}
	
	@GetMapping
	public List<Favorites> getOne(Authentication auth){
		return faService.findByCustomerId(uService.loadUserIdByAuth(auth));
	}
	
	@PostMapping()
	public void insertFavorites(@RequestParam("id") Integer productId, Authentication auth) {
	    faService.insertFavorites(uService.loadUserIdByAuth(auth), productId);
	}
	
	@DeleteMapping("{id}")
	public void delete(@PathVariable("id") Integer id) {
		faService.deleteFavorite(id);
	}

	@GetMapping("/top3")
	public List<Object[]> selectTop3(){
		return faService.selectTop3();
	}
}
