package com.conversestore.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.conversestore.model.ProductVariants;
import com.conversestore.service.ProductVariantService;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/productvariants")
public class ProductVariantRestController {
	@Autowired
	ProductVariantService ProductVariantservice;
	
	@GetMapping("{variantID}")
	public ProductVariants getOne(@PathVariable("variantID") Integer variantID) {
		return ProductVariantservice.findById(variantID);
	}
	
	@GetMapping()
	public List<ProductVariants> getAll() {
		return ProductVariantservice.findAll();
	}
}
