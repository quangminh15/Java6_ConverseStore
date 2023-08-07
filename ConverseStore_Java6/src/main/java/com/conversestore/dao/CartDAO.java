package com.conversestore.dao;
import org.springframework.data.jpa.repository.JpaRepository;


import com.conversestore.model.Cart;
import com.conversestore.model.Customer;


public interface CartDAO extends JpaRepository<Cart, Integer> {
	
	Cart findByCustomers(Customer customerId);
}
