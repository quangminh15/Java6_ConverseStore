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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.conversestore.model.Categories;
import com.conversestore.model.Sizes;
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
	
	@PostMapping
	public Sizes create(@RequestBody Sizes size) {
		return sizeService.create(size);
	}

	@PutMapping("{sizeID}")
	public Sizes update(@PathVariable("sizeID") Integer sizeID, @RequestBody Sizes size) {
		return sizeService.update(size);
	}

	@DeleteMapping("{sizeID}")
	public void delete(@PathVariable("sizeID") Integer sizeID) {
		sizeService.delete(sizeID);
	}
	
	@GetMapping("/search")
    public List<Sizes> searchSizeByName(@RequestParam("keyword") Float keyword) {
        return sizeService.searchByName(keyword);
    }
}
