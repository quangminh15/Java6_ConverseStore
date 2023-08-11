package com.conversestore.service;

import java.util.List;

import com.conversestore.model.Customer;
import com.conversestore.model.Employees;

public interface EmployeeService {
	
	Employees findByEmail(String CustomerEmail);
	
	List<Employees> findAll();
	
	Employees create(Employees emp);

	Employees update(Employees emp);

	void delete(Integer EmployeeID);
	
	Employees findById(Integer employeeId);
}
