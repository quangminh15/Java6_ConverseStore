package com.conversestore.service;

import java.util.List;

import com.conversestore.model.Sizes;

public interface SizeService {

	Sizes findById(Integer sizeID);

	List<Sizes> findAll();

}
