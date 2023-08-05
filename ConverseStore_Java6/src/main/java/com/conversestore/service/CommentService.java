package com.conversestore.service;

import java.util.List;

import com.conversestore.model.Comment;

public interface CommentService {
	List<Comment> findAll();
	
	Comment findById(Integer commentID);
	
	List<Comment> findByProductID(Integer cid);
	
	List<Comment> findByEmployeeID(Integer eid);
	
	List<Comment> findByCustomerID(Integer cusid);
	
	Comment update(Comment comment);
	
	void delete(Integer commentId);

}
