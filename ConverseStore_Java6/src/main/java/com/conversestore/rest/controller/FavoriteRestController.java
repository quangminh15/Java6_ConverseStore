package com.conversestore.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.conversestore.model.Favorites;
import com.conversestore.service.FavoriteService;
import com.fasterxml.jackson.databind.JsonNode;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/favorite")
public class FavoriteRestController {
	@Autowired
	FavoriteService faService;
	
	@GetMapping()
	public List<Favorites> getAll(){
		return faService.findAll();
	}
	
	@PostMapping()
	public Favorites create(@RequestBody Favorites favoData) {
		return faService.create(favoData);
	}
}
