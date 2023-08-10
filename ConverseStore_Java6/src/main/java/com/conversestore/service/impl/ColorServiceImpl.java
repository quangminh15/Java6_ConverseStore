package com.conversestore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.conversestore.dao.ColorDAO;
import com.conversestore.model.Colors;
import com.conversestore.service.ColorService;

@Service
public class ColorServiceImpl implements ColorService {
	@Autowired
	ColorDAO colorDAO;

	@Override
	public Colors findById(Integer colorID) {
		return colorDAO.findById(colorID).get();
	}

	@Override
	public List<Colors> findAll() {
		return colorDAO.findAll();
	}

	@Override
	public Colors create(Colors color) {
		return colorDAO.save(color);
	}

	@Override
	public Colors update(Colors color) {
		return colorDAO.save(color);
	}

	@Override
	public void delete(Integer colorID) {
		colorDAO.deleteById(colorID);
		
	}

	@Override
	public List<Colors> searchByName(String keyword) {
		return colorDAO.findByColorNameContaining(keyword);
	}

	@Override
	public List<Colors> findAllColorUser() {
		return colorDAO.findAllColorUser();
	}
}
