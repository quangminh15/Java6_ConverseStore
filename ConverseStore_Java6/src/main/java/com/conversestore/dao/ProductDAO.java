package com.conversestore.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.conversestore.model.Products;

public interface ProductDAO extends JpaRepository<Products, Integer> {

}
