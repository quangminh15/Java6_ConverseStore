package com.conversestore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.conversestore.dao.SuppliersDAO;
import com.conversestore.model.Suppliers;
import com.conversestore.service.SupplierService;

@Service
public class SupplierServiceImpl implements SupplierService {
	@Autowired
	SuppliersDAO supDao;

	@Override
	public List<Suppliers> findAll() {
		return supDao.findAll();
	}

	@Override
	public Suppliers findById(Integer id) {
		return supDao.findById(id).get();
	}

	@Override
	public Suppliers create(Suppliers suppliers) {
		return supDao.save(suppliers);
	}

	@Override
	public Suppliers update(Integer id) {
		return supDao.findById(id).get();
	}

	@Override
	public void delete(Integer id) {
		supDao.deleteById(id);
		
	}

	@Override
	public List<Suppliers> searchSupplierByName(String keyword) {
		return supDao.searchSupplierByName(keyword);
	}

	
	
	
}
