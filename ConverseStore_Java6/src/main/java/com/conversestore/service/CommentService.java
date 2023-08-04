package com.conversestore.service;

import java.util.List;

import com.conversestore.model.Comment;

public interface CommentService {
	List<Comment> findAll();
	
	List<Comment> findByProductID(Integer cid);

}
