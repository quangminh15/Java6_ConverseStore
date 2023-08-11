package com.conversestore.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.conversestore.dao.CommentDAO;
import com.conversestore.model.Comment;
import com.conversestore.model.Customer;
import com.conversestore.model.Products;
import com.conversestore.model.ReportCategory;
import com.conversestore.service.CommentService;
import com.conversestore.service.CustomerService;
import com.conversestore.service.ProductService;

@Service
public class CommentServiceImpl implements CommentService{
	
	@Autowired
	CommentDAO commentDao;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	CustomerService customerService;
	
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
	public void createComment(Integer productID, Integer customerId, String commentText) {
        Comment comment = new Comment();
        Products product = productService.findById(productID);
        Customer customer = customerService.findById(customerId);
        comment.setProducts(product);
        comment.setCustomers(customer);
        comment.setComment(commentText);
        commentDao.save(comment);
    }

	@Override
	public List<Comment> getAllNewComment() {
		return commentDao.findByStatusOrderByCreateDateDesc(false);
	}

	@Override
	public List<Comment> getAllCommentStaus() {
		return commentDao.findAllNewComment();
	}

	@Override
	public List<Comment> searchCusName(String keyword) {
		return commentDao.findByProduct(keyword);
	}

	@Override
	public Comment create(Comment comment) {
		return commentDao.save(comment);
	}

	@Override
	public void createCommentUser(Integer productID, Integer customerId, String commentText, String createDate,
			boolean status, boolean hidden) {
		commentDao.insertComment(productID, customerId, null, commentText, createDate, status, null, null, hidden);
		
	}

//	@Override
//	public List<ReportCategory> getCategoryRevenue() {
//		return commentDao.getCategoryRevenue();
//	}
}
