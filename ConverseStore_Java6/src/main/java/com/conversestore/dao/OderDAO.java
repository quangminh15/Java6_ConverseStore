package com.conversestore.dao;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.conversestore.model.Categories;
import com.conversestore.model.Customer;
import com.conversestore.model.Order;

public interface OderDAO extends JpaRepository<Order, Integer> {
    List<Order> findByCustomer(Customer customer);

    @Query(value = "SELECT o FROM Order o ORDER BY ABS(TIMESTAMPDIFF(SECOND, o.orderdate, CURRENT_TIMESTAMP()))")
    Order findNearestOrder();
}
