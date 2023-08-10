package com.conversestore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.conversestore.dao.ProductVariantDAO;
import com.conversestore.model.ProductVariants;
import com.conversestore.service.ProductVariantService;

@Service
public class ProductVariantServiceImpl implements ProductVariantService {
	@Autowired
	ProductVariantDAO productVariantDAO;

	@Override
	public ProductVariants findById(Integer variantID) {
		return productVariantDAO.findById(variantID).get();
	}

	@Override
	public List<ProductVariants> findAll() {
		return productVariantDAO.findAll();
	}

	@Override
	public ProductVariants findBySizeAndolor(Integer sizeID, Integer colorsID, Integer productID) {
		
		return productVariantDAO.findBySizeAndolor( sizeID, colorsID, productID);
	}
	
	@Override
	public ProductVariants create(ProductVariants variant) {
		return productVariantDAO.save(variant);
	}

	@Override
	public ProductVariants update(ProductVariants variant) {
		return productVariantDAO.save(variant);
	}

	@Override
	public void delete(Integer variantID) {
		productVariantDAO.deleteById(variantID);
		
	}

	@Override
	public List<ProductVariants> findAllVariantUser() {
		return productVariantDAO.findAllVariantUser();
	}
}
