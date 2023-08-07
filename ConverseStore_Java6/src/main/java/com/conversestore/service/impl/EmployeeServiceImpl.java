package com.conversestore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.conversestore.dao.CustomerDAO;
import com.conversestore.dao.EmployeeDAO;
import com.conversestore.model.Customer;
import com.conversestore.model.Employees;
import com.conversestore.service.CustomerService;
import com.conversestore.service.EmployeeService;

@Service
public class EmployeeServiceImpl implements EmployeeService{
	@Autowired
	EmployeeDAO employeeDao;
	
	@Override
	public List<Employees> findAll() {
		return employeeDao.findAll();
	}

	@Override
	public Employees findByEmail(String EmployeeEmail) {
		employeeDao.findByEmail(EmployeeEmail);
		return null;
	}

	@Override
	public Employees create(Employees emp) {
		employeeDao.save(emp);
		return null;
	}

	@Override
	public Employees update(Employees emp) {
		employeeDao.save(emp);
		return null;
	}

	@Override
	public void delete(Integer EmployeeID) {
		employeeDao.delete(employeeDao.findById(EmployeeID).get());
		
	}
}
