package com.conversestore.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.conversestore.model.Products;

public interface ProductService {

	Products findById(Integer productID);

	Products create(Products product);

	Products update(Products product);

	void delete(Integer productID);
	
	Page<Products> sortByPriceAscPaged(Pageable pageable);

    Page<Products> sortByPriceDescPaged(Pageable pageable);

    Page<Products> findAllPaged(Pageable pageable);

    Page<Products> findByProductTypePaged(Boolean productType, Pageable pageable);

    Page<Products> findByCategoryIDPaged(Integer cid, Pageable pageable);

    Page<Products> findByBrandIDPaged(Integer bid, Pageable pageable);

    Page<Products> searchByNamePaged(String keyword, Pageable pageable);
	
	List<Products> findAll();
	
	List<Products> searchByName(String keyword);

	List<Products> findAllProductUser();

	

}
