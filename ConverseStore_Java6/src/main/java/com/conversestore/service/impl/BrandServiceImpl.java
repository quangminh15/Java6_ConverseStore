package com.conversestore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.conversestore.dao.BrandsDAO;
import com.conversestore.model.Brands;
import com.conversestore.service.BrandService;

@Service
public class BrandServiceImpl implements BrandService {
	@Autowired
	BrandsDAO brandDAO;

	@Override
	public Brands findById(Integer brandID) {
		return brandDAO.findById(brandID).get();
	}

	@Override
	public List<Brands> findAll() {
		return brandDAO.findAll();
	}
}
