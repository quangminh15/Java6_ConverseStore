package com.conversestore.dao;
import org.springframework.data.jpa.repository.JpaRepository;

import com.conversestore.model.Categories;

public interface CategoryDAO extends JpaRepository<Categories, Integer> {

}
