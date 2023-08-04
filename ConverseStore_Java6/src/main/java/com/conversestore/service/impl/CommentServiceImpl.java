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

	@Override
	public List<Comment> findByEmployeeID(Integer eid) {
		return commentDao.findByEmployeeID(eid);
	}

	@Override
	public List<Comment> findByCustomerID(Integer cusid) {
		return commentDao.findByCustomerID(cusid);
	}

	@Override
	public Comment update(Comment comment) {
		return commentDao.save(comment);
	}

	@Override
	public void delete(Integer commentId) {
		commentDao.deleteById(commentId);
	}

	@Override
	public Comment findById(Integer commentID) {
		return commentDao.findById(commentID).get();
	}
}