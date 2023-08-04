package com.conversestore.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.conversestore.model.ProductVariants;

public interface ProductVariantDAO extends JpaRepository<ProductVariants, Integer> {


}
