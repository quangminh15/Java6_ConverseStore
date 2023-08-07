package com.conversestore.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	@GetMapping("{employeeEmail}")
	public Employees getOne(@PathVariable("employeeEmail") String EmpEmail) {
		return employeeservice.findByEmail(EmpEmail);
	}
	
	@PostMapping
	public Employees create(@RequestBody Employees Employee) {
		return employeeservice.create(Employee);
	}

	@PutMapping("{customerEmail}")
	public Employees update(@PathVariable("customerEmail") String CusEmail, @RequestBody Employees employee) {
		return employeeservice.update(employee);
	}
}
