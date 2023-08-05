package com.conversestore.service;

import java.util.List;

import com.conversestore.model.Customer;
import com.conversestore.model.Employees;

public interface EmployeeService {
	
	List<Employees> findAll();
}
