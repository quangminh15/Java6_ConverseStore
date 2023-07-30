package com.conversestore.service;

import java.util.List;

import com.conversestore.model.Products;

public interface ProductService {

	Products findById(Integer productID);

	List<Products> findAll();

	List<Products> findByCategoryID(Integer cid);

}
