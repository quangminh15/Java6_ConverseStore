package com.conversestore.service;

import java.util.List;

import com.conversestore.model.Customer;
import com.conversestore.model.Products;

public interface CustomerService {
	
	Customer findByEmail(String CustomerEmail);

	List<Customer> findAll();

	Customer create(Customer customer);

	Customer update(Customer customer);

	void delete(Integer customerID);
	
	Customer findById(Integer customerID);
	
}
