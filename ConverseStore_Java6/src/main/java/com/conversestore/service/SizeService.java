package com.conversestore.service;

import java.util.List;

import com.conversestore.model.Sizes;

public interface SizeService {

	Sizes findById(Integer sizeID);

	List<Sizes> findAll();

	Sizes create(Sizes size);

	Sizes update(Sizes size);

	void delete(Integer sizeID);

}
