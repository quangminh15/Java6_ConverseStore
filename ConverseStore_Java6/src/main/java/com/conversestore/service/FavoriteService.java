package com.conversestore.service;

import java.util.List;

import com.conversestore.model.Favorites;
import com.fasterxml.jackson.databind.JsonNode;

public interface FavoriteService {

//	List<Favorites> findByUsername(String username);

	Favorites create(Favorites favoData);

	List<Favorites> findAll();

}
