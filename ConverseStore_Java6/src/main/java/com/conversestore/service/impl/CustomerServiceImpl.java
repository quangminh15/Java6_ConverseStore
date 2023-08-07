package com.conversestore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.conversestore.dao.CustomerDAO;
import com.conversestore.model.Customer;
import com.conversestore.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService{
	@Autowired
	CustomerDAO customerDao;
	
	@Override
	public List<Customer> findAll() {
		return customerDao.findAll();
	}

	@Override
	public Customer findByEmail(String CustomerEmail) {
		customerDao.findByEmail(CustomerEmail);
		return null;
	}

	@Override
	public Customer create(Customer customer) {
		customerDao.save(customer);
		return null;
	}

	@Override
	public Customer update(Customer customer) {
		customerDao.save(customer);
		return null;
	}

	@Override
	public void delete(Integer customerID) {
		customerDao.delete(customerDao.findById(customerID).get());
		
	}
}
