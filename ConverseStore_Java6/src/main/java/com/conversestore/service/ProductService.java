package com.conversestore.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.conversestore.model.Products;

public interface ProductService {

	Products findById(Integer productID);

	List<Products> findAll();
//	Page<Products> findAll(Pageable pageable);

	Products create(Products product);

	Products update(Products product);

	void delete(Integer productID);

//	Page<Products> findByCategoryID(Integer cid, Pageable pageable);
//
//	Page<Products> findByBrandID(Integer bid, Pageable pageable);
//
//	Page<Products> findByProductType(Boolean productType, Pageable pageable);
//
//	Page<Products> searchByName(String keyword, Pageable pageable);
//
//	Page<Products> sortByPriceAsc(Pageable pageable);
//
//	Page<Products> sortByPriceDesc(Pageable pageable);


	List<Products> findByCategoryID(Integer cid);

	List<Products> findByBrandID(Integer bid);
	
	List<Products> findByProductType(Boolean productType);

	List<Products> searchByName(String keyword);

	List<Products> sortByPriceAsc();

	List<Products> sortByPriceDesc();

}
