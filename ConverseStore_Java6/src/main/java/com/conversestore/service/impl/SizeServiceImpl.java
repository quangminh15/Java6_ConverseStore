package com.conversestore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.conversestore.dao.SizeDAO;
import com.conversestore.model.Sizes;
import com.conversestore.service.SizeService;

@Service
public class SizeServiceImpl implements SizeService {
	@Autowired
	SizeDAO sizeDAO;

	@Override
	public Sizes findById(Integer sizeID) {
		return sizeDAO.findById(sizeID).get();
	}

	@Override
	public List<Sizes> findAll() {
		return sizeDAO.findAll();
	}

	@Override
	public Sizes create(Sizes size) {
		return sizeDAO.save(size);
	}

	@Override
	public Sizes update(Sizes size) {
		return sizeDAO.save(size);
	}

	@Override
	public void delete(Integer sizeID) {
		sizeDAO.deleteById(sizeID);
		
	}
}
