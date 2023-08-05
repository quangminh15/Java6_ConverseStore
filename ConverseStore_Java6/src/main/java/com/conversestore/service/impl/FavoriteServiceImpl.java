package com.conversestore.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.conversestore.dao.FavoritesDAO;
import com.conversestore.model.Favorites;
import com.conversestore.service.FavoriteService;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class FavoriteServiceImpl implements FavoriteService  {
	@Autowired 
	FavoritesDAO faDao;
	
	@Autowired
	
	
//	@Override
//	public List<Favorites> findByUsername(String username) {
//		// TODO Auto-generated method stub
//		return faDao.findByUsername(username);
//	}

	@Override
	public List<Favorites> findAll() {
		// TODO Auto-generated method stub
		return faDao.findAll();
	}

	@Override
	public Favorites create(Favorites favoData) {
	    favoData.setDateLike(new Date()); // Đặt ngày like là ngày hiện tại
	    faDao.save(favoData);
	    return favoData;
	}

}
