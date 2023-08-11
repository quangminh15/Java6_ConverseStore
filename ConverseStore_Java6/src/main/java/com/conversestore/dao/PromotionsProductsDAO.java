package com.conversestore.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.conversestore.model.PromotionsProducts;

public interface PromotionsProductsDAO extends JpaRepository<PromotionsProducts, Integer> {

	@Query("select p from PromotionsProducts p where p.products.productActivities = true")
	List<PromotionsProducts> findAllUser();

}
