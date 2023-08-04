package com.conversestore.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.conversestore.model.Colors;
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
	
	@PostMapping
	public Colors create(@RequestBody Colors color) {
		return colorService.create(color);
	}

	@PutMapping("{colorID}")
	public Colors update(@PathVariable("colorID") Integer colorID, @RequestBody Colors color) {
		return colorService.update(color);
	}

	@DeleteMapping("{colorID}")
	public void delete(@PathVariable("colorID") Integer colorID) {
		colorService.delete(colorID);
	}
}
