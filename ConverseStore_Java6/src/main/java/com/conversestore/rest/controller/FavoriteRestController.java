package com.conversestore.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/favorite")
public class FavoriteRestController {
	@Autowired
	FavoriteService faService;
	
//	@GetMapping()
//	public List<Favorites> getAll(){
//		return faService.findAll();
//	}
	
	@GetMapping
	public List<Favorites> getOne(){
		return faService.findByCustomerId(2);
	}
	
	@PostMapping()
	public void insertFavorites(@RequestParam("id") Integer productId) {
	    faService.insertFavorites(2, productId);
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
