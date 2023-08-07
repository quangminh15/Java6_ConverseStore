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

import com.conversestore.model.Suppliers;
import com.conversestore.service.SupplierService;

@CrossOrigin("*")
@RestController
@RequestMapping("/admins/supplierss")
public class SupplierRestController {
	@Autowired
	SupplierService supplierService;
	@GetMapping()
	public List<Suppliers> getAll() {
		return supplierService.findAll();
	}
	
	@GetMapping("{supplierID}")
	public Suppliers getOne(@PathVariable("supplierID") Integer id) {
		return supplierService.findById(id);
	}
	
	@PostMapping
	public Suppliers create(@RequestBody Suppliers suppliers) {
		return supplierService.create(suppliers);
	}
	
	@PutMapping("{supplierID}")
	public Suppliers update(@PathVariable("supplierID") Integer id, @RequestBody Suppliers suppliers) {
		return supplierService.update(id);
	}
	
	@DeleteMapping("{supplierID}")
	public void delete(@PathVariable("supplierID") Integer id) {
		supplierService.delete(id);
	}
}
