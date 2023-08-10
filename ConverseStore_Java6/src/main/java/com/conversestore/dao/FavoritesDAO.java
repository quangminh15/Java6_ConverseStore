package com.conversestore.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.conversestore.model.Favorites;

public interface FavoritesDAO extends JpaRepository<Favorites, Integer> {
//	@Query("select o from Favorites o where o.customers.customerId=?1")
//	List<Favorites> findByUsername(String username);
	@Transactional
	@Modifying
	@Query(nativeQuery = true, value = "EXEC SP_InsertFavorites1 :customerId, :productId")
	void insertCartItem(
	    @Param("customerId") int customerId,
	    @Param("productId") int productId
	);

	@Query("select p From Favorites p Where p.customers.customerId=?1")
	List<Favorites> findByCustomerId(Integer cid);

	@Query(nativeQuery = true, value = "EXEC TopFavoriteProducts")
    List<Object[]> topFavoriteProducts();
	
}
