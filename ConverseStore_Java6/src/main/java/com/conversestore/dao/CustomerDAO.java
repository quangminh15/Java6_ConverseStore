package com.conversestore.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.conversestore.model.Customer;

public interface CustomerDAO extends JpaRepository<Customer, Integer> {
	@Query("select a from Customer a where a.customerEmail=?1")
	Customer findByEmail(String Email);
	
	@Query("select a from Customer a where a.customerEmail=?1 and a.customerPassword=?2")
	Customer findAccount(String Email, String pass);
}
