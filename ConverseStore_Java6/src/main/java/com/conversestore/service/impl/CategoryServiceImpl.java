package com.conversestore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.conversestore.dao.CategoryDAO;
import com.conversestore.model.Categories;
import com.conversestore.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	CategoryDAO categoryDAO;

	@Override
	public Categories findById(Integer categoryID) {
		return categoryDAO.findById(categoryID).get();
	}

	@Override
	public List<Categories> findAll() {
		return categoryDAO.findAll();
	}

	@Override
	public Categories create(Categories category) {
		return categoryDAO.save(category);
	}

	@Override
	public Categories update(Categories category) {
		return categoryDAO.save(category);
	}

	@Override
	public void delete(Integer categoryID) {
		categoryDAO.deleteById(categoryID);
		
	}
}
