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

import com.conversestore.model.Customer;
import com.conversestore.model.Products;
import com.conversestore.service.CustomerService;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/customers")
public class CustomerRestController {
	@Autowired
	CustomerService customerservice;

	@GetMapping()
	public List<Customer> getAll() {
		return customerservice.findAll();
	}
	
	@GetMapping("{customerEmail}")
	public Customer getOne(@PathVariable("customerEmail") String CusEmail) {
		return customerservice.findByEmail(CusEmail);
	}
	
	@PostMapping
	public Customer create(@RequestBody Customer customer) {
		return customerservice.create(customer);
	}

	@PutMapping("{customerId}")
	public Customer update(@PathVariable("customerId") Integer CusId, @RequestBody Customer customer) {
		return customerservice.update(customer);
	}
	
//	@DeleteMapping("{productID}")
//	public void delete(@PathVariable("productID") Integer productID) {
//		productservice.delete(productID);
//	}
}
