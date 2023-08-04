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

import com.conversestore.model.Categories;
import com.conversestore.model.Categories;
import com.conversestore.service.CategoryService;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/categories")
public class CategoryRestController {
	@Autowired
	CategoryService categoryService;

	@GetMapping("{categoryID}")
	public Categories getOne(@PathVariable("categoryID") Integer categoryID) {
		return categoryService.findById(categoryID);
	}

	@GetMapping()
	public List<Categories> getAll() {
		return categoryService.findAll();
	}

	@PostMapping
	public Categories create(@RequestBody Categories category) {
		return categoryService.create(category);
	}

	@PutMapping("{categoryID}")
	public Categories update(@PathVariable("categoryID") Integer categoryID, @RequestBody Categories category) {
		return categoryService.update(category);
	}

	@DeleteMapping("{categoryID}")
	public void delete(@PathVariable("categoryID") Integer categoryID) {
		categoryService.delete(categoryID);
	}
}
