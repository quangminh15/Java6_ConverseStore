package com.conversestore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.conversestore.model.ProductVariants;

public interface ProductVariantDAO extends JpaRepository<ProductVariants, Integer> {

	
	@Query("Select p from ProductVariants p where p.sizes.sizeID = ?1 and p.colors.colorID =?2 and p.products.productID=?3")
	ProductVariants findBySizeAndolor(Integer sizeID, Integer colorID, Integer productID);
	
	
}
