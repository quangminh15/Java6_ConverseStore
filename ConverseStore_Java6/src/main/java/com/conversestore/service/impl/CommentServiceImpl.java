package com.conversestore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.conversestore.dao.CommentDAO;
import com.conversestore.model.Comment;
import com.conversestore.model.Customer;
import com.conversestore.model.Products;
import com.conversestore.model.ReportCategory;
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

	@Override
	public Comment saveComment(Comment comment) {
		return commentDao.save(comment);
	}

	@Override
	public void createComment(Integer productID, Integer customerID, String commentText) {
        Comment comment = new Comment();
        comment.setProducts(comment.getProducts());
        comment.setCustomers(comment.getCustomers());
        comment.setComment(commentText);
        commentDao.save(comment);
    }

//	@Override
//	public List<ReportCategory> getCategoryRevenue() {
//		return commentDao.getCategoryRevenue();
//	}
}
