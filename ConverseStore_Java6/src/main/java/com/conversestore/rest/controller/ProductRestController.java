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

import com.conversestore.model.Products;
import com.conversestore.service.ProductService;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/products")
public class ProductRestController {
	@Autowired
	ProductService productservice;
	
	@GetMapping("{productID}")
	public Products getOne(@PathVariable("productID") Integer productID) {
		return productservice.findById(productID);
	}
	
	@GetMapping()
	public List<Products> getAll() {
		return productservice.findAll();
	}
	
	@PostMapping
	public Products create(@RequestBody Products product) {
		return productservice.create(product);
	}
	
	@PutMapping("{productID}")
	public Products update(@PathVariable("productID") Integer productID, @RequestBody Products product) {
		return productservice.update(product);
	}
	
	@DeleteMapping("{productID}")
	public void delete(@PathVariable("productID") Integer productID) {
		productservice.delete(productID);
	}
}
