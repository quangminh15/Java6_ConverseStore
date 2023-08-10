package com.conversestore.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.conversestore.model.ProductVariants;

public interface ProductVariantDAO extends JpaRepository<ProductVariants, Integer> {

	
	@Query("Select p from ProductVariants p where p.sizes.sizeID = ?1 and p.colors.colorID =?2 and p.products.productID=?3")
	ProductVariants findBySizeAndolor(Integer sizeID, Integer colorID, Integer productID);

	@Query("select p from ProductVariants p where p.products.productActivities = true and  p.colors.colorActivities = true and  p.sizes.sizeActivities = true")
	List<ProductVariants> findAllVariantUser();
	
	

}
