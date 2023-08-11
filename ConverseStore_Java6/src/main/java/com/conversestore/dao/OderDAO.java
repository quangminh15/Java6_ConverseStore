package com.conversestore.dao;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.conversestore.model.Categories;
import com.conversestore.model.Customer;
import com.conversestore.model.Order;

public interface OderDAO extends JpaRepository<Order, Integer> {
    List<Order> findByCustomer(Customer customer);
}
