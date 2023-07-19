package com.conversestore.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.conversestore.model.Favorites;

public interface FavoritesDAO extends JpaRepository<Favorites, Integer> {

}
