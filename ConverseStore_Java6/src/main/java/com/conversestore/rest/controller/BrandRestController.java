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

import com.conversestore.model.Brands;
import com.conversestore.model.Products;
import com.conversestore.service.BrandService;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/brands")
public class BrandRestController {
	@Autowired
	BrandService BrandService;
	
	@GetMapping("{brandID}")
	public Brands getOne(@PathVariable("brandID") Integer brandID) {
		return BrandService.findById(brandID);
	}
	
	@GetMapping()
	public List<Brands> getAll() {
		return BrandService.findAll();
	}
	
	@PostMapping
	public Brands create(@RequestBody Brands brand) {
		return BrandService.create(brand);
	}

	@PutMapping("{brandID}")
	public Brands update(@PathVariable("brandID") Integer brandID, @RequestBody Brands brand) {
		return BrandService.update(brand);
	}
	
	@DeleteMapping("{brandID}")
	public void delete(@PathVariable("brandID") Integer brandID) {
		BrandService.delete(brandID);
	}
}
