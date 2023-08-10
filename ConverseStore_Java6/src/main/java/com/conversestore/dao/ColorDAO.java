package com.conversestore.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.conversestore.model.Colors;

public interface ColorDAO extends JpaRepository<Colors, Integer> {

	List<Colors> findByColorNameContaining(String keyword);
	
	@Query("select p from Colors p where p.colorActivities = true")
	List<Colors> findAllColorUser();

}
