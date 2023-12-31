package com.conversestore.dao;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;

import com.conversestore.model.Comment;
import com.conversestore.model.Products;
import com.conversestore.model.ReportCategory;

@EnableJpaRepositories
public interface CommentDAO extends JpaRepository<Comment, Integer>{
	@Query("select c from Comment c where c.products.productID=?1")
	List<Comment> findByProductID(Integer cid);
	
	@Query("select c from Comment c where c.employees.employeeId=?1")
	List<Comment> findByEmployeeID(Integer eid);
	
	@Query("select c from Comment c where c.customers.customerId=?1")
	List<Comment> findByCustomerID(Integer cusid);
	
	@Query("select c from Comment c order by c.status asc")
	List<Comment> findAllNewComment();
	 
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
	
	 List<Comment> findByStatusOrderByCreateDateDesc(boolean status);
	 
	 @Query("select c from Comment c where c.products.productName like %?1% ")
	 List<Comment> findByProduct(String keyword);
	 
	 @Procedure(name = "InsertComment")
	    void insertComment(
	            @Param("product_id") Integer productId,
	            @Param("customer_id") Integer customerId,
	            @Param("employee_id") Integer employeeId,
	            @Param("comment") String comment,
	            @Param("create_date") String createDate,
	            @Param("status") boolean status,
	            @Param("admin_reply") String adminReply,
	            @Param("date_reply") String dateReply,
	            @Param("hidden") boolean hidden
	    );
	
}
