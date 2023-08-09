package com.conversestore.service;

import java.util.List;

import com.conversestore.model.Comment;
import com.conversestore.model.Products;
import com.conversestore.model.ReportCategory;

public interface CommentService {
	List<Comment> findAll();
	
	Comment findById(Integer commentID);
	
	List<Comment> findByProductID(Integer cid);
	
	List<Comment> findByEmployeeID(Integer eid);
	
	List<Comment> findByCustomerID(Integer cusid);
	
	Comment update(Comment comment);
	
	void delete(Integer commentId);	
	
	Comment saveComment(Comment comment);

	void createComment(Integer productID, Integer customerId, String commentText);
	
	 List<Comment> getAllNewComment();
	 
	 List<Comment> getAllCommentStaus();
	 
	 List<Comment> searchCusName(String keyword);
	 
	 Comment create(Comment comment);
	
//	List<ReportCategory> getCategoryRevenue();

}
