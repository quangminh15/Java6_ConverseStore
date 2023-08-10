package com.conversestore.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.conversestore.dao.FavoritesDAO;
import com.conversestore.dao.ProductDAO;
import com.conversestore.model.Favorites;
import com.conversestore.service.FavoriteService;

@Service
public class FavoriteServiceImpl implements FavoriteService {
	@Autowired
	FavoritesDAO faDao;

	@Autowired
	ProductDAO proDao;

	// @Override
	// public List<Favorites> findByUsername(String username) {
	// return faDao.findByUsername(username);
	// }

	@Override
	public List<Favorites> findAll() {
		return faDao.findAll();
	}

	@Override
	public Favorites create(Favorites favoData) {
		favoData.setDateLike(new Date()); // Đặt ngày like là ngày hiện tại
		faDao.save(favoData);
		return favoData;
	}

	@Override
	public void insertFavorites(Integer customerID, Integer productID) {
		faDao.insertCartItem(customerID, productID);
	}

	@Override
	public List<Favorites> findByCustomerId(Integer cid) {
		// TODO Auto-generated method stub
		return faDao.findByCustomerId(cid);
	}

	@Override
	public void deleteFavorite(Integer favoriteID) {
		faDao.deleteById(favoriteID);

	}

	@Override
	public List<Object[]> selectTop3() {
		return faDao.topFavoriteProducts();
	}

}
