package com.conversestore.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.conversestore.model.ProductVariants;
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
	
	@PostMapping
	public ProductVariants create(@RequestBody ProductVariants variant) {
		return ProductVariantservice.create(variant);
	}

	@PutMapping("{variantID}")
	public ProductVariants update(@PathVariable("variantID") Integer variantID, @RequestBody ProductVariants variant) {
		return ProductVariantservice.update(variant);
	}

	@DeleteMapping("{variantID}")
	public void delete(@PathVariable("variantID") Integer variantID) {
		ProductVariantservice.delete(variantID);
	}
	
//	hai
	@GetMapping("{prodID}/addToCart")
	public ProductVariants findVariantProdAddToCart(@Param("size") Integer size,@Param("color") Integer color, @PathVariable("prodID")Integer idProd) {
		return ProductVariantservice.findBySizeAndolor(size, color, idProd);
	}
	}
