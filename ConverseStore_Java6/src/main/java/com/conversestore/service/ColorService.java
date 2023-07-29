package com.conversestore.service;

import java.util.List;

import com.conversestore.model.Colors;

public interface ColorService {

	Colors findById(Integer colorID);

	List<Colors> findAll();

}
