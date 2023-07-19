package com.conversestore.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.conversestore.model.Suppliers;

public interface SuppliersDAO extends JpaRepository<Suppliers, Integer> {

}
