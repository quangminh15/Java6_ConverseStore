package com.conversestore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.conversestore.dao.ProductDAO;
import com.conversestore.model.Products;
import com.conversestore.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	ProductDAO productDAO;

	@Override
	public Products findById(Integer productID) {
		return productDAO.findById(productID).get();
	}

	@Override
	public List<Products> findAll() {
		return productDAO.findAll();
	}

	@Override
	public List<Products> findByCategoryID(Integer cid) {
		return productDAO.findByCategoryID(cid);
	}
}
