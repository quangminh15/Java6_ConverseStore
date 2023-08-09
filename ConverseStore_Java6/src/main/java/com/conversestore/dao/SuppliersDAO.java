package com.conversestore.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.conversestore.model.Suppliers;

public interface SuppliersDAO extends JpaRepository<Suppliers, Integer> {
    @Query(nativeQuery = true, value = "EXEC SearchSupplierByNameAndDetails :keyword")
    List<Suppliers> searchSupplierByName(@Param("keyword") String keyword);
}
