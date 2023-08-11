package com.conversestore.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.conversestore.model.Customer;
import com.conversestore.model.Employees;

public interface EmployeeDAO extends JpaRepository<Employees, Integer> {
	@Query("select a from Employees a where a.employeeEmail=?1")
	Employees findByEmail(String Email);
	
	@Query("select a from Employees a where a.employeeEmail=?1 and a.employeePassword=?2")
	Employees findAccount(String Email, String pass);
	
	@Query("select a from Employees a where a.employeeId=?1")
	Employees findByEmployeeId(Integer employeeId);
}
