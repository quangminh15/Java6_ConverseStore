package com.conversestore.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.conversestore.model.Favorites;

public interface FavoritesDAO extends JpaRepository<Favorites, Integer> {
//	@Query("select o from Favorites o where o.customers.customerId=?1")
//	List<Favorites> findByUsername(String username);

}
