package com.conversestore.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.conversestore.model.Products;

public interface ProductDAO extends JpaRepository<Products, Integer> {
	
	@Query("select p from Products p where p.categories.categoryID=?1")
    Page<Products> findByCategoryID(Integer cid, Pageable pageable);

    @Query("select p from Products p where p.brands.brandID=?1")
    Page<Products> findByBrandID(Integer bid, Pageable pageable);

    @Query("select p from Products p where p.productType=?1")
    Page<Products> findByProductType(Boolean productType, Pageable pageable);

    Page<Products> findByProductNameContaining(String keyword, Pageable pageable);

    Page<Products> findAllByOrderByPriceAsc(Pageable pageable);

    Page<Products> findAllByOrderByPriceDesc(Pageable pageable);
    
	List<Products> findByProductNameContaining(String keyword);
}
