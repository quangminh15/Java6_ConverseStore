package com.conversestore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.conversestore.dao.CommentDAO;
import com.conversestore.model.Comment;
import com.conversestore.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService{
	
	@Autowired
	CommentDAO commentDao;
	
	@Override
	public List<Comment> findAll(){
		return commentDao.findAll();
	}
	
	@Override
	public List<Comment> findByProductID(Integer cid) {
		return commentDao.findByProductID(cid);
	}
}
