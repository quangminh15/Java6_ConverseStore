package com.conversestore.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.conversestore.model.PromotionsProducts;

public interface PromotionsProductsDAO extends JpaRepository<PromotionsProducts, Integer> {

}
