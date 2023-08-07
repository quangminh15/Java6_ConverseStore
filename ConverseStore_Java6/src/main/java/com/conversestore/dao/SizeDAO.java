package com.conversestore.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.conversestore.model.Sizes;

public interface SizeDAO extends JpaRepository<Sizes, Integer> {
	
	List<Sizes> findBySizeNumberContaining(Float keyword);

}
