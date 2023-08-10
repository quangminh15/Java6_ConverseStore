package com.conversestore.service;

import java.util.List;

import com.conversestore.model.Favorites;

public interface FavoriteService {

//	List<Favorites> findByUsername(String username);

	Favorites create(Favorites favoData);

	List<Favorites> findAll();
	
	void  insertFavorites(Integer customerID, Integer productID);
	
	List<Favorites> findByCustomerId(Integer cid);
	
	void deleteFavorite(Integer favoriteID);

	List<Object[]> selectTop3();

//	List<Favorites> findFavoritesByID(Integer customerID);
//
//	Optional<Favorites> findById(Integer productID);
	
//	Date add(Customer customer, Date datelike, Integer productID);

}
