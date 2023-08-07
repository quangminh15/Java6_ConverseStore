package com.conversestore.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import com.conversestore.model.Comment;
import com.conversestore.model.ReportCategory;

@EnableJpaRepositories
public interface CommentDAO extends JpaRepository<Comment, Integer>{
	@Query("select c from Comment c where c.products.productID=?1")
	List<Comment> findByProductID(Integer cid);
	
	@Query("select c from Comment c where c.employees.employeeId=?1")
	List<Comment> findByEmployeeID(Integer eid);
	
	@Query("select c from Comment c where c.customers.customerId=?1")
	List<Comment> findByCustomerID(Integer cusid);
	 
//	 @Query("SELECT new com.conversestore.model.ReportCategory(o.categoryName, sum(o.quantity * o.price)) "
//	            + " FROM Categories c "
//	            + " JOIN c.Products p "
//	            + " JOIN p.ProductVariants pv "
//	            + " JOIN pv.OrderDetail od "
//	            + " JOIN od.Order o"
//	            + " WHERE o.status like 'Đã giao'"
//	            + " GROUP BY c.categoryName"
//	            + " ORDER BY sum(o.quantity * o.price) DESC")
//	    List<ReportCategory> getCategoryRevenue();
	
}
