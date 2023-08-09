package com.conversestore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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
	
//	@Override
//	public Page<Products> findAll(Pageable pageable) {
//		return productDAO.findAll(pageable);
//	}
	
	@Override
	public Products create(Products product) {
		return productDAO.save(product);
	}

	@Override
	public Products update(Products product) {
		return productDAO.save(product);
	}

	@Override
	public void delete(Integer productID) {
		productDAO.deleteById(productID);

	}

//	@Override
//	public Page<Products> findByCategoryID(Integer cid, Pageable pageable) {
//		return productDAO.findByCategoryID(cid, pageable);
//	}
//
//	@Override
//	public Page<Products> findByBrandID(Integer bid, Pageable pageable) {
//		return productDAO.findByBrandID(bid, pageable);
//	}
//
//	@Override
//	public Page<Products> findByProductType(Boolean productType, Pageable pageable) {
//		return productDAO.findByProductType(productType, pageable);
//	}
//
//	@Override
//	public Page<Products> sortByPriceAsc(Pageable pageable) {
//		return productDAO.findAllByOrderByPriceAsc(pageable);
//	}
//
//	@Override
//	public Page<Products> sortByPriceDesc(Pageable pageable) {
//		return productDAO.findAllByOrderByPriceDesc(pageable);
//	}

	@Override
	public List<Products> findByCategoryID(Integer cid) {
		return productDAO.findByCategoryID(cid);
	}

	@Override
	public List<Products> findByBrandID(Integer bid) {
		return productDAO.findByBrandID(bid);
	}


	@Override
	public List<Products> findByProductType(Boolean productType) {
		return productDAO.findByProductType(productType);
	}

	@Override
	public List<Products> searchByName(String keyword) {
		return productDAO.findByProductNameContaining(keyword);
	}

	@Override
	public List<Products> sortByPriceAsc() {
		return productDAO.findAllByOrderByPriceAsc();
	}

	@Override
	public List<Products> sortByPriceDesc() {
		return productDAO.findAllByOrderByPriceDesc();
	}

}
