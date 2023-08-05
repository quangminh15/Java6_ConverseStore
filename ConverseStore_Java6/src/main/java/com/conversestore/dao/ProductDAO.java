package com.conversestore.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.conversestore.model.Products;

public interface ProductDAO extends JpaRepository<Products, Integer> {
	@Query("select p from Products p where p.categories.categoryID=?1")
	List<Products> findByCategoryID(Integer cid);

	@Query("select p from Products p where p.brands.brandID=?1")
	List<Products> findByBrandID(Integer bid);
	
	@Query("select p from Products p where p.productType=?1")
	List<Products> findByProductType(Boolean productType);

}
