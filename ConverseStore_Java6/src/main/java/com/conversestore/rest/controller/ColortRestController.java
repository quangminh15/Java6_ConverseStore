package com.conversestore.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.conversestore.model.Colors;
import com.conversestore.service.ColorService;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/colors")
public class ColortRestController {
	@Autowired
	ColorService colorService;
	
	@GetMapping("{colorID}")
	public Colors getOne(@PathVariable("colorID") Integer colorID) {
		return colorService.findById(colorID);
	}
	
	@GetMapping()
	public List<Colors> getAll() {
		return colorService.findAll();
	}
}
