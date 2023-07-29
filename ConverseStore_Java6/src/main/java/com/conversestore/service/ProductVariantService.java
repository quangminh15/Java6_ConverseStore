package com.conversestore.service;

import java.util.List;

import com.conversestore.model.ProductVariants;

public interface ProductVariantService {

	ProductVariants findById(Integer variantID);

	List<ProductVariants> findAll();

}
