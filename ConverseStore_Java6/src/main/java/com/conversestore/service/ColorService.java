package com.conversestore.service;

import java.util.List;

import com.conversestore.model.Colors;

public interface ColorService {

	Colors findById(Integer colorID);

	List<Colors> findAll();

	Colors create(Colors color);

	Colors update(Colors color);

	void delete(Integer colorID);

	List<Colors> searchByName(String keyword);

}
