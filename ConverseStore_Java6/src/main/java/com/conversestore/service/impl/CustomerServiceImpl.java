package com.conversestore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.conversestore.dao.CustomerDAO;
import com.conversestore.model.Customer;
import com.conversestore.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService{
	@Autowired
	CustomerDAO customerDao;
	
	@Override
	@Transactional
	public List<Customer> findAll() {
		return customerDao.findAll();
	}

	@Override
	@Transactional
	public Customer findByEmail(String CustomerEmail) {
		
		return customerDao.findByEmail(CustomerEmail);
	}

	@Override
	@Transactional
	public Customer create(Customer customer) {
		
		return customerDao.save(customer);
	}

	@Override
	@Transactional
	public Customer update(Customer customer) {
		
		return customerDao.save(customer);
	}

	@Override
	@Transactional
	public void delete(Integer customerID) {
		customerDao.delete(customerDao.findById(customerID).get());
		
	}

	@Override
	public Customer findById(Integer customerID) {
		return customerDao.findById(customerID).get();
	}
}
