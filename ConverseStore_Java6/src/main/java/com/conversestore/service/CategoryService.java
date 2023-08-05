package com.conversestore.service;

import java.util.List;

import com.conversestore.model.Categories;

public interface CategoryService {

	Categories findById(Integer categoryID);

	List<Categories> findAll();

	Categories create(Categories category);

	Categories update(Categories category);

	void delete(Integer categoryID);

}
