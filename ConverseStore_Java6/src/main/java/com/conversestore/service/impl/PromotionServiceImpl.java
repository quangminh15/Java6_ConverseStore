package com.conversestore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.conversestore.dao.PromotionsDAO;
import com.conversestore.model.Promotions;
import com.conversestore.service.PromotionService;

@Service
public class PromotionServiceImpl implements PromotionService {
	@Autowired
	PromotionsDAO proDao;
	
	
	@Override
	public List<Promotions> findAll() {
		// TODO Auto-generated method stub
		return proDao.findAll();
	}


	@Override
	public Promotions create(Promotions promotions) {
		// TODO Auto-generated method stub
		return proDao.save(promotions);
	}


	@Override
	public Promotions update(Promotions promotion) {
		// TODO Auto-generated method stub
		return proDao.save(promotion);
	}


	@Override
	public Promotions findById(Integer id) {
		// TODO Auto-generated method stub
		return proDao.findById(id).get();
	}


	@Override
	public void delete(Integer id) {
		proDao.deleteById(id);
		
	}

}
