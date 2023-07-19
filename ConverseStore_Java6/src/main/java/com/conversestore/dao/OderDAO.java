package com.conversestore.dao;
import org.springframework.data.jpa.repository.JpaRepository;

import com.conversestore.model.Categories;
import com.conversestore.model.Order;

public interface OderDAO extends JpaRepository<Order, Integer> {

}
