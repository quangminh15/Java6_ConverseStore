package com.conversestore.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.conversestore.model.Sizes;
import com.conversestore.service.SizeService;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/sizes")
public class SizeRestController {
	@Autowired
	SizeService sizeService;
	
	@GetMapping("{sizeID}")
	public Sizes getOne(@PathVariable("sizeID") Integer sizeID) {
		return sizeService.findById(sizeID);
	}
	
	@GetMapping()
	public List<Sizes> getAll() {
		return sizeService.findAll();
	}
}
