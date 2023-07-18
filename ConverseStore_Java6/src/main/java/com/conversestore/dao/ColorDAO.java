package com.conversestore.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.conversestore.model.Colors;

public interface ColorDAO extends JpaRepository<Colors, Integer> {

}
