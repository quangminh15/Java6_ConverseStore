package com.conversestore.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.conversestore.model.Categories;

public interface RevenueDAO extends JpaRepository<Categories, Integer>{
	@Query(nativeQuery = true, value = "exec ThongKeDoanhThuDanhMuc")
    List<Object[]> getDoanhThuDanhMuc();
}
