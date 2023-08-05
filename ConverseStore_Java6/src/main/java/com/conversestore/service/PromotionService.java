package com.conversestore.service;

import java.util.List;

import com.conversestore.model.Promotions;

public interface PromotionService {

	List<Promotions> findAll();

	Promotions create(Promotions promotions);

	Promotions update(Promotions promotion);

	Promotions findById(Integer id);

	void delete(Integer id);

}
