package com.conversestore.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.conversestore.model.SupplierProducts;

public interface SupplierProductsDAO extends JpaRepository<SupplierProducts, Integer> {

}
