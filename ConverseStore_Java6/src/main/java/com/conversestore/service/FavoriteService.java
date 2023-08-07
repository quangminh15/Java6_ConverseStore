package com.conversestore.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import com.conversestore.model.Customer;
import com.conversestore.model.Favorites;
import com.fasterxml.jackson.databind.JsonNode;

public interface FavoriteService {

//	List<Favorites> findByUsername(String username);

	Favorites create(Favorites favoData);

	List<Favorites> findAll();
	
	void  insertFavorites(Integer customerID, Integer productID);
	
	List<Favorites> findByCustomerId(Integer cid);
	
	void deleteFavorite(Integer favoriteID);

//	List<Favorites> findFavoritesByID(Integer customerID);
//
//	Optional<Favorites> findById(Integer productID);
	
//	Date add(Customer customer, Date datelike, Integer productID);

}
