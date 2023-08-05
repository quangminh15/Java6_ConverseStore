package com.conversestore.service;

import java.util.List;

import com.conversestore.model.Suppliers;

public interface SupplierService {

	List<Suppliers> findAll();

	Suppliers findById(Integer id);

	Suppliers create(Suppliers suppliers);

	Suppliers update(Integer id);

	void delete(Integer id);

	

}
