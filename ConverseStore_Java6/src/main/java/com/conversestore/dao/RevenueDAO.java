package com.conversestore.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.conversestore.model.Categories;

public interface RevenueDAO extends JpaRepository<Categories, Integer>{

}
