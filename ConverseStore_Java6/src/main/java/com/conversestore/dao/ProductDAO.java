package com.conversestore.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.conversestore.model.Categories;
import com.conversestore.model.Products;

public interface ProductDAO extends JpaRepository<Products, Integer> {
	List<Products> findByProductNameContaining(String keyword);
	
	@Query("select p from Products p where p.productActivities = true")
	List<Products> findAllProductUser();
	
	@Query("select p from Products p where p.categories.categoryID=?1")
    Page<Products> findByCategoryID(Integer cid, Pageable pageable);

    @Query("select p from Products p where p.brands.brandID=?1 and p.productActivities = true")
    Page<Products> findByBrandID(Integer bid, Pageable pageable);

    @Query("select p from Products p where p.productType=?1 and p.productActivities = true")
    Page<Products> findByProductType(Boolean productType, Pageable pageable);

    @Query("select p from Products p where p.productActivities = true and lower(p.productName) like lower(concat('%', ?1, '%'))")
    Page<Products> findByProductNameContaining(String keyword, Pageable pageable);

    @Query("select p from Products p where p.productActivities = true order by p.price asc")
    Page<Products> findAllByOrderByPriceAsc(Pageable pageable);

    @Query("select p from Products p where p.productActivities = true order by p.price desc")
    Page<Products> findAllByOrderByPriceDesc(Pageable pageable);

	@Query("select p from Products p where p.productActivities = true")
	Page<Products> findAllPaged(Pageable pageable);
	
	@Query("select p from Products p where p.brands.brandID=?1 and p.productActivities = true")
	Page<Products> findByCategoryIDPaged(Integer cid, Pageable pageable);
}
