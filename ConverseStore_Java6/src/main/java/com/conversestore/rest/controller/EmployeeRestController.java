package com.conversestore.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.conversestore.model.Customer;
import com.conversestore.model.Employees;
import com.conversestore.service.CustomerService;
import com.conversestore.service.EmployeeService;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/employees")
public class EmployeeRestController {
	@Autowired
	EmployeeService employeeservice;

	@GetMapping()
	public List<Employees> getAll() {
		return employeeservice.findAll();
	}
}
