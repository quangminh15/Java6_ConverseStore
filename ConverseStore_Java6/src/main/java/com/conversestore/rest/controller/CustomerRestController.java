package com.conversestore.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.conversestore.model.Customer;
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
}
