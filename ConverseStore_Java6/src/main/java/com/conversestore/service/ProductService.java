package com.conversestore.service;

import java.util.List;

import com.conversestore.model.Products;

public interface ProductService {

	Products findById(Integer productID);

	List<Products> findAll();

	List<Products> findByCategoryID(Integer cid);

	List<Products> findByBrandID(Integer bid);

	Products create(Products product);

	Products update(Products product);

	void delete(Integer productID);
	
	List<Products> findByProductType(Boolean productType);

}
