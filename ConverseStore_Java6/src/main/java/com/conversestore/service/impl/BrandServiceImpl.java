package com.conversestore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

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

	@Override
	public Brands create(Brands brand) {
		return brandDAO.save(brand);
	}

	@Override
	public Brands update(Brands brand) {
		return brandDAO.save(brand);
	}

	@Override
	public void delete(Integer brandID) {
		brandDAO.deleteById(brandID);
	}

	@Override
	public List<Brands> searchByName(String keyword) {
		return brandDAO.findByBrandNameContaining(keyword);
	}

	@Override
	public List<Brands> findAllBrandUser() {
		return brandDAO.findAllBrandUser();
	}

	
}
