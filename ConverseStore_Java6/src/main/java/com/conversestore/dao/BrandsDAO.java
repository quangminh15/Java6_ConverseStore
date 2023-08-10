package com.conversestore.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.conversestore.model.Brands;

public interface BrandsDAO extends JpaRepository<Brands, Integer> {
	@Query("select p from Brands p where p.brandActivities = true")
	List<Brands> findAllBrandUser();

	List<Brands> findByBrandNameContaining(String keyword);


}
