package com.conversestore.service;

import java.util.List;

import com.conversestore.model.Brands;

public interface BrandService {

	Brands findById(Integer brandID);

	List<Brands> findAll();

}
