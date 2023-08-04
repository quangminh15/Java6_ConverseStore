package com.conversestore.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.conversestore.model.Comment;

public interface CommentDAO extends JpaRepository<Comment, Integer>{
	@Query("select c from Comment c where c.products.productID=?1")
	List<Comment> findByProductID(Integer cid);
	
	@Query("select c from Comment c where c.employees.employeeId=?1")
	List<Comment> findByEmployeeID(Integer eid);
	
	@Query("select c from Comment c where c.customers.customerId=?1")
	List<Comment> findByCustomerID(Integer cusid);
	
	
}
