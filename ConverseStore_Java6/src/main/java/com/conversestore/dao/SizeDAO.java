package com.conversestore.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.conversestore.model.Sizes;

public interface SizeDAO extends JpaRepository<Sizes, Integer> {

}
