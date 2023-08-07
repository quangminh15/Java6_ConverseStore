package com.conversestore.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.conversestore.model.Brands;

public interface BrandsDAO extends JpaRepository<Brands, Integer> {

	List<Brands> findByBrandNameContaining(String keyword);


}
