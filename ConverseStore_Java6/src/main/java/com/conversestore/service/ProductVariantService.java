package com.conversestore.service;

import java.util.List;

import com.conversestore.model.ProductVariants;

public interface ProductVariantService {

	ProductVariants findById(Integer variantID);

	List<ProductVariants> findAll();

	ProductVariants create(ProductVariants variant);

	ProductVariants update(ProductVariants variant);

	void delete(Integer variantID);


}
