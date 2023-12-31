package com.conversestore.dao;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.conversestore.model.Categories;

public interface CategoryDAO extends JpaRepository<Categories, Integer> {
	
	List<Categories> findByCategoryNameContaining(String keyword);

	@Query("select p from Categories p where p.categoryActivities = true")
	List<Categories> findAllCategoryUser();
}
